import UIKit

/*
 1. Any타입
 어떠한 타입도 넣을 수 있는 타입이라고 보면된다.
 하지만 컴파일러가 어떤 타입인지 알지 못하기 때문에 as를 통해 변환이 필요하다.
 */

let a: [Any] = [3, "Swift", String(), 3.5] // 모든 타입이 들어갈 수 있다. 구조체, 클래스 인스턴스 또한 가능

for i in a {
    print(i)
}

//let b = a[0] + 10 // 불가능 아직 a배열에 있는 타입이 Any타입이기 때문에 컴파일러가 정수로 인식하지 못한다.
let b = (a[0] as! Int) + 10 // as로 한번 타입을 변환해주는 과정이 필요하다.

// print(<#T##items: Any...##Any#>, to: &<#T##TextOutputStream#>) // print타입도 받는 파라미터가 Any타입인데 print함수 내부에서 타입을 변경시키는 과정이 들어갈 것이다.



/*
 2. AnyObject
 클래스의 인스턴스 타입만 넣을 수 있다.
 AnyObject또한 타입을 변환시켜 사용해야한다.
 */

class Dog {
    var name = "Leo"
}

class Bird {
    var name = "참새"
}

let c: [AnyObject] = [Dog(), Bird()]

// c[0].name // 접근 불가

(c[0] as! Dog).name // 접근 가능
