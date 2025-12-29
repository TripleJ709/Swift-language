import UIKit

/*
 1. 다형성
 다형성은 하나의 인스턴스가 여러가지 행동을 할 수 있다고 볼 수 있다. 좀 더 정확히는 하나의 객체가 여러가지 타입의 형태로 표현될 수 있음을 의미
 다형성이 구현되기 위해서 상속이 필요하기 때문에 상속과 밀접하다고 볼 수 있다.
 */

class Person {
    var id = 0
    var name = "Triple"
    var email = "ijn9907@gmail.com"
    
    func walk() {
        print("사람이 걷는다.")
    }
}

class Student: Person {
//    var id = 0
//    var name = "Triple"
//    var email = "ijn9907@gmail.com"
    
    var studentId = 1
    
    override func walk() {
        print("학생이 걷는다.")
    }
    
    func study() {
        print("학생이 공부한다.")
    }
}

class Undergraduate: Student {
//    var id = 0
//    var name = "Triple"
//    var email = "ijn9907@gmail.com"
//    var studentId = 1
    
    var major = "컴퓨터"
    
    override func walk() {
        print("대학생이 걷는다.")
    }
    
    override func study() {
        print("대학생이 공부한다.")
    }
    
    func party() {
        print("대학생이 파티를 한다.")
    }
}

let people: [Person] = [Person(), Student(), Undergraduate()]

for person in people {
    person.walk()   // 여기서 같은 타입(Person)이지만 각기 다른 메서드를 실행하는 것을 볼 수 있다.
}


// 좀 더 메모리 관점으로 보자면 예를 들어, Undergraduate타입은 Person만큼의 접근 권한을 갖고 있다고 보면 된다. 하지만 여전히 힙에 있는 인스턴스가 가르키는 대상은 데이터영역의 Undergraduate인데,
// Undergraduate타입은 재정의한 walk를 갖고 있기 때문에 서로 다른 함수 결과를 낳는다.
