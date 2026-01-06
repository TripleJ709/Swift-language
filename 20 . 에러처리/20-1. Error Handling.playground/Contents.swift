import UIKit

/*
 1. 에러 처리
 Swift에서 에러는 크게 2가지로 나눌 수 있다.
 컴파일 타임 에러 -> 문법과 관련된 에러로 잘못된 사용을 하고 있을 때 컴파일로가 미리 알고 수정해야된다고 알려준다.
 런타임 에러 -> 프로그램이 실행되는 중에 발생하는 에러
 에러 처리는 런타임 에러를 핸들링하는 과정이다. 앱 사용자가 앱을 사용하는데 어떠한 에러가 나왔을 때 그냥 앱이 꺼지는 것과 "잠시 후에 다시 시도해주세요"라는 문구와 함께 꺼지지 않는 것을 비교해보면 된다.
 여기서 앱이 꺼지지 않고 특정 행동을 할 수 있도록 하는 것이 에러 처리를 배우는 목적이다.
 */




/*
 2. 에러 처리 문법
 에러 처리는 크게 3가지 순서로 나뉜다.
 에러 타입의 열거형을 만든다.(에러 프로토콜을 반드시 채택해야함) 그리고 함수에 throws라는 키워드를 써야하고 에러가 날 수 있는 경우 throw로 에러를 던져준다.
 함수를 실행할 때 try, do-catch블럭을 사용해서 에러 처리를 한다.
 아래 예제는 놀이기구를 탈 때 키를 확인하는 예제라고 생각하고 보자.
 */

enum HeightError: Error {   // 반드시 Error 프로토콜을 채택해야 에러 타입으로 사용할 수 있다.
    case minHeight          // 비정상적인 키를 입력하게 되면 나타나게 되는 에러로 정의했다.
    case maxHeight
}

func checkHeight(height: Int) throws -> Bool {  // 이렇게 -> 전에 throws라는 키워드를 사용해서 이 함수는 에러를 던질 수 있는 함수라는 것을 알려야한다.
    if height <= 0 {
        throw HeightError.minHeight             // 뭔가 문제가 생겼을 때 throw키워드와 에러 타입을 같이 내보내 이런 에러가 발생했다는 것을 알려야 한다.
    } else if height >= 300 {
        throw HeightError.maxHeight
    }
    
    if height < 160 {
        return false
    } else {
        return true
    }
}

do {                                                      // 함수를 실행할 땐 반드시 do블럭을 선언해야하며 try를 먼저 쓴 뒤 함수를 입력해야한다. 없으면 에러다.
    let result = try checkHeight(height: -10)             // 만약 try함수가 별도의 에러없이 실행되면 do블럭의 코드가 모두 실행된다.
    if result {
        print("놀이기구를 탈 수 있습니다.")
    } else {
        print("놀이기구를 탈 수 없습니다.")
    }
} catch {                                                 // catch블럭은 try함수가 에러를 받아왔을 때 실행되는 블럭이다. 에러가 없이 정상 작동된다면 catch블럭은 아무것도 실행되지 않는다.
    print("비정상적인 키가 입력되었습니다.")
}

// [1, 2, 3, 4, 5].map(<#T##transform: (Int) throws(Error) -> T##(Int) throws(Error) -> T#>) 전에 배웠던 고차함수인 map을 보면 throws라는 키워드가 함께 있다. 단순히 에러를 던질 수 있다는 의미였다.




/*
 3. 에러 처리 방법
 try, try?, try! 3가지의 방법으로 함수를 실행할 수 있다.(이제까지 배웠던 것을 보면 대충 ?와 !가 의미하는 바가 어떤 것인지 느껴질 것이다.)
 또한 catch블럭에서도 에러를 받는 방법이 몇가지 있다.
 위 키를 확인하는 함수를 갖고 알아보자.
 */

let result2 = try? checkHeight(height: 150) // try? 키워드를 사용하면 에러를 던질 때 nil로 표기가 된다. 에러를 던지지 않더라도 당연히 옵셔널 타입일 것이기에 Bool?타입이 될 것이다.(한번 옵셔널을 벗긴 뒤 사용해야 한다는 의미)
let result3 = try! checkHeight(height: 180) // try! 키워드를 사용하면 해당 함수가 에러를 던지는 순간 앱에 에러가 나며 꺼질 것이다. 전부터 언급했지만 !라는 것 자체는 확신이 있을 때만 사용해야 하며 확신이 있더라도 웬만하면 ?와 옵셔널 바인딩을 사용하자. 이거로 그렇게 코드가 길어지지 않는다.

do {
    let result = try checkHeight(height: -10)
    if result {
        print("놀이기구를 탈 수 있습니다.")
    } else {
        print("놀이기구를 탈 수 없습니다.")
    }
} catch HeightError.maxHeight {     // catch블럭에서는 에러 타입을 가져와 에러마다 특정 행동이 가능하게 할 수 있다.
    print("300 이하의 키를 입력해주세요.")
} catch HeightError.minHeight {
    print("0이상의 키를 입력해주세요.")
}

do {
    let result = try checkHeight(height: -10)
    if result {
        print("놀이기구를 탈 수 있습니다.")
    } else {
        print("놀이기구를 탈 수 없습니다.")
    }
} catch HeightError.maxHeight, HeightError.minHeight { // 여러개의 에러 타입을 한번에 처리하는 것도 가능하다.
    print("잘못된 형식의 키가 입력되었습니다.")
}

do {
    let result = try checkHeight(height: -10)
    if result {
        print("놀이기구를 탈 수 있습니다.")
    } else {
        print("놀이기구를 탈 수 없습니다.")
    }
} catch {                                       // 사실 catch블럭에 아무것도 사용하지 않는다면 error라는 상수를 받게 된다.
    // let error가 있는것과 마찬가지임.
    print(error)
    print(error.localizedDescription)           // error타입의 상수이며 어떤 error는 어떤 것인지 .localizedDescription라는 속성을 사용하면 더 자세한 에러 내용을 알 수 있다.
    
    if let error = error as? HeightError {      // error를 기존에 선언한 HeightError타입으로 변환해서 사용할 수도 있다. 아래는 단순히 enum타입을 분기처리하는 것일 뿐
        switch error {
        case .maxHeight:
            print("300이하의 키를 입력해주세요.")
        case .minHeight:
            print("0이상의 키를 입력해주세요.")
        }
    }
}



