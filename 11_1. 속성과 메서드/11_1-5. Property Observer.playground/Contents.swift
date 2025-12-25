import UIKit

/*
 1. (저장)속성 감시자
 특정 속성이 변하는 시점을 감시하는 역할을 한다.
 변하기 직전과 직후를 감시할 수 있으며 예제가 아마 어렵지 않겠지만 실제 프로젝트에서 사용해본다면 단번에 감이 올 수 있을 것이다.
 */

class Hello {
    var sayHi = "안녕하세요" { // 기본적인 저장 속성과 같이 선언한 뒤 중괄호로 willSet과 didSet블럭을 만든다.
        willSet {           // willSet에는 속성이 변경되기 전 실행되는 함수다.
            print("인사가 \(sayHi)에서 \(newValue)로 변경될 예정입니다.")
        }
        didSet {            // didSet은 속성이 변경된 직후 실행되는 함수다.
            print("인사가 \(oldValue)에서 \(sayHi)로 변경되었습니다.")
        }
    }
}

var hello = Hello()
hello.sayHi
hello.sayHi = "Hi !"
hello.sayHi
