import UIKit

/*
 1. Result 타입
 에러를 처리할 때 개발자가 사용할 수 있는 옵션 중 하나라고 보면 된다.
 우선 Result타입은 어떻게 명시가 되어있는지 보면
 @frozen
 public enum Result<Success, Failure> where Failure : Error {
     case success(Success)
     case failure(Failure)
 }
 위와 같이 되어있다.
 @frozen은 이 타입의 형태는 앞으로 바뀌지 않는다라는 의미인데 외우고 있을 필요 없다. 넘어가도록 하자.
 그 다움을 보면 열거형이며 제네릭타입인것을 볼 수 있다. 성공과 실패의 경우를 나타내며 실패의 경우는 반드시 Error프로토콜을 따르는 타입만 가능하다.
 아래에서 어떻게 사용하는지 보자.
 */

enum HeightError: Error {
    case minHeight
    case maxHeight
}

func checkHeight(height: Int) throws -> Bool {      // 이 함수는 에러처리에서 배웠던 코드 그대로이다. 이 코드와 Result타입을 쓰는 코드의 차이를 보자.
    if height <= 0 {
        throw HeightError.minHeight
    } else if height >= 300 {
        throw HeightError.maxHeight
    }
    
    if height < 160 {
        return false
    } else {
        return true
    }
}

func checkHeightResult(height: Int) -> Result<Bool, HeightError> { // 이와 같이 Result타입을 사용해주면 된다.
    if height <= 0 {
        return Result.failure(HeightError.minHeight)               // 반환할 때 그대로 사용할 수 있다. 여기선 실패이기 때문에 .failure가 쓰인다.
    } else if height >= 300 {
        return .failure(.maxHeight)                                // failure, maxHeight모두 열거형이며 타입이 확실하기 때문에 이렇게 축약이 가능하다.
    }
    
    if height < 160 {
        return .success(false)                                     // 여기선 성공값을 반환해야한다. 이렇게 보내줄 수 있다.
    } else {
        return .success(true)
    }
}


// 위 예시처럼 사용하면 되지만 열거형이기 때문에 switch문과 아주 잘 맞는다. 클로저를 콜백함수로 사용할 때 유용하게 사용할 수 있다. 네트워킹 코드로 예시를 보자.
// 우선 Result 타입을 사용하지 않은 경우를 보자.
enum NetworkError: Error {
    case someError
}

func NetworkFunc(with url: String, completion: @escaping (Data?, NetworkError?) -> ()) {        // 기존의 방식을 사용하면 이렇게 사용할 수 있을 것이다.
    guard let url = URL(string: url) else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        if error != nil {
            print(error!)
            completion(nil, .someError)
            return
        }
        
        guard let data else {
            completion(nil, .someError)
            return
        }
        
        completion(data, nil)
    }.resume()
}

NetworkFunc(with: "주소") { data, error in   // 함수를 호출할 때도 이렇게 사용된다. 잘 보면 함수 선언 부분과 처리부분에서 모두 에러에 대해 다루고 있는데 어떻게 보면 중복된 코드라고 볼 수 있다.
    if error != nil {
        print(error!)
    }
    // 데이터 관련 코드 처리
}


func NetworkResultFunc(with url: String, completion: @escaping (Result<Data, NetworkError>) -> ()) {    // Result타입을 사용하면 이렇게 함수를 정의할 수 있다.
    guard let url = URL(string: url) else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        if error != nil {
            print(error!)
            completion(.failure(.someError))
            return
        }
        
        guard let data else {
            completion(.failure(.someError))
            return
        }
        
        completion(.success(data))
    }
}

NetworkResultFunc(with: "주소") { result in   // Result타입은 열거형이기 때문에 이렇게 switch문과 잘 맞는다. 깔끔한 처리 가능
    switch result {
    case .success(let data):
        break
        // 성공 관련 코드 처리
    case .failure(let error):
        break
        // 실패 관련 코드 처리
    }
}
