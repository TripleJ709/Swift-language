import UIKit


/*
 1. 메모리 안전 개념
 멀티스레드의 환경에서만 메모리 충돌이 일어나는 것은 아니다.
 코드로 보면 꽤 긴것들도 있지만 코드에 너무 집중하지 말고 단일스레드에서도 메모리가 안전하지 않은 상황이 있다는 것을 염두해두자는 의미의 챕터다.
 */

var stepConflict = 1

// 변수 stepConfilt에 장기적인 쓰기 접근 (입출력 파라미터)
@MainActor func increment(_ number: inout Int) {
    number += stepConflict    // 변수 stepConfilt에 읽기 접근  // number = number + stepConflict
}

//increment(&stepConflict)   // 메모리에 동시접근으로 인한 문제 발생가능
// 이럴떈 다른 변수를 만들어서 값을 복사해 해결할 수 있다.

var stepSize = 1
var copyOfStepSize = stepSize

@MainActor func incrementing(_ number: inout Int) {
    number += stepSize
}

incrementing(&copyOfStepSize)

// 원본을 다시 바꿔주는 과정만 거치면 된다.
stepSize = copyOfStepSize





// 아래는 구조체의 경우에서의 메모리 안전의 경우다.

func balance(_ x: inout Int, _ y: inout Int) { // 평균값 설정하는 함수
    let sum = x + y
    x = sum / 2
    y = sum - x
}

// 구조체 정의
struct Player {
    var name: String
    var health: Int
    var energy: Int
    
    // 타입 속성
    static let maxHealth = 10
    
    // health값을 바꾸는 메서드 (self.health에 접근)
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}

// 확장
extension Player {
    // 자신의 체력과, 동료의 체력을 공유해서 평균 설정
    mutating func shareHealth(with teammate: inout Player) {   // 메모리 장기적 접근
        balance(&teammate.health, &health)
    }
}


var mario = Player(name: "마리오", health: 10, energy: 10)
var luigi = Player(name: "루이지", health: 5, energy: 10)



// "마리오"와 "루이지"의 체력을 공유
mario.shareHealth(with: &luigi)   // 괜찮음


// "마리오"와 "마리오"의 체력을 공유하려면 에러
//mario.shareHealth(with: &mario)

// 튜플 만들기
var playerInformation = (health: 10, energy: 20)

// 튜플에 대한 동시접근 문제
//balance(&playerInformation.health, &playerInformation.energy)

// 새로운 플레이어 생성
var yosi = Player(name: "요시", health: 10, energy: 10)

// 하나의 인스턴스(요시)의 체력과 에너지를 평균만들려고 하면?
//balance(&yosi.health, &yosi.energy)   // 에러 발생


// 전역이 아닌 "지역 변수"로 만들어서 접근하는 것은 괜찮음
func someFunction() {
    var yosi2 = Player(name: "요시2", health: 10, energy: 10)
    balance(&yosi2.health, &yosi2.energy)   //
}
