import UIKit

/*
 1. 상속
 우선 상속에 들어가기 전 상속이란 클래스에만 존재하기 때문에 상속과 관련된 모든 것들은 클래스로 설명한다.
 상속은 상위 클래스에서 물려받아 속성이나 메서드를 추가하거나 메서드 등을 다시 정의하는 재정의를 하는 역할이다.
 */

class Aclass { // 지금까지 배웠던 기본적인 클래스의 모습
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

class Bclass: Aclass { // 이렇게 Aclass를 상속 받는 방법이 있다. 단 Swift는 단일상속만 지원한다. Cclass라는걸 만들어서 Aclass, Bclass모두 상속 받는 것은 불가능
//    var x: Int
//    var y: Int  // x, y 2개의 저장속성은 기본적으로 있다고 볼 수 있다. 메모리관점에선 생성자와 관련이 있지만 일단은 둘 다 있다고 보자
    var z: Int // 이렇게 추가 저장속성을 만들 수 있다.
    
    init(z: Int) {
        self.z = z
        super.init(x: 0, y: 0) // 상위의 생성자를 호출하는 방법인데 나중에 생성자를 깊게 들어가며 다시 배울 것
    }
}


var b: Bclass = Bclass(z: 0)
b.x
b.y
b.z
