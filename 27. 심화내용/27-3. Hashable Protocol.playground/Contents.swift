import UIKit

/*
 1. Hashable프로토콜
 앞 챕터중 간단히 언급한 적 있는데 딕셔너리와 세트에서 사용한다. 각 요소들이 유니크한지 판단하는 요소이다.
 당연히 같은지 다른지를 알아야 유니크한지 알 수 있으므로 Equatable프로토콜을 상속받고 있다.
 클래스의 예시로 보자.
 */

class Person: Hashable {
    func hash(into hasher: inout Hasher) {  // 이렇게 어떤 값이 유니크한지 판별할 수 있는 코드가 필요하다.
        hasher.combine(name)
        hasher.combine(age)
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return (lhs.age == rhs.age) && (lhs.name == rhs.name) // 클래스에선 ==연산자도 필요하다. 구조체에선 없어도 된다.
    }
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let array: Set<Person> = [Person(name: "사람1", age: 20), Person(name: "사람2", age: 30)]
