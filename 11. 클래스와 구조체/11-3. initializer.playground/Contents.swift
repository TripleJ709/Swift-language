import UIKit

/*
 1. 초기화의 의미와 생성자(initializer-초기화하다)
 Dog으로 예시를 들면 강아지가 10마리가 있다고 하면 10번의 dog.name = "이름"을 통해 변경해야한다.
 더 많아지면 좀 곤란하다.
 생성자는 객체를 생성할 때 내부에 있는 저장속성(저장속성이란 말은 우선 넘기고 지금까지 사용한 속성이라고 이해해도 된다.)의 값을 모두 정하는 것이다.
 */

class Dog {
    var name: String
    var weight: Double
    
    init(n: String, w: Double) { // 여기가 생성자 부분이다. 사실 함수와 같다. 함수인데 생성자만 특별히 func키워드를 빼준다고 생각하자. 당연히 함수이기에 파라미터를 가질 수 있다.
        name = n
        weight = w
    }
}

var leo = Dog(n: "Leo", w: 3.5) // 이렇게 생성을 할 때 ()에 초기 값을 넣어줄 수 있다.
var leo2 = Dog(n: "Leo2", w: 3.1)

struct Person {
    var name: String
    var weight: Double
    var height: Double
    
    init(name: String, weight: Double, height: Double) { // 구조체도 마찬가지로 똑같이 쓴다. (이 부분에 대해선 뒤에 더 얘기할 것이 있다.)
        self.name = name
        self.weight = weight
        self.height = height
    }
}

var triple = Person(name: "triple", weight: 75.0, height: 180) // 똑같은 방법으로 사용한다.




/*
 2. self
 self는 인스턴스 자신을 가르키는 것이다. 생성자에서 가장 자주 쓰이는 패턴에 필요하고 self자체가 문법적으로 필요한 경우도 있다.
 */

class Dog2 {
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) {  // 보통 이 방법을 가장 자주 사용한다. 같은 이름이라 처음엔 헷갈릴 수 있지만 이해하고 넘어가도록 하자.
        self.name = name                  // 같은 파라미터의 이름인 경우 가장 가까운 이름을 사용하게 되어 있다. 그래서 self없이 name = name이라면 우선 자기 자신에 자신을 넣는 꼴이라 의미가 없을 뿐더러 함수에선 파라미터가 let으로 선언되어 에러가 나게 된다.
        self.weight = weight              // 그래서 self로 자기 자신의 인스턴스(Dog2)의 속성인 name임을 알려주게 되고 그 name에 생성자에서 받아온 name을 넣으라는 뜻이 된다.
    }
}

var dog1 = Dog2(name: "bori", weight: 4.0) // 사용 방법은 같다.




/*
 3. 옵셔널 속성
 옵셔널 값은 기본적으로 선언만 하게 되면 nil이라는 값으로 초기화 된다. 예를 들어 var a: Int? 만 쓰게 되어도 a = nil이 할당된 것이다.
 그래서 초기화에선 이미 저장 속성에 값이 들어가 있으므로 초기화를 하지 않아도 된다.
 */

class Dog3 {
    var name: String
    var weight: Double?
    
    init(name: String) {
        self.name = name
    }
}

var a = Dog3(name: "dog3")
a.name
a.weight // 하지만 당연하게도 값은 nil이 나올것이다.
