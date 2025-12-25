import UIKit

/*
 1. 지연 저장 속성
 인스턴스에 접근하는 순간 초기화를 하는 속성이다.
 조금 더 자세하게 설명하면, 참조 타입과 값 타입에 따라 가지는 값이 다른데
 참조 타입일땐 해당 주소의 크기만큼 할당해두고 값 타입일 경우 해당 값의 크기만큼 할당해둔다.
 그리고 지연 저장 속성에 접근하려는 순간 해당 값을 초기화 하여 값을 가지게 된다.
 지연 저장 속성이 쓰는 이유는
 값이 너무 큰 속성이라 한번에 초기화 하기엔 비용이 많이 드는 경우
 또는 다른 속성을 사용해야하는 경우 등이 있다.
 */

class BMI {
    var height: Double
    var weight: Double
    lazy var bmi = weight / height / height * 10000 // 저장 지연 속성은 lazy라는 키워드가 필요하며 반드시 var로 선언해야한다. 없던 값에 값을 바꿔 집어 넣어야 하기 때문
    
    init(height: Double, weight: Double) {
        self.height = height
        self.weight = weight
    }
}

var person = BMI(height: 180, weight: 75) // 인스턴스 생성 당시에는 bmi 속성이 초기화가 되어 있지 않다. 메모리에는 공간은 할당이 되었지만 값은 아직 없다.
person.bmi // 이 순간 값이 할당이 된다.
