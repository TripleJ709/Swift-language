import UIKit

/*
 1. Comparable프로토콜
 간단하게 크고 작은지 비교를 할 수 있는 프로토콜이라고 볼 수 있다. 대소 구분이 가능하다면 그걸 이용해 정렬도 가능하므로 이 프로토콜에는 정렬도 가능하다.
 우선 비교를 하기 위해선 서로가 같은지를 알아야 하기 때문에 Equatable프로토콜을 상속받고 있다.
 이 프로토콜 또한 Swift에서 기본적으로 제공하는 타입들은 이미 채택하여 사용중이며 우리가 무의식적으로 사용하였다.
 여기서도 알아봐야할 것은 커스텀 타입이다.
 */

// 열거형의 경우
enum Direction: Int, Comparable {
    static func < (lhs: Direction, rhs: Direction) -> Bool {
        return lhs.rawValue < rhs.rawValue      // 직접 구현해서 어떤 경우가 더 큰지 알려야 한다.
    }
    // 원시값을 이용해 각 케이스는 0부터 3까지의 정수를 갖고 있다.
    case east, west, south, north
}

var d1 = Direction.east
var d2 = Direction.west

d1 < d2             // 여기서도 < 메서드만 만들어 주면 나머지 경우는 컴파일러가 만들어준다.
d1 > d2
d1 <= d2
d1 >= d2

// 구조체의 경우
struct Person: Comparable {
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.age < rhs.age    // 나이가 많으면 더 크다고 구현
    }
    
    var name: String
    var age: Int
}

let p1 = Person(name: "사람1", age: 20)
let p2 = Person(name: "사람2", age: 30)

p1 < p2
p1 > p2
p1 <= p2
p1 >= p2

// 클래스의 경우
class Dog: Comparable {
    static func < (lhs: Dog, rhs: Dog) -> Bool {
        return lhs.age < rhs.age
    }
    
    static func == (lhs: Dog, rhs: Dog) -> Bool {
        return lhs.age == rhs.age       // 클래스에서는 Equatable프로토콜의 요구사항까지 구현해줘야한다.
    }
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let dog1 = Dog(name: "초코", age: 10)
let dog2 = Dog(name: "보리", age: 3)

dog1 < dog2
dog1 > dog2
dog1 <= dog2
dog1 >= dog2
