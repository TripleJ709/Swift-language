import UIKit

/*
 1. 상속의 단점
 우선 상속을 설명할 때 말했듯이 Swift에서는 단일 상속만 지원한다. 여러 클래스를 물려받을 수 없다. 프로토콜은 여러가지 프로토콜을 채택할 수 있다.
 또한 상속을 받게 되면 상위클래스에 정의된 모든 멤버들을 받게 된다. 굳이 쓸모 없는 멤버까지 가지게 됨.
 그리고 애플에서 클래스보다 구조체 사용을 권장하는데 구조체에는 상속을 받을 수가 없다.
 */

class Bird {
    var isFemale = true
    
    func fly() {
        print("새가 날아갑니다.")
    }
    
    func layEgg() {
        if isFemale {
            print("새가 알을 낳는다.")
        }
    }
}

class Eagle: Bird {     // 이렇게 보면 상속은 문제될 이유가 전혀 없음
    func soar() {
        print("공중으로 치솟아 난다.")
    }
}

class Airplane: Bird {    // fly라는 메서드를 사용하고 싶어 Bird를 상속했는데 비행기가 알을 낳아버리는 기능까지 생겨버림(필요없는 멤버까지 상속이 됨)
//    var isFemale = true
//    func layEgg() {
    
    override func fly() {
        print("비행기가 엔진을 사용해서 날아간다.")
    }
}




/*
 2. 프로토콜과 속성, 메서드의 요구사항
 프로토콜은 기본적인 규약만 설정하는 것이다. 이 프로토콜을 채택하게 되면 정의해둔 속성, 메서드를 채택한 곳에서 구현해야한다.
 */

protocol CanFly {  // 기본적인 프로토콜 선언 방법은 protocol키워드를 사용하면 된다. 여기서 CanFly가 대문자로 시작하는 이유를 생각해보자. 지금까지 대문자로 시작한 것은 모두 타입이었다.
    func fly()     // 함수의 헤더부분(중괄호 전까지, 함수의 리턴타입까지를 의미)만 적어놓는다. 상세 구현은 채택한 곳에서 구현한다.
}

class Bird1 {
    var isFemale = true

    
    func layEgg() {
        if isFemale {
            print("새가 알을 낳는다.")
        }
    }
}

class Eagle1: Bird1, CanFly {       // canFly프로토콜만 따로 채택, 만약 상속과 프로토콜을 같이 채택하게 되면 반드시 상속하는 클래스를 먼저 써야한다.
    func soar() {
        print("공중으로 치솟아 난다.")
    }
    
    func fly() {
        print("새가 하늘을 날아간다.")
    }
}

class Airplane1: CanFly {          // canFly프로토콜만 따로 채택해서 fly만 사용할 수 있게 함
    func fly() {
        print("비행기가 엔진을 사용해서 날아간다.")
    }
}

// 프로토콜은 위와 같이 어떻게 만들어야한다는 기본적인 정보만 제공한다. 속성, 메서드 모두 기본적인 정보만 제공한다.

protocol SomeProtocol {
    var x: Int { get }        // 속성같은 경우는 이렇게 선언하게 되며, 채택한 곳에서 get은 읽기만 가능하도록, set은 읽기 쓰기 모두 가능하도록 만들어야한다. 그리고 반드시 var로 선언해야한다.(프로토콜을 채택한 곳에서 바뀔거라 생각)
    var y: Int { get set }    // 또한 let, var, 계산속성 등 읽기, 쓰기 정의만 지키면 원하는대로 만들 수 있다.
    static var z: Int { get } // 타입속성 또한 마찬가지다.
    
    func doSomething() -> String // 메서드는 위에 설명한것과 같이 헤드부분까지 쓰면 된다. 구체적인 구현은 채택한 곳에서 구현한다.
    static func doSomething2() -> Bool // 타입메서드또한 동일하다. 그리고 상속에서 타입속성을 재정의하려면 class키워드로 써야한다고 말했는데, 여기서 static으로 선언하더라도 채택한 곳에서 class로 사용할 수 있다.
}


class SomeClass: SomeProtocol { // 프로토콜을 채택하고 모든 정의를 구현함
    
    var x: Int = 10 // 여기서는 최소 읽기만 구현하면 되므로 let, var모두 선언이 가능하다. 변수든 상수든 읽기는 가능하기 때문
    var y: Int = 20 // 여기서는 let선언이 불가능하다. let은 쓰기가 안되기 때문이다. 또한 두 저장속성 모두 계산 속성으로 구현해도 전혀 문제가 없다.
    
    static let z = 3
    
    func doSomething() -> String {
        return "어떤 일"
    }
    
    class func doSomething2() -> Bool { // 다른 클래스에서 이 클래스를 상속하게 되면 class키워드를 이용해서 타입 메서드를 재정의할 수 있다.
        return true
    }
}




/*
 3. 생성자의 요구사항(실제 프로젝트에서 사용하는 경우는 드물다.)
 우선 클래스는 상속을 고려해야한다. 생성자 앞에 required를 붙여야한다.
 final키워드를 쓰게 되면 더이상 상속이 불가능하기에 required생략가능
 클래스에서는 반드시 지정생성자로 구현할 필요없음(편의생성자로 구현 가능)
 */

protocol SomeProtocol1 {
    init(num: Int)
}


class SomeClass1: SomeProtocol1 {
    required init(num: Int) { }
}

class SomeSubClass1: SomeClass1 {
    // 아무 생성자도 구현하지 않으면 필수 생성자는 자동 상속
}

class SomeClass2 {
    init(num: Int) { }
}

class SomeSubClass2: SomeClass2, SomeProtocol1 {
    required override init(num: Int) {  // 상속과 채택 모두 있으므로 두 키워드 모두 필요
        super.init(num: 0)
    }
}




/*
 4. 서브스크립트 요구사항
 당연하게도 서브스크립트 또한 정의 가능하다.
 */

protocol AProtocol {
    subscript(i: Int) -> Int { get } // 정의 방법은 위와 거의 비슷하다. 기본적인 문법만 지키며 정의하면 된다. 속성이든 서브스크립트든 get은 필수다.(적어도 읽기는 가능해야 활용할 수 있기 때문)
}

struct AStruct: AProtocol {
    subscript(i: Int) -> Int {
        get {
            return 10
        }
        set {
            // 구현
        }
    }
}
