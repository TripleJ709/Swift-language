import UIKit

/*
 1. 상속 관계의 접근 제어
 상속에서는 부모 클래스보다 높은 수준의 접근 제어를 가질 수 없다.
 또한 동일 모듈에서 정의한 클래스의 상위 멤버에 접근 가능하면 재정의가 가능하다.(접근 수준을 올려서 재정의해야한다.)
 */

public class A {
    fileprivate func aMethod() {}
}

internal class B: A{
    public override func aMethod() {}
}




/*
 2. 확장에서의 접근 제어
 본체와 동일한 수준의 접근 제어를 유지하고 본체의 멤버에 기본적인 접근 가능
 */

public class C {
    private var a = "Private Property"
}

extension C {
    func someFunc() {
        print("\(a)에 접근 가능")
    }
}

