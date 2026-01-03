import UIKit

/*
 1. 클로저의 메모리 구조
 우선 클로저는 클래스와 같이 힙에 저장된다. 클래스처럼 따로 인스턴스를 생성하진 않지만
 클로저 또한 함수의 형태이고 함수는 코드 영역에 묶음으로 존재한다. 그 시작점을 갖는 주소 값을 클로저가 힙 영역에 갖고 있게 된다.(물론 단순히 주소값만 가지진 않는다. 아래 캡처를 보면서 알게 될 것이다.)
 */




/*
 2. 클로저의 캡처
 */

var stored = 0

let closure = { (number: Int) -> Int in     // 숫자를 더한 뒤 리턴하는 일반적인 클로저
    stored += number
    return stored
}

closure(3)
closure(4)      // 이렇게 실행하면 각 값이 3, 7이 나오는 것을 볼 수 있다. 어떻게 보면 stored가 외부의 값이 있고 3을 더한뒤 4를 더했기 때문에 당연하게 볼 수 있다.


func calulate(number: Int) -> Int {
    var sum = 0
    
    func square(num: Int) -> Int {
        sum += num * num
        return sum
    }
    
    let result = square(num: number)
    return result
}

calulate(number: 10) // 이렇게 실행하면 각 값은 100, 400, 900이 나온다. 함수는 스택 영역에 생성되고 사라지기 때문에 값이 저장이 되지 않고 함수가 끝날때 sum값도 같이 사라지게 된다.
calulate(number: 20)
calulate(number: 30)



func calculate2() -> ((Int) -> Int) { // 위 예시와 완전히 동일한 로직이지만 리턴만 값이 아닌 함수를 반환하고 있다.
    var sum = 0
    
    func square(num: Int) -> Int {
        sum += num * num
        return sum
    }
    
    return square
}

var varCalc = calculate2()  // 이렇게 변수에 함수를 담는 순간 아래와 같은 상황이 나온다.

varCalc(10)                 // 값이 초기화되지 않고 계속 합쳐져서 나오게 된다. 이를 클로저 캡처 현상이라고 하는데
varCalc(20)                 // 클로저는 힙 영역에 저장되게 되고 위와 같이 함수에서 외부 변수를 사용할 때 나타난다. 56번째 줄에서 함수를 호출했지만 호출이 끝나서 varCalc변수에 들어가게 되었고 함수는 종료가 됐다. 그럼 스택영역에는 함수가 없게 되면서
varCalc(30)                 // 이 함수는 클로저처럼 힙 영역에 만들어지게 되고 값으로는 힙 영역 주소값을 갖고, 해당 영역에는 코드영역 주소값 뿐 아니라 sum변수또한 참조하게 된다. 따라서 10, 20, 30을 순서대로 했을 때 값이 초기화되지 않고 계속 있는 상태로 값이 추가가 된다.




/*
 3. @escaping, @autoclosure 키워드
 위와 같은 상황일 때 escaping키워드를 사용해야한다.
 */

var aFunction: () -> () = { print("출력") }

@MainActor func escapingFunction(closure: @escaping () -> ()) { //@MainActor는 우선 무시하도록 하자
    aFunction = closure                                         // 여기서 @escaping키워드가 쓰이는데 파라미터로 들어오는 함수를 외부 변수에 할당하려고 한다. 이렇게 되면 스택 영역에서 탈출하라고 컴파일러에게 미리 알려주는 키워드다.
}                                                               // 실제로 굉장히 많이 쓰이기 때문에 다른 영상을 참고해서라도 꼭 이해하고 넘어갈 필요가 있는 문법이다.


// 또한 클로저 앞에 @autoClosure키워드를 사용할 수 있는데 단순하며 어떤 문법인지 읽을 줄만 알면 된다고 생각하기에 아래 예시를 보면서 이해하고 넘어가자.
// 참고로 파라미터가 없는 경우에만 사용 가능하다. 파라미터가 있을 경우 반드시 함수 형태가 돼야하기 때문
func someFunction(closure: @autoclosure () -> Bool) {
    if closure() {
        print("참입니다.")
    } else {
        print("거짓입니다.")
    }
}

// someFunction(closure: <#T##Bool#>)  // @autoclosure키워드를 사용한 함수를 보면 함수 타입으로 받는 것이 아닌 리턴 타입으로 받고 있다. 이렇게 사용된다고 이해하고 넘어가면 될 것 같다.






/*
 4. (참고) 클로저의 사용법
 실제 UIKit에서 사용하는 클로저 문법이 있다. 자주 사용하나 아직 UIKit을 배우지 않았기 때문에 추후에 다시 볼때 이런게 있었구나라고 생각이 들 정도만 보고 넘어가자.
 */


let nameTextField: UITextField = {  // 이런식의 문법인데 이렇게 보게 되면 어떤 한 UI 컴포넌트에 대해서 속성들이 모여있어 가독성 또한 늘어나게 되어 유용하게 사용할 수 있다.
    let tf = UITextField()
    tf.text = "triple"
    tf.placeholder = "이름을 입력해주세요."
    tf.translatesAutoresizingMaskIntoConstraints = false
    return tf
}()
