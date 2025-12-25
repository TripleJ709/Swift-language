import UIKit

/*
 1. 클래스의 인스턴스 메서드
 처음 클래스와 구조체를 배울 때 사용했던 메서드와 동일하다 일반적인 함수 형태를 띈다.
 */

class Dog {
    var name = "Leo"
    var weight = 3.5
    
    func info() {  // 이 함수가 인스턴스 메서드이다.
        print("이름은 \(name)이고 몸무게는 \(weight)입니다.")
    }
}

var dog = Dog()
dog.info()




/*
 2. 구조체의 인스턴스 메서드
 지금까지 속성과 같은 곳에선 클래스와 구조체의 차이가 없기에 구조체를 다루지 않았지만 인스턴스 메서드에선 약간 다른 점이 있기에 따로 알아보자.
 */

class Person {
    var name = "triple"
    
    func setName(name: String) { // 이렇게 클래스에서는 자신의 속성을 변경하려고 하면 아무런 제약이 없다.
        self.name = name
    }
}

var person = Person()
person.setName(name: "Leo") // 전혀 이상함 없는 코드이다.


struct Person2 {
    var name = "triple"
    
    mutating func setName(name: String) {
        self.name = name        // 이렇게 구조체에서 자신의 속성을 변경하려면 mutating이라는 키워드가 필요하다. 만약 까먹고 쓰지 않더라도 컴파일러가 알려주기 때문에 걱정할 필요는 없다. 이런 차이점이 있다는 것을 알려주기 위해 적었다.
    }
}
