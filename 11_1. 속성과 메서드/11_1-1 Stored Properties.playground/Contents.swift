import UIKit

/*
 1. 저장속성
 지금까지 클래스와 구조체에서 사용했던 속성이 모두 저장속성이라고 보면 된다.
 기본적으로 메모리에 저장하고 사용하는 용도로 쓰이고 힙 영역 인스턴스 안에 존재하게 된다.
 */

class Dog {
    var name: String
    var weight: Double // 여기 이름과 몸무게가 저장속성이다.
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
}

var dog = Dog(name: "Leo", weight: 3.5)
dog.name
dog.name = "LLeo" // 이처럼 저장속성에 접근하여 값을 가져올 수도, 값을 변경할 수도 있다.
