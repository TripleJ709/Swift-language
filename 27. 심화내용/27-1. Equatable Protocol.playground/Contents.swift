import UIKit

// 우선 이 챕터를 들어가기 전 아마 개발을 하면서 이런 개념들을 마주치는 일은 많이 없을 것이다.
// 이해가 안간다면 그냥 넘어가도 좋고 나중에 마주쳤을 때 아 이런게 있었지 라는 생각만 들면 충분하다.
// 지금까지 그냥 넘어가자라는 말을 자주 했는데 그런 문법이나 범위들은 나중에 마주쳤을 때 이런게 있었지 하며 찾아보기만 할 수 있을 정도면 충분하다.(인터넷에 정말 잘 나와있다.)

/*
 1. Equatable프로토콜
 간단하게 말하면 대상이 같은지 다른지를 판별할 수 있는 프로토콜이다.
 우리가 지금까지 무의식적으로 사용했던 a == b, a != b와 같은 문법인데, Swift에서 기본적으로 제공하는 타입(Int, String 등)에는 이 프로토콜을 따르고 있었고
 우리가 따로 신경쓸 것 없이 사용할 수 있었다. 우리가 신경써야 할 것은 커스텀 타입(열거형, 구조체, 클래스)에서 어떻게 사용하는지이다.
 또한 이번 챕터에서 총 4개의 프로토콜을 배우는데 Equatable프로토콜 아래 Comparable, Hashable 프로토콜이 있다고 알고 있자.
 */

// 열거형의 경우
enum Direction {
    case east, west, south, north
}

let d1 = Direction.east
let d2 = Direction.west

d1 == d2    // (연관값이 없는)열거형의 경우 기본적으로 같고 다르다는 알려준다.
d1 != d2    // 따라서 열거형에서는 따로 추가할 것 없이 같고 다름을 사용하면 된다.

// 구조체의 경우
struct Person {
    var name: String
    var age: Int
}

let p1 = Person(name: "사람1", age: 20)
let p2 = Person(name: "사람2", age: 20)

//p1 == p2  // 구조체에서는 기본적으로 같고 다름을 알려주지 않는다. 아래 확장 코드가 없다면 여긴 에러가 난다.
//p1 != p2

extension Person: Equatable {}  // 구조체의 경우는 Equatable 프로토콜을 채택하는 것만으로 같고 다름을 알려줄 수 있다.
                                // 물론 메서드를 따로 만들어 다른 방식의 구현으로 ==을 사용하는 것도 가능하다.
p1 == p2
p1 != p2

// 클래스의 경우
class Dog {     // 우선 클래스도 기본적으로 Equatable을 따르지 않으면 같은지 다른지를 판별할 수 없다.
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

extension Dog: Equatable {
    static func == (lhs: Dog, rhs: Dog) -> Bool {
        return (lhs.name == rhs.name) && (lhs.age == rhs.age) // 또한 클래스에서는 이렇게 직접 어떤 경우가 같은건지 구현을 해줘야한다.
    }
}

let dog1 = Dog(name: "초코", age: 10)
let dog2 = Dog(name: "보리", age: 3)

dog1 == dog2
dog1 != dog2        // ==을 구현했다면 !=은 자동으로 컴파일러가 구현해준다. 같지 않다면 모두 다른 경우이기 때문이다.
