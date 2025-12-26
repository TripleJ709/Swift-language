import UIKit

/*
 1. 재정의(오버라이딩)
 재정의는 상위 클래스에서 만든 메서드를 다시 정의하는 방법이다.
 저장속성은 원칙상 절대 재정의가 불가능하며 메서드만 재정의가 가능하다.
 재정의는 override라는 키워드를 사용한다.
 */

class Aclass {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func doSomething() {
        print("x와 y값은 각각 \(self.x), \(self.y)입니다.")
    }
}

class Bclass: Aclass { // 여기서 Aclass를 상속받았는데 Aclass를 부모클래스 또는 상위클래스라고 부르며, Bclass를 자식클래스 또는 하위클래스라고 부른다.
    // override var x: Int = 10 // 저장속성은 재정의 불가능
    var z: Int
    
    init(z: Int) {
        self.z = z
        super.init(x: 0, y: 0)
    }
    
    override func doSomething() {
        super.doSomething() // super라는 키워드는 상위클래스에 접근하는 것으로 보면된다. 상위 클래스의 정의된 20번쨰 줄을 실행하는 것이다.
        print("z값이 추가 됐습니다 z값은 \(self.z)입니다.") // 그 뒤에 원하는 로직을 추가하자. 물론 super전에 추가해도 되고 super자체를 안써도 상관없다.
                                                    // 참고로 계산속성, 속성감시자도 메서드 형태이기 때문에 재정의가 가능하다.
    }
}
