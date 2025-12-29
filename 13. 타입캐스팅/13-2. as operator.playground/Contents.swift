import UIKit

/*
 1. as연산자
 as연산자는 해당 타입으로 변환이 가능한지에 대한 연산자다.
 가능하면 변경하고 불가능하면 nil을 리턴하기도 한다.
 아래 예제에서 Person < Student < Undergraduate인데
 상위 클래스에서 하위 클래스로(다운 캐스팅)은 항상 가능하지 않다. nil을 리턴할 수 있다.
 하위 클래스에서 상위 클래스로(업 캐스팅)은 항상 가능하다.
 */

class Person {
    var id = 0
    var name = "Triple"
    var email = "ijn9907@gmail.com"
}

class Student: Person {
//    var id = 0
//    var name = "Triple"
//    var email = "ijn9907@gmail.com"
    
    var studentId = 1
}

class Undergraduate: Student {
//    var id = 0
//    var name = "Triple"
//    var email = "ijn9907@gmail.com"
//    var studentId = 1
    
    var major = "컴퓨터"
}

let person1 = Person()
let student1 = Student()
let undergraduate1 = Undergraduate()

person1.id
person1.name
person1.email
//person1.studentId
//person1.major     // 위 두 속성은 접근이 불가능하다. 당연히 Person의 메모리 공간만큼 갖고 있기 때문

let person1_1 = person1 as? Undergraduate
// let person1_2 = person1 as! Undergraduate // 이 두 방법으로 타입에 대한 힌트를 컴파일러에게 주는 것이다. ?은 옵셔널 타입으로 반환하며 !는 강제로 옵셔널을 벗긴 채 주게 된다. 물론 nil이라면 에러
                                             // 그러므로 ?를 쓰는 습관을 가지자

if let person1_1 {
    person1_1.studentId
    person1_1.major     // 접근 가능
}


// 물론 위 방법은 정상적으로 타입 변경을 할 수 없다. person1은 Person타입으로 인스턴스를 찍어냈기 때문에 애초에 studentId, major에 대한 메모리 공간을 갖고 있지 않다. 아래 예제가 정확하게 변경에 성공한다.

var undergraduate2: Person = Undergraduate()
undergraduate2 is Person
undergraduate2 is Student
undergraduate2 is Undergraduate     // 현재 Person타입만 가질 수 있는 것을 확인했다.

let undergraduate2_1 = undergraduate2 as? Undergraduate // 처음부터 Undergraduate만큼의 메모리 공간을 갖고 있는 선에서 변환이 가능하다.

if let undergraduate2_1 {
    undergraduate2_1.studentId
    undergraduate2_1.major // 이젠 진짜 실행 가능
}

let undergraduate2_2 = undergraduate2_1! as Person // 바로 위에서 undergraduate2_1이 nil이 아닌 것을 확인했으니 !로 강제로 벗긴 뒤
                                                   // Person타입으로 업캐스팅 해보았다. 업캐스팅은 메모리 공간에 대한 권한을 더 만드는 것이 아니기 때문에 항상 성공한다.



