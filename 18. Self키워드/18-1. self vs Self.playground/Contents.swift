import UIKit

/*
 1. self VS Self
 간단하게 생각하면 self는 인스턴스 자신을 가르키고 Self는 타입 자신을 가르킨다고 나눌 수 있다.
 사용하는 경우 몇개를 나열해 익혀보도록 하자.
 */

// self사용
// 1

class Person {
    var name: String
    
    init(name: String) {
        self.name = name // 여기선 인스턴스를 가르키기 위해 사용된다.
    }
}


// 2

struct Calulator {
    var number: Int = 0
    
    mutating func plusNumber(_ num: Int) {
        number += num
    }
    
    mutating func reste() {
        self = Calulator()      // 값 타입에서는 자기 자신을 치환하는 것도 가능하다.(값 타입의 특징이며 참조 타입인 클래스에서는 이런 방법 불가능)
    }
}


// 3

struct Astruct {
    static let club = "iOS"
    
    static func doPrint() {
        print("\(self.club)소속입니다.") // 타입멤버에서 self를 사용하게 되면 자신의 타입을 가르키게 된다. 이처럼 좀 다르게 사용되기도 하는데 이런 경우를 위해 여러 케이스를 알아두면 좋다.
    }
}


// 4

class Aclass {
    static let name = "triple"
}

let aClass: Aclass.Type = Aclass.self // 메타타입으로 이런 경우도 있구나로 넘어가고 나중에 메타타입에 대해 배워보자




// Self사용
// 1

extension Int {
    static let zero: Self = 0   // 여기서 Self를 사용하게 되면 자신의 타입인 Int를 알리게 된다.
    // static let zero: Int = 0 // 이것도 틀린것은 아님
    
    // 또는 메서드에서도 타입 반환 등으로 사용이 가능하다.
    var zeor: Self {
        return 0
    }
    
    static func toZero() -> Self {
        return Self.zero
    }
}


// 2
// 이진법으로 표현된 정수에서 쓰이는 프로토콜

extension BinaryInteger {     // 사실 이 프로토콜은 Int, UInt등 여러 타입에서 사용될 수 있는데 만약 Self키워드를 사용하지 않는다면 Int, UInt등 여러 타입에 대한 메서드들을 만들어야하기 때문에 불편함이 있다.
    func squared() -> Self {  // 여기서 Self는 타입 자체를 가르키게 됨
        return self * self    // 여기서 self는 인스턴스 자체를 가르키게 됨
    }
}
