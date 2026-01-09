import UIKit

/*
 1. 제네릭의 필요성
 제네릭은 다양한 타입에 대한 파라미터나 리턴값등을 중복해서 만들기에 불편함을 느끼고 하나로 통일해서 사용할 수 있다.
 Swift내부에는 제네릭으로 선언된 코드가 굉장히 많다. 제네릭은 잘 알아두는게 좋다.
 아래 예제코드를 보고 이해해보자.
 */

func doIntArrayPrint(array: [Int]) {
    for i in array {
        print(i)
    }
}

func doDoubleArrayPrint(array: [Double]) {
    for i in array {
        print(i)
    }
}

func doStringArrayPrint(array: [String]) {
    for i in array {
        print(i)
    }
}

doIntArrayPrint(array: [1,2,3,4,5])
doDoubleArrayPrint(array: [1.0,2.0,3.0,4.0,5.0])
doStringArrayPrint(array: ["1","2","3","4","5"])    // 지금 내부적으로 완전히 동일한 로직을 가진 3개의 함수가 있다. 여기서 다른건 파라미터로 받는 타입일 뿐이다. 여기서 불편함을 느끼면 좋겠다.

func doGenericArrayPrint<T> (array: [T]) {  // 함수 이름 뒤에 <>를 선언하고 그 안에 원하는 타입 이름을 사용하면 된다. 대문자로 시작해야한다. 그 뒤 원하는 파라미터나 리턴 타입에 사용할 수 있다.
    for i in array {                        // T로 들어온 값은 내부적으로 알아서 맞는 타입으로 변환되기에 위 3개의 함수를 만든것과 다르게 단 하나만 함수를 정의하면 된다.
        print(i)
    }
}

doGenericArrayPrint(array: [1,2,3,4,5])
doGenericArrayPrint(array: [1.0,2.0,3.0,4.0,5.0])
doGenericArrayPrint(array: ["1","2","3","4","5"])

// 참고) 지금까지 <>를 어디선가 꽤 많이 보았을 것이다. 모두 제네릭타입이다.

var a: Optional<Int>    // 옵셔널 타입 선언의 정식문법이다. 여기 <>는 제네릭문법으로 어떠한 타입이 와도 사용 가능한 것이다.
var b: Array<String>    // 배열 타입 선언의 정식문법이다. 여기의 <>도 제네릭문법이며 어떤 타입도 사용 가능하다.

// [1,2,3,4,5].map(<#T##transform: (Int) throws(Error) -> T##(Int) throws(Error) -> T#>) // map함수도 살짝 언급하며 지나갔지만 리턴 타입이 T로 제네릭문법이다. 어떠한 타입으로 리턴이 되어도 상관이 없다.




/*
 2. 제네릭 타입의 정의
 제네릭은 클래스, 구조체, 열거형에서도 사용이 가능하다.
 단순히 제네릭만 선언하지 않고 제약을 걸 수도 있고 확장에서의 사용법도 있으니 알아두자.
 */

struct Member<T> {  // 단순 선언 방법은 간단하다. 함수처럼 타입이름 뒤에 <>와 제네릭타입으로 사용할 이름을 정의하고 타입 내부에서 사용하기만 하면 된다.(제네릭타입의 이름은 관습적으로 T라고 사용하지만 다른 어떠한 대문자로 시작하는 문자열이면 상관업다.)
    var a: T
    var b: T
}

extension Member {                  // 확장에서는 제네릭을 선언할 수 없다.(extension Member<A> 불가능) 반드시 본체에서 제네릭을 선언해줘야한다.
    func doSomething(member: T) {   // 사용은 동일하게 제네릭 문법대로 사용할 수 있다.
        print(member)
    }
}

extension Member where T == Int {   // where절을 사용해 특정 타입만 확장을 적용할 수도 있다. 여기서 plusNumPrint함수는 제네릭 타입이 정수로 선언된 경우에만 확장이 사용 가능하다.
    func plusNumPrint(num: T) {
        print(num + 10)
    }
}

class Member2<T: Equatable> {       // 제네릭 타입 자체에 제약을 걸 수도 있다. Equatable프로토콜은 나중에 배우게 될 내용이므로 넘어가도록 하고 여기선 어떤 프로토콜을 채택한 타입만 사용이 가능하다는 것을 알아두면 된다.
    
}
