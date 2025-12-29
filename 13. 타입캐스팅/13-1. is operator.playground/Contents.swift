import UIKit

/*
 1. is연산자(Type check operator)
 is연산자는 인스턴스의 타입을 확인하는 연산자이다. 결과는 Bool타입으로 나온다.
 */

class Person {
    var id = 0
    var name = "Triple"
    var email = "ijn9907@gmail.com"
}

class Student: Person {
//    var id = 0
//    var name = "Triple"
//    var email = "ijn9907@gmail.com"  // 이 3개의 속성이 상속 받기 때문에 기본적으로 있고 여기서 추가 속성을 만들면 된다.
    
    var studentId = 1
}

class Undergraduate: Student {
//    var id = 0
//    var name = "Triple"
//    var email = "ijn9907@gmail.com"
//    var studentId = 1                 // 여긴 총 4개의 속성이 있는 것이다.
    
    var major = "컴퓨터"
}

let person1 = Person()
let student1 = Student()
let undergraduate1 = Undergraduate()

//여기서 is연산자를 사용해서 해당 인스턴스의 타입을 알아볼 수 있다.
//상속받은 타입은 상위 타입에 해당이 된다.
//Person타입은 id, name, email을 포함하고 있고 Student타입은 id, name, email, studentId를 포함하고 있다.
//여기서 Student타입은 Person타입의 모든 것을 갖고 있으므로 Person타입이라고 볼 수 있다.
person1 is Person
student1 is Person
undergraduate1 is Person

person1 is Student
student1 is Student
undergraduate1 is Student

person1 is Undergraduate
student1 is Undergraduate
undergraduate1 is Undergraduate
