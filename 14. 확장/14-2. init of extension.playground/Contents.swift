import UIKit

/*
 1. 클래스 확장에서의 생성자
 확장에서도 전에 배운것과 같다. 다른 점은 편의생성자만 가능하며 편의생성자는 반드시 지정생성자를 호출하는 순간이 필요하다.
 */

class Point {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

extension Point {
//    init() { // 지정생성자 불가능
//
//    }
    
    convenience init() {    // 편의생성자로 가능
        self.init(x: 0, y: 0)
    }
}




/*
 2. 구조체 확장에서의 생성자
 구조체에는 편의생성자의 개념이 없다 지정생성자를 호출하는 방법만 쓰면 된다.
 단 생성자를 아무것도 구현하지 않았을 경우 멤버와이즈생성자와 기본생성자가 제공된다는 것을 유의하고 생성자를 만들면 된다.
 */

struct A {
    var x: Int
    var y: Int
    
//    init(x: Int, y: Int) {   // 이 생성자들을 기본적으로 제공해줌
//        self.x = x
//        self.y = y
//    }
//    
//    init() { }
}

extension A {
    init(x: Int) {
        self.init(x: x, y: 0)
    }
}
