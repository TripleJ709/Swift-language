import UIKit

/*
 1. Never타입과 검증함수
 */

// 일반적인 함수의 리턴
func doSomething() -> String {
    print("어떤 일")
    print("어떤 일 2")
    return "반환하기"       // 일반적으로 함수는 return에서 리턴 값과 함께 cpu제어권을 넘겨준다.
}

// 리턴형이 Never인 경우
func doSomething2() -> Never {  // 이 경우 제어권을 다시 넘기지 않는다. 이 함수에서 앱이 종료됨.
    fatalError("해킹 시도 발견")   // Never타입은 내부가 빈 열거형으로 구현돼 있고, 임시적인 타입이라고 보면 됨. 타입이지만 인스턴스로 생성할 수 없다.
}                              // 런타임에 발생할 수 있는 에러를 미리 발견하고 검증 및 테스트를 하기 위해 쓰인다. 여기선 해킹이라는 좀 극단적인 예시를 들었지만 가벼운 에러라면 배포 전 삭제하는 것이 좋다.(사용성에 문제가 생길 수 있음)

// 디버깅 함수 - 앱을 테스트 해서 런타임동안 발생할 수 있는 버그들의 가능성을 보고 잘못된 코드의 검증을 수행하는 함수들, 여기에는 print도 포함된다.
// - assert()
// - assertionFailure()
// - precondition()
// - preconditionFailure()
// - fatalError()

// precondition() - 실제 앱 출시시에도 앱을 강제 종료 시켜야하는 상황에 사용
func appUpdateCheck1() {
    let update = false
    precondition(update, "앱을 업데이트 하지 않음")   // precondition의 함수는 Bool값으로 true면 에러 출력하며 그 뒤 문자열로 출력하고 싶은 에러 문장을 사용함
}

func appUpdateCheck2() {
    let update = false
    
    if update {
        // 앱을 업데이트 했을때, 정상적으로 실행할 코드
    } else {
        preconditionFailure("앱을 업데이트 하지 않음") // preconditionFailure함수는 만나면 바로 에러 출력
    }
}

// assert() - 예상 범위는 벗어났지만 아주 유의미한 정도는 아니기 때문에 굳이 종료를 시킬 필요가 없을 때
func enterWrongValue1() {
    let someWrongInput = -1
    assert(someWrongInput > 0, "유저가 값을 잘못 입력")  // 위 함수와 동일하게 작동
}

func enterWrongValue2() {
    let someWrongInput = -1
    
    if someWrongInput > 0 {
        // 정상적으로 처리하는 코드
    } else {
        assertionFailure("유저가 값을 잘못 입력")    // 위 함수와 동일하게 작동
    }
}
