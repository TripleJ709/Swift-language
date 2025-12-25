import UIKit

/*
 1. private
 나중에 더 정확하게 배우겠지만 싱글톤 패턴에서 필요한 요소 중 하나라 private만 간단하게 알고 가자.
 */

class A {
    private var name: String  // private키워드를 사용하면 외부에서 접근할 수 없다. 아래 객체 생성 이후 상황을 보자.
    
    init(name: String) {
        self.name = name
    }
    
    func getName() -> String { // 그래서 name을 반환하는 함수와 name의 값을 변경하는 함수를 만들었다.
        return name
    }
    
    func setName(name: String) {
        self.name = name
    }
}

var a = A(name: "triple")
// a.name //여기서 name에 접근은 불가능하다. private를 선언하게 되면 클래스 선언 내부에서만 접근이 가능하게 된다.
a.getName() // 그래서 이런식으로 함수로 간접 접근하게 된다.




/*
 2. 싱글톤 패턴
 객체를 하나만 만드는 방법이다. 물론 상황에 따라 여러 객체를 만들 수도 있겠지만 보통 하나만 사용하기 위해 사용한다.
 */

@MainActor // 여기서도 일단 이 키워드는 무시하자.
class B {
    static let shared = B() // 타입 속성으로 자기 자신을 객체로 만들어둔다. 그러면 데이터 영역에 shared라는 인스턴스를 가르키는(주소값을 갖는) 속성이 생긴다.
    
    var name = "Leo"
    
    private init() {} // 추가적인 인스턴스가 나오길 원하지 않는다면 생성자를 private로 선언하면 된다. 이렇게 되면 외부에서 생성자를 호출할 수 없다.
}

B.shared // 따로 객체 생성을 하지 않더라도 타입자체로 접근할 수 있다.
B.shared.name = "triple" // 이렇게 내부 속성에 접근할 수 있다.
