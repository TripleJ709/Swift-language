import UIKit

/*
 1. 선택적 요구사항의 구현(재목은 옵셔널로 적었지만 ?를 쓰는 옵셔널 개념은 아니다.)
 프로토콜에서 요구사항을 정할 때 특정 속성이나 메서드는 구현해도 되고 안해도 되는 개념으로 만들 수 있다.
 @objc 키워드를 사용하며 objc는 전에 말했듯 objective-c의 문법을 가져오는 개념이다.
 */

@objc protocol A {      // 프로토콜을 정의할 때 @objc키워드를 사용해야한다.
    @objc optional var x: Int { get } // 이처럼 선택적 요구사항 속성, 메서드를 만들 때 @objc와 함께 optional까지 필요하다.
    var y: Int { get set }
    
    @objc optional func doSomething()
}

class AClass: A { // A프로토콜을 채택했지만 선택적 요구사항은 만들지 않았다. 그럼에도 에러가 나지 않는다.
    var y: Int
}
