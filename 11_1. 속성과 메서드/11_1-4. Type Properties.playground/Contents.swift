import UIKit

/*
 1. 타입 속성
 타입 속성은 타입 자체의 속성이다.
 저장 속성처럼 특정 인스턴스에 국한된 속성이 아닌 어떤 인스턴스에서 접근하더라도 똑같은 값을 내보내는 속성이다. (정확히는 인스턴스가 아닌 타입에서 접근이다.)
 타입 속성은 각 인스턴스에 존재하지 않고 데이터 영역에 있는 클래스 내부에 존재하기 때문에 타입으로 접근해야 한다.
 또한 초기화의 타이밍이 없으므로 반드시 초기값이 들어가야만 한다.(없으면 에러)
 */

class Dog {
    static let spe: String = "장모치와와" // 이와 같이 static이라는 키워드가 붙으며 나머지는 변수 선언과 같다.
    
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
}

Dog.spe // 반드시 객체가 아닌 Dog과 같은 타입으로 접근해야 한다.


// 좀 더 실제에서 쓸만한 코드
@MainActor // 지금은 생각할 필요가 없는 문법이다. static var를 위해 동시성 문제가 있어 임의로 쓴 키워드로 무시하자.
class User {
    static var userCount = 0
    
    var userName: String
    var userEmail: String
    
    init(userName: String, userEmail: String) {
        self.userName = userName
        self.userEmail = userEmail
        User.userCount += 1  // 어떤 앱의 유저가 늘어날때마다 카운트를 해주는 기능
    }
}

var user1 = User(userName: "triple", userEmail: "abc123@gmail.com")
var user2 = User(userName: "iOS User", userEmail: "iphone@gmail.com")

User.userCount // 현재 유저 수는 2명인 것을 알 수 있다.




/*
 2. 계산 타입 속성
 전에 배운 계산 속성과 타입 속성이 합쳐졌다고 볼 수 있다.
 */

class Circle {
    static let pi = 3.14
    
    var radius: Double
    
    static var pi2: Double { // 이처럼 계산 속성과 타입 속성의 키워드를 동시에 쓰며 class라는 키워드를 static대신 사용할 수 있다 class를 쓰는 경우는 상속과 관련이 있는데 다음 챕터에서 배울 것
        get {
            return pi * 2
        }
        set {
            newValue / 2
        }
    }
    
    init(radius: Double) {
        self.radius = radius
    }
}
