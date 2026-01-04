import UIKit

/*
 1. 옵셔널 체이닝
 옵셔널 타입에 접근연산자를 사용할때 나오는 문법이다. 아래 예제를 먼저 보면서 설명하는 것이 이해에 빠를 것 같다.
 */

class Dog {
    var name: String?
    var weight: Int
    
    init(name: String? = nil, weight: Int) {
        self.name = name
        self.weight = weight
    }
    
    func sit() {
        print("\(self.name)이 앉았습니다.")
    }
    
    func doSomething() -> Int {
        return 10
    }
}

class Person {
    var name: String?
    var dog: Dog?
}

// 위 두 클래스를 보고 옵셔널 타입이 어떤 것이 있는지 잘 확인해보자.

var leo = Dog(name: "Leo", weight: 3)
print(leo.name)
print(leo.weight) // 여기까지 결과는 클래스를 배웠다면 어느정도 당연하게 느껴진다.

var leo2: Dog? = Dog(name: "Leo", weight: 3)
print(leo2?.name)    // 여기서 갑자기 leo2변수에 접근연산자를 사용해보니 자동완성으로 ?가 붙었다.
print(leo2?.weight)  // 이것을 옵셔널 체이닝이라고 부르는데 leo2의 타입이 옵셔널 타입이기 때문에 객체가 있을 수도 없을 수도 있다.
              // 이런 경우 ?가 붙게 되고 만약 객체가 없다면 nil을 반환하게 된다. 또한 값을 읽을때 옵셔널 값으로 나오기 때문에 정상적으로 사용하려면 벗기는 과정이 필요하다.

var person: Person? = Person()
person?.name
person?.dog?.name   // 이렇게 Person타입도 옵셔널이기 때문에 접근할 때 ?가 붙게 되며 Person클래스의 속성인 dog도 옵셔널 타입이기에 ?가 붙게 된다. 둘 중 하나라도 객체가 존재하지 않는다면 이 값은 nil이 나온다.

// 메서드를 읽을땐 리턴값이 있는 경우와 없는 경우가 달라진다.
// 리턴값이 없을경우 객체가 있을땐 평소처럼 실행되고 없으면 단순 실행되지 않을 뿐이다.
// 만약 리턴값이 있을 경우는 객체가 없을 땐 똑같이 단순 실행되지 않지만, 객체가 있어 성공적으로 실행이 됐을 땐 리턴 값이 반드시 옵셔널 값으로 나온다.(리턴값이 옵셔널 값이 아니라도 무조건이다.)
leo2?.sit()
print(leo2?.doSomething())

//또한 객체가 확실하게 있다는 것을 알고 있다면 !를 통해 강제로 옵셔널을 벗길 수 있다.
leo2!.sit() // 물론 객체가 없다면 에러가 뜨게 되는데 강제 언래핑에서도 말했듯 !라는 키워드는 웬만해선 사용하지 말자.


// 마지막으로 복잡한 경우 아래와 같은 상황이 나올 수도 있다.
// a.doSomething?()?  이 상황은 a객체의 메서드인 doSomething을 실행하려 했을때 나올 수 있는데 doSomething함수가 옵셔널로 선언 돼 있을 수 있기 때문에 소괄호 앞에 ?가 붙을 수 있다. 또한 리턴 값이 없을 수 있기 때문에 소괄호 뒤에도 ?가 붙을 수 있다.
//                    함수의 실행은 소괄호가 기준인 것을 생각해보면 이해할 수 있을 것이다.
// a.dict?["Apple"]?    이 상황은 딕셔너리에서 나올 수 있는데 딕셔너리 자체가 없을 수도 있다는 것을 의미하는 것이 앞 ?이다. 뒤 ?는 "Apple"에 매칭되는 값이 없을 수도 있다는 것을 의미한다.
