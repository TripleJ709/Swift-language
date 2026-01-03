import UIKit

/*
 1. 일급객체(first-class Citizen)
 프로토콜에서도 잠깐 언급했었지만 프로토콜도 1급객체이다. 1급객체는 간단하게 타입으로 사용할 수 있다고 볼 수 있다.
 Swift는 함수 또한 1급객체로 취급하게 되는데 아래와 같은 특징이 있다.
 1. 함수를 변수에 할당할 수 있다.
 2. 함수를 파라미터로 전달할 수 있다.
 3. 어떤 함수에서 함수를 반환할 수 있다.(함수를 리턴 가능)
 */

func afunc(a: String) -> String {
    return a + "!!!"
}

var a: (String) -> String = afunc // 함수를 변수에 할당 가능



func bfunc(function: () -> (String)) -> (Int) -> String {
    let a = function()
    let count = a.count
    return { num in "이 문자열의 갯수는 \(num)개 입니다." } // 이건 클로저라는 것인데 바로 아래에서 배우게 될 것이기 때문에 우선은 함수의 형태라는 것만 생각하자.
}

func parameterFunc() -> String {
    return "hello, Swift"
}

let b: (Int) -> String = bfunc(function: parameterFunc)  // 이 예제를 보면 함수를 인풋값으로 받기도 하며 리턴값으로도 돌려줄 수 있다.




/*
 2. 클로저
 클로저는 이름이 없는 함수라고 생각하면 된다. 다른 언어에서도 사용 되기도 하며 예를 들어, 파이썬에선 lambda와 같은 이름으로 있다.
 */

let functionA: (String) -> String // 예전 함수를 배울 때 언급했었는데, 이처럼 함수도 타입으로 선언이 가능하다.

func commomFunction(str: String) -> String { // 우리가 알던 일반적인 함수의 모습
    return "Hello, \(str)"
}

let closureFunction = { str in // 새로운 클로저라는 함수의 모습이다. 여기서 중괄호로 시작하며 파라미터의 이름(str)이후 함수 블럭 내부라는 것을 알리기 위해 in이라는 키워드를 사용한다. 그 뒤에 함수 로직을 만들면 된다.
    return  "Hello, \(str)"
}                              // 이제부터 알아야 할 것은 중괄호의 시작은 무조건 함수라고 생각해야 한다. Swift에서는 이런식의 문법이 많기 때문에 클로저를 알지 못하면 모르는 곳이 엄청 많아질 것이다.




/*
 3. 클로저의 형태
 클로저는 우선 간다하게 사용하기 위해 존재하는 것처럼 다양한 형태가 존재한다.
 */

let closure1 = { (str: String) in   // 일반적인 함수라면 이렇게 아규먼트 레이블이 필요할 것이다.
    return "Hello, \(str)"
}

let closure2 = { str in             // 하지만 클로저에서는 타입이 따로 필요하지 않다. 외부에서 알려주기 때문
    return "Hello, \(str)"
}

let closure3 = { str in             // 이건 클로저뿐만 아니라 모든 함수, 메서드 종류에서 가능한데 한 줄일 경우 return을 따로 표기하지 않더라도 첫번째 줄이 리턴 값이 된다.
    "Hello, \(str)"
}






/*
 4. 클로저를 사용하는 이유
 일반적으로 파라미터로 받기 위해 사용하는 경우가 많다. 파라미터로 받게 되면 함수를 사용하는 사람이 원하는 로직을 사후적으로 처리가 가능하기 때문
 */

func closureParameterFunction(closure: () -> ()) {  // 여기 파라미터는 함수를 받는 것일 뿐 실행하는 것은 아니다.
    print("함수 시작")
    closure()                                       // 여기에서 ()를 써야지만 함수의 실행이다.
}

func doSwiftPrint() {
    print("스위프트 프린트 함수")
}

let printSwift = {
    print("스위프트 프린트 변수")
}

closureParameterFunction(closure: doSwiftPrint) // 이 2 경우 모두 가능
closureParameterFunction(closure: printSwift)

closureParameterFunction(closure: { print("여기서 사후적으로 만들기") }) // 보통은 이렇게 사용하기 위해서 클로저를 사용한다.

// 바로 위 예시를 아래와 같이 사용도 가능하다.

func plusFunction(a: Int, b: Int, closure: (Int) -> ()) {
    let num = a + b
    closure(num)
}

plusFunction(a: 10, b: 15, closure: { num in        // 여기는 분명 함수의 호출 부분이지만 호출하면서 사후적으로 함수를 정의한다. 그 정의한 함수는 함수 정의 부분의 closure파라미터로 들어가게 되고 함수 정의부분에서 실행될 때 여기 클로저가 실행된다.
    print("두 값의 합은 \(num)입니다.")
})

