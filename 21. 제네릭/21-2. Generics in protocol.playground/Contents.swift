import UIKit

/*
 1. 프로토콜에서의 제네릭
 프로토콜에서 제네릭은 기존과 약간은 다른 방식으로 사용되기에 알아둘 필요가 있다.
 */

protocol Remote {
    associatedtype Element              // 이 줄이 제네릭의 문법이다. 기존과 달리 타입 뒤에 <>사용이 아닌 associatedtype의 키워드를 사용한다. 그 뒤에 제네릭으로 사용하고 싶은 문자열을 만든 뒤 사용할 수 있다.(대문자로 시작해야함)
    
    func changeChannel(member: Element)
    func errorCode(code: Element)
}

class TV: Remote {
    typealias Element = Int // 어떤 타입으로 사용할 것인지에 대한 명시이지만 생략이 가능하다.
    
    func changeChannel(member: Int) {
        print("채널이 변경되었습니다: \(member)")
    }
    func errorCode(code: Element) {         // 두 함수를 보면 알겠지만 Int를 사용할 수도 있고 Element를 사용할 수도 있다.
        print("Error: \(code)")
    }
}
