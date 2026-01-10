import UIKit

/*
 1. 접근 제어
 접근 제어는 코드의 세부 구현을 숨기는 것이 가능하도록 하는 개념이다. 객체지향 프로그래밍에서 은닉화와 밀접한 관련이 있다.
 Swift에는 총 5개의 접근 제어 키워드가 있는데 open, public, internal, fileprivate, private로 나뉜다. 디폴트 값은 internal이다.
 우선 모듈이라는 것은 간단하게 현재 구현중인 프로젝트라고 보면 된다. 다른 프로젝트와는 다른 모듈이라고 보면 된다.
 open - 다른 모듈에서도 사용이 가능하다. 상속 및 재정의도 가능함.
 public - 다른 모듈에서도 사용이 가능하다. 상속 및 재정의는 불가능
 internal - 같은 모듈 내에서 사용이 가능하다.
 fileprivate - 같은 파일 내에서만 사용이 가능하다.
 private - 같은 스코프 안에서만 사용이 가능하다.(중괄호의 범위만 사용이 가능함)
 */

class SomeClass {
    private var name: String = "이름"     // 속성이나 메서드 앞에 접근 제어 키워드를 사용하면 된다. 이제 이 클래스 밖에서는 name에 대한 접근이 불가능하다.
    
    func setName(name: String) {         // 이 메서드는 아무런 키워드를 사용하지 않았으므로 internal이 생략돼 있는 것이다. 지금까지 사용했던 모든 클래스, 구조체, 속성, 메서드는 internal로 사용했던 것이다.
        self.name = name
    }
}

var a = SomeClass()
//a.name
//a.name = "다른 이름"  // 스코프 밖으로 나왔으므로 사용이 불가능하다. 클래스에 구현해둔 setName을 통해 속성을 간접적으로 변경하는 것은 가능하다.

// 또한 타입은 타입을 사용하는 변수나 함수보다 높은 수준으로 선언되어야 한다. Swift의 기본 타입들은 모두 open으로 선언되어 있다.
var str: String = "접근 가능" // open키워드 사용 불가능

func abc(a: Int) -> Double { // 여기서도 open키워드 사용 불가능
    return 3.0
}

// 커스텀 타입에도 접근제어를 사용할 수 있다.
open class openClass {}
public struct publicStruct {}

// 실무에서 사용한다는 패턴
class SomeClass2 {
    private var _name: String = "이름"
    
    var name: String {          // 계산속성으로 읽기만 가능하도록 한다.
        return self._name
    }
}

class SomeClass3 {
    private(set) var name = "이름"    // private(set)이라는 키워드를 사용하기도 한다. set(읽기)기능만 숨기겠다는 의미이다.
}
