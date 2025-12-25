import UIKit

/*
 1. 메서드로 값 계산하기
 앞서 클래스에서 배웠던 메서드를 이용해서 2025년 기준 생년을 기준으로 나이를 계산해보자.
 */

class Birth {
    var age: Int
    var birthYear: Int
    
    func getAge() -> Int {
        return 2025 - birthYear + 1
    }
    
    func setBirthYear(birthYear: Int) {
        self.birthYear = birthYear
    }
    
    init(age: Int, birthYear: Int) {
        self.age = age
        self.birthYear = birthYear
    }
}

var birth = Birth(age: 1, birthYear: 2025)
birth.setBirthYear(birthYear: 1999)
birth.getAge()                      // 이런식으로 메서드로 나이를 알 수 있는 작업을 할 수 있다. 물론 약간의 억지가 있는 예제이므로 메서드만 가지고 보자




/*
 2. 계산 속성
 위 두개의 메서드를 계산 속성이라는 속성을 이용해 간단하게 처리할 수 있다.
 다른 예제로 알아보자.
 참고로 계산 속성은 데이터 영역에 있는 클래스 안에 주소값을 갖고 있다. 코드영역에서 실제 실행되는 명령어들중 계산속성이 실행해야 하는 코드 블럭의 시작점 주소를 갖는다.
 */

class BMI {
    var height: Double = 180
    var weight: Double = 75
    
    var bmi: Double {               // 계산 속성은 이렇게 타입을 꼭 명시해주고 get블럭과 set블럭을 만든다. get에는 리턴할 값, set에는 들어온 값을 처리하는 로직을 만들면 된다.
        get {
            return weight / height / height * 10000
        }
        set {
            self.weight = newValue * height * height / 10000  // newValue라는 새로운 키워드가 있는데 set블럭으로 변경할 파라미터이다. set(n)처럼 직접 파라미터를 사용하는 것도 가능하다.
        }                                                     // 참고로 set블럭은 bmi값이 들어왔을 때 몸무게를 계산하는 로직이다.
    }
}

var person = BMI()

person.bmi
person.bmi = 25 // 여기서 25는 newValue값으로 들어가게 된다.
person.weight

class BMI2 {
    var height: Double = 180
    var weight: Double = 75
    
    var bmi: Double {
        get {
            return weight / height / height * 10000 // 계산 속성에는 get블럭만 있어도 되지만 get없이 set블럭만 있는 것은 허용하지 않는다.
        }
    }
    
    var bmi2: Double {
        return self.bmi  // 참고로 get블럭만 있을 경우 get또한 생략할 수 있다.
    }
}
