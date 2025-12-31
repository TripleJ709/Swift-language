import UIKit

/*
 1. 프로토콜의 상속
 프로토콜의 상속은 클래스의 상속처럼 복잡하지 않다.
 단순히 여러 요구사항들을 나열했을 뿐이다. 아래 예제를 보면 어렵지 않게 이해할 수 있을 것이다.
 */

protocol A {
    func doSomething1()
    func doSomething2()
}

protocol B {
    func doSomething3()
    func doSomething4()
}

protocol C: A, B {          // 클래스와 달리 다중상속이 가능하다.(프로토콜을 채택하는 개념처럼 보인다.)
//    func doSomething1()
//    func doSomething2()
//    func doSomething3()
//    func doSomething4()   // 상속으로 인해 기본적으로 물려받게 된다.
    
    func doSomething5()
}



/*
 2. 프로토콜의 합성
 & 키워드를 쓰며 두개의 프로토콜을 합성한 타입을 나타내는 방법
 */

func doSomething(item: A & B) { // 이렇게 사용하게 된다.
    print(item.doSomething1())
    print(item.doSomething2())
    print(item.doSomething3())
    print(item.doSomething4())
}
