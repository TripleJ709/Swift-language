import UIKit

/*
 1. 생성자의 생성자 호출
 우선 여기 파일은 많은 내용이 들어갈 것 같다. 모든 내용을 단번에 외우기는 좀 어려울 수 있으니 이런 기능들이 있구나 생각하고 다 배운 뒤 몇번 다시 보기를 추천한다.
 사실 몇번 프로젝트를 진행하면서 느낀 바로는 모든 프로젝트에서 필수적으로 사용되는 개념은 아닌것 같지만 클래스의 이해에 대해 꽤 중요한 내용이라고 생각이 들기에 언젠간 모두 이해하는 것이 좋아보인다.
 
 이전 파일에서 배웠던 것처럼 생성자 또한 오버로딩으로 여러 생성자를 만들 수 있지만 사실 더 좋은 방법이 있다. 우선 구조체로 예시를 들어보겠다.
 */

struct Aclass {
    var x: Int
    var y: Int
    var z: Int
    
    init(x: Int, y: Int, z: Int) { // 우선 이렇게 자신의 저장속성을 모두 초기화하는 생성자를 지정 생성자라고 한다. 아래는 지정 생성자가 아니다(직접 초기화를 하지 않고 위임하기 때문)
        self.x = x
        self.y = y
        self.z = z
    }
    
    init(all: Int) { // 이런식으로 구조체에서는 자신의 구조체 안의 생성자를 호출할 수 있다. 이게 유지보수적인 면에서 더 좋은 방법이라고 생각이 든다.
        self.init(x: all, y: all, z: all)
    }
}




/*
 2. 편의 생성자
 구조체에서는 저렇게 바로 자신의 생성자를 부르면 되지만 클래스에서는 추가적인 키워드가 필요하다. 지정 생성자가 아닌 자신의 생성자를 호출하는 생성자를 편의 생성자라고 부른다.
 */

class Color {
    var red: Int
    var green: Int
    var blue: Int
    
    init(red: Int, green: Int, blue: Int) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    convenience init(white: Int) {      // 이렇게 자신의 지정생성자를 호출할 때 convenience키워드가 필요하다.
        self.init(red: white, green: white, blue: white)
    }
}




/*
 3. 생성자의 상속/재정의
 상속에선 여러 규칙과 예외 사항이 존재한다. 모든 상황을 다 쓰기엔 너무 많아 몇개는 생략하겠지만 언젠간 다 알아보는 것을 추천한다.
 또한 예시를 좀 더 정확하게 하기 위해 애플 공식문서나 강의에서 본 코드를 그대로 사용하겠다.
 
 우선 상속이 일어났을 때 생성자는 반드시 재정의 하는 것이 원칙이다.
 생성자는 상위클래스에 맞게 초기화가 되는 로직이 있고 하위클래스에 대한 로직은 전혀 없기 때문이다.
 물론 안전한 경우에는 자동 상속이 되는 경우도 있다.
 
 상위클래스의 지정생성자를 고려해서 재정의를 해야한다.
 지정생성자를 보고 1. 하위클래스에서 지정생성자로 구현
              2. 하위클래스에서 편의생성자로 구현
              3. 구현하지 않음
 위 3개로 나눠볼 수 있다.
 상위클래스의 편의생성자는 재정의 불가가 원칙이다.
 만약 동일한 이름의 생성자를 구현했다면 그냥 다시 구현한 것일 뿐 재정의가 아니다.
 
 그 뒤 하위클래스에서도 지정생성자와 편의생성자를 나눠 볼 수 있다.
 지정생성자인 경우 자신의 클래스의 모든 저장속성을 초기화한 뒤 -> 상위의 지정생성자를 호출한다. (super.init)
 편의생성자인 경우는 현재 클래스의 지정생성자를 호출해야만 한다.(다른 편의생성자를 거치는 것은 상관없음, 결국 생성자라는 것은 저장속성을 모두 초기화하는 과정이고 반드시 지정생성자만 초기화가 가능하기에 지정생성자를 따라가야만 한다.)
 */

class Bclass {
    var x = 0
    
    //init() { } // <- 자동 생성됨
}

class Cclass: Bclass {
    var y: Int
    
    // 여기서 상위클래스인 Bclass는 지정 생성자가 init()이다.
    // 1. 지정생성자 재정의
//    override init() {
//        self.y = 0
//        super.init() // 반드시 자신의 속성을 먼저 초기화 한 뒤 super.init호출
//    }
    
    // 2. 편의생성자로 구현
    override convenience init() {
        self.init(y: 0)
    }
    
    // 3. 상속을 안할수도 있음(재정의를 안할 수 있음)
    
    // 그 뒤 현재 단계의 생성자 구현해야함
    init(y: Int) {
        self.y = y
    }
}

class Dclass: Bclass {
    var z: Int
    
    override init() { // 상위 클래스와 이름이 동일한 생성자 재정의(올바른 방법)
        self.z = 0
        super.init() // 값설정이 없고 상위단계의 생성자가 기본(init())만 있는 경우 생략 가능
    }
    
    init(z: Int) {
        self.z = z
        super.init()
    }
}


// 애플의 공식문서 예제

class Vehicle {
    
    var numberOfWheels = 0
    
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
    
    // init() 이 제공되어 있음
}

class Bicycle: Vehicle {
    
    override init() {
        super.init()       // 여기선 추가된 저장속성이 없으므로 따로 값 설정 x
        numberOfWheels = 2 // 슈퍼클래스 호출 반드시 필요 그 뒤 값 설정 가능
    }
}

class Hoverboard: Vehicle {
    var color: String
    
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
    
    override convenience init() {
        self.init(color: "red")
    }
    
    init(color: String) {
        self.color = color
        super.init() // 여기서도 생략해도 호출이 됨
    }
}

// 클래스의 지정, 편의생성자 상속의 예외사항
// 새 저장속성이 없거나 기본값이 설정돼 있다면 실패 가능성이 배제되므로 예외사항이 된다. -> 슈퍼클래스의 지정생성자 모두 자동 상속(단, 하위생성자에서 어떤 재정의도 하면 안된다.)
// 또는 상위 지정생성자를 모두 상속하는 경우도 있다. 결국, 모든 지정생성자를 상속하는 상황이 되면 편의생성자는 자동으로 상속된다.

class Food {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    
    init(name: String, quantity: Int) { // 모든 속성 초기화
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 0)
    }
    
    // convenience init() {} // 여기서 자동 상속 예외규칙이 적용된다.
}

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? "o" : "x"
        return output
    }
    
    // override init(name: String, quantity: Int) { }
    // convenience override init(name: String) { }
    // convenience init() { }                           // 지정생성자 모두 자동 상속 -> 따라서, 편의생성자 상속도 모두 자동으로 상속됨
}




/*
 4. 필수 생성자
 필수 생성자는 하위 클래스에서 반드시 생성해야하는 생성자다.
 실제로 구현하는 일보단 애플에서 미리 만들어둔 클래스들을 이용하면서 자주 보게 될 것이다.
 단, 하위클래스에서 아무런 생성자를 만들지 않았다면 필수생성자도 호출하지 않아도 된다.
 하나라도 생성자를 만들게 되면 필수 생성자를 만들어야함.
 */

class Eclass {
    var x: Int
    
    required init(x: Int) {
        self.x = x
    }
}

class Fclass: Eclass { // 여기선 필수생성자가 없어도 된다.
    
}

class Gclass: Eclass {
    init() {
        super.init(x: 0)
    }
    
    required init(x: Int) {     // 자동으로 컴파일러가 알려주기 때문에 걱정없이 사용할 수 있다.
        fatalError("init(x:) has not been implemented")
    }
}

class AView: UIView {  // 실제 앱을 만들 때 자주 사용하게 된 UIView클래스이다. 여기서도 필수 생성자가 구현되어 있다.
    var x: Int
    
    override init(frame: CGRect) {
        self.x = 10
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




/*
 5. 실패 가능 생성자
 실패할 가능성을 생각한 생성자로 init?을 사용하지만 init!도 가능은 하다. 서로 메모리 관점에서 약간의 차이가 있다곤 하지만 코드를 써내려갈때 생각할 수준까진 아니다.
 */

struct Animal {
    let spe: String
    
    init?(spe: String) {
        if spe.isEmpty {
            return nil
        }
        self.spe = spe
    }
}

var a = Animal(spe: "Dog")  // 인스턴스 생성 또한 실패 가능성이 있기 때문에 a는 Animal?타입이다. 나중에 배울 옵셔널 체이닝을 통해 벗겨 사용가능 물론 if let으로도 가능하다.
var b = Animal(spe: "")     // 문자열이긴 하지만 빈문자열이기에 nil반환

if let a {
    a.spe
}



/*
 6. 소멸자(Deinitialization)
 소멸자는 객체가 사라지는 타이밍에 호출되는 메서드이다.
 */

class Hclass {
    var x = 10
    
    deinit { // deinit키워드를 사용하며 사라지는 시점에 호출되기 때문에 파라미터가 필요 없다.
        print("Hclass 객체가 사라짐")
    }
}

var h: Hclass? = Hclass()
h = nil // nil을 할당하는 순간 메모리에서 내려오게 되고(정확히는 힙) deinit이 호출된다.

var h2 = Hclass()
h2 = Hclass() // 나중에 ARC를 배우면 정확히 알겠지만 h2변수가 가르키고 있던 원래 힙 영역에서 다른 힙 영역을 가르키게 되어 원래 객체는 메모리에서 내려오게 되며 deinit이 사라진다.
