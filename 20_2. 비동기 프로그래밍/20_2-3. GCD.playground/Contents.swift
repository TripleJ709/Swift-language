import UIKit

/*
 1. GCD
 GCD를 DispatchQueue라고 이해해도 충분하다.
 GCD에는 크게 3가지의 종류가 있는데 DispatchQueue.main, DispatchQueue.global, DispatchQueue custom 으로 볼 수 있다.
 간단하게 설명하자면 main은 메인스레드를 의미한다. 어떤 경우 메인에서 실행해야만 하는 상황이 있다.(UI그리기와 같은 작업)
 global은 6가지 Qos에 따른 작업을 나눌 수 있고 다른 스레드로 작업을 보낸다.
 custom은 직렬큐를 만든것 처럼 개발자가 직접 큐 객체를 생성해 직렬상태로 만들 수 있다. 물론 동시큐로 만드는 것도 가능하다.
 
 Qos는 시스템 우선순위에 따라 더 많은 스레드를 배치하고 배터리를 집중하게 한다. global(Qos: )로 돼 있어 사용하면 된다.
 대부분 defalut를 사용하며 global()로 쓰면 디폴트가 된다. 총 6가지가 있지만 굳이 외울 필요 없이 필요할때마다 찾아 쓰면 될 것 같다.
 */




/*
 2. GCD 주의사항
 */

// 반드시 메인큐에서 처리해야하는 작업들(UI등)
DispatchQueue.global().async {
    // 특정 작업 후
    
    DispatchQueue.main.async {
        UIImage(named: "")      // 이미지와 관련된 생성자이다. UI에 이미지를 그리는 작업이므로 메인큐를 불러야한다. 만약 메인큐를 부르지 않으면 에러가 난다.
    }
}


// 컴플리션 핸들러의 존재 이유 (매우 중요하므로 반드시 이해해야만 한다.)
func getImages(with urlString: String) -> UIImage? {    // 리턴값을 직접 명시한 경우(함수나 메서드를 이렇게 설계하면 절대 안된다.
    let url = URL(string: urlString)!
    var photoImage: UIImage? = nil
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in  // 참고로 네트워킹 코드인 URLSession은 내부적으로 비동기처리가 되어 있는 함수다. 간단한 예시를 위해 클로저를 최대한 간단하게 처리함.
        guard let imageData = data else { return }
        photoImage = UIImage(data: imageData)                           // 여기서 네트워크 통신을 이용해 받아온 코드를 변수에 할당하고 있다.
    }.resume()                                                          // 하지만 이 코드는 비동기적으로 동작하기 때문에 URLSession을 실행한 즉시 다음 코드로 넘어간다. 즉, 42번째 줄로 넘어가 실행한다.
    
    return photoImage                                                   // 바로 이 코드를 실행하지만 아직 네트워크 통신 코드가 끝나지 않았기 때문에 이 코드를 실행하는 지금 photoImage는 아직 nil이다.
}                                                                       // 즉, 이 함수를 실행하면 반드시 nil값만 나온다.

func properlyGetImages(with urlString: String, completionHandler: @escaping (UIImage?) -> Void) {   // 반드시 콜백함수를 사용해서 사후처리로 실행해야한다.
    let url = URL(string: urlString)!
    var photoImage: UIImage? = nil
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let imageData = data else { return }
        photoImage = UIImage(data: imageData)
        completionHandler(photoImage)                                                               // 여기서 함수를 받아 사후적으로 처리를 해야만 개발자가 원하는 작업 수행이 가능하다.
    }.resume()
}

properlyGetImages(with: "https://bit.ly/32ps0DI") { (image) in                                      // 이 방법으로 함수를 실행해야 원하는 결과를 얻을 수 있다.
    DispatchQueue.main.async {
        // 이미지이므로 UI관련 처리 코드는 여기서
    }
}


// weakSelf, strong
class ViewController: UIViewController {
    var name: String = "ViewController"
    
    func doSomething() {
        DispatchQueue.global().async { [weak self] in       // 어떤 클래스 안에서 클로저를 쓸 경우 self는 자신을 강하게 참조한다는 것을 배웠다. 다른 스레드에서 클로저를 사용하는 경우 오래 붙잡아 둘 필요가 없을 때 weak self를 사용하는게 좋다.
            guard let self = self else { return }
            sleep(3)
            
            DispatchQueue.main.async {
                print("메인 큐에서 실행: \(self.name)")
            }
        }
    }
    
    deinit {
        print("\(self.name) 메모리 해제")
    }
}

@MainActor func localScopeFunction1() {
    let vc = ViewController()
    vc.doSomething()
}


// 동기함수를 비동기적으로 동작하게 만드는 함수
func doSomething() {    // 이렇게 동기 함수를 만들면 메인스레드에 부하가 걸리며 버벅거림이 나올 수 있다.
    print("프린트 시작")
    sleep(3)
    print("프린트 종료")
}

print("1")
doSomething()
print("2")

func doSomething1(com: @escaping () -> Void) {  // 오래 걸리는 함수를 만들때 비동기적으로 처리할 수 있다.
    DispatchQueue.global( ).async {
        print("프린트 시작")
        sleep(3)
        print("프린트 종료")
        com()
    }
}

print("1")
doSomething1 {
    //어떤 처리
}
print("2")




/*
 3. 참고
 스위프트 5.5버전 이후 async, await이라는 키워드가 생겼다. 여러 비동기처리 함수를 만나면 콜백와 콜백의 연속이기에 가독성이 떨어질 수 있다.
 우선 비동기에 대한 이해가 먼저이므로 아직은 배울 필요가 없다고 생각이 드는데, 추후 비동기에 대한 이해를 하고 난 후 코드의 불편함을 느낀다면 await까지 공부해보는 것이 좋을 것 같다.
 */
