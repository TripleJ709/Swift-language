import UIKit

/*
 1. 에러를 던지는 함수를 처리하는 함수
 조금 헷갈릴 수는 있겠지만 그렇게 어려운 개념은 아니다. 천천히 생각해보며 이해해보자.
 */

// 아주 간단하게 에러를 던지는 함수를 만들어보자.
enum SomeError: Error {
    case aError
}

func someFunc() throws {
    throw SomeError.aError
}

do {                // 일반적으로 이렇게 받겠지만 다르게 받는 상황도 있다.
    try someFunc()
} catch {
    print(error)
}

//-------------------------------------------------------------------

func errorHandleFunc() {
    do {
        try someFunc()
    } catch {
        print(error)
    }
}

errorHandleFunc() // 이렇게 함수로 받는것도 당연히 가능할 것이다.

//-------------------------------------------------------------------

func errorHandleFunc2() throws {    // 함수안에서 에러를 다시 던지는 것도 가능
    try someFunc()
}

do {
    try errorHandleFunc2()
} catch {
    print(error)
}

//-------------------------------------------------------------------

func someFunction1(callback: () throws -> ()) rethrows {        // 에러를 던지는 함수에서 에러를 처리하는 함수다. 조금 헷갈릴 수도 있지만 어디서 에러를 던지는지 차근차근 생각해보면 그렇게 어렵진 않다.
    try callback()
}

do {
    try someFunction1(callback: someFunc)
} catch {
    print(error)
}

func someFunction2(callback: () throws -> ()) rethrows {
    enum SomeError2: Error {
        case aError
    }
    
    do {
        try callback()
    } catch {
        throw SomeError2.aError
    }
}

do {
    try someFunction2(callback: someFunc)
} catch {
    print(error)
}




/*
 2. 생성자
 생성자도 분명 함수이기 때문에 에러를 던질 수 있다.
 하지만 생성자에서 만드는 것보다 다른 부분에서 에러를 던지는 경우가 대부분이기 때문에 실제 사용할 일은 없을 것이라 생각된다.
 아래에선 아주 간단한 예제만 보고 나중에 다른 문법은 완벽한 것 같은데 더 알고 싶을 때 따로 찾아보자.
 */

class A {
    var name: String
    
    init(name: String) throws {
        if name == "" {
            throw SomeError.aError
        } else {
            self.name = name
        }
    }
}
