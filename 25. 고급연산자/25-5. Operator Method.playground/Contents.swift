import UIKit

/*
 1. 연산자 메서드
 사실 연산자도 내부적으로 구현이 다 되어 있는 타입 메서드이다.
 */

"Hello" + "World"

// static func + (lhs: String, rhs: String) -> String 문자열 더하기는 내부적으로 이렇게 선언되어 있다.
// 아래는 Swift 공식문서 예제이다.

struct Vector2D {  // 커스텀 타입의 구조체를 만들었다. 당연히 여기엔 +연산자가 없을 것이다.
    var x = 0.0
    var y = 0.0
}

extension Vector2D {
    static func + (lhs: Vector2D, rhs: Vector2D) -> Vector2D {  // 이런 방법으로 연산자를 직접 구현할 수 있다.
        return Vector2D(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right                                     // 복합 할당 연산자는 구현이 안되어 있기 때문에 반드시 풀어서 사용해야한다.
    }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)

let combinedVector = vector + anotherVector

// 연산자의 우선 순위 선언 - 연산자에는 우선 순위가 있다. 연산자 챕터에서 언급한 적이 있다.
// 아래와 같이 커스텀 연산자의 경우 우선 순위를 결정해줘야 한다.

precedencegroup MyPrecedence {            // higherThan 또는 lowerThan 둘중에 하나는 반드시 지정해야함
    higherThan: AdditionPrecedence        // ~보다 높은(higherThan): 지정하려는 그룹보다 순위가 낮은 그룹
    lowerThan: MultiplicationPrecedence   // ~보다 낮은(lowerThan): 지정하려는 그룹보다 순위가 높은 그룹
    associativity: left          // 결합성 ===> left / right / none
}

infix operator +-: MyPrecedence

extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}

let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)

let plusMinusVector = firstVector +- secondVector

// 단항 연산자의 경우 추가적인 키워드가 필요하다. 전치인지 후치인지가 중요하기 때문

// 연산자의 선언
prefix operator +++

// 실제 정의
extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector   // 복합할당 연산자는 이미 구현되어있기 때문에 사용 가능
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled

// 연산자의 선언
prefix operator ++

// 실제 정의
extension Int {
    static prefix func ++(number: inout Int) {
        number += 1
    }
}

var a = 0
++a
++a
++a
print(a)
