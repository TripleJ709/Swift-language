import UIKit

/*
 1. 타입 메서드
 앞서 배운 타입 속성과 같이 타입에 속한 메서드이다.
 */

class Dog {
    static let spe = "장모치와와"
    
    var name = "Leo"
    
    static func info() {
        print("이 강아지 종은 \(spe)입니다.") // 이렇게 static키워드를 앞에 사용하면 되고 타입 계산 속성도 마찬가지지만 static변수만 사용 가능하다.(일반 속성은 힙 영역에 있고 타입관련은 모두 데이터 영역에 있다. 각 인스턴스에 대한 주소를 갖고 있지 않음)
    }
}

Dog.info() // 당연히 타입으로 접근해야만 한다.

Double.pi // Double이라는 타입을 옵션 + 마우스로 눌러보면 구조체인것을 알 수 있는데 여기서 pi라는 것은 타입 속성으로 선언되어 있는 것이다.
Int.random(in: 1...100) // Int또한 구조체인데 random이라는 타입 메서드가 미리 만들어져 있다.

