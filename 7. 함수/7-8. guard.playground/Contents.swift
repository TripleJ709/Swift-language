import UIKit

/*
 1. guard문
 guard도 조건문이다. if와 유사하지만 if는 조건이 참일때 블럭을 실행시키는 반면, guard는 조건이 맞다면 넘어가고 조건이 맞지 않다면 블럭을 실행시킨다.
 보통 함수의 조기 종료를 시킬때 쓰인다.
 */

func doSomething(password: String) {
    guard password.count >= 13 else { // guard 뒤에 조건식을 쓰고 반드시 else문이 나와야 하며, return, throw등 종료문이 필요하다
        print("비밀번호는 13자리 이상으로 만들어주세요.")
        return
    }
    print("회원가입에 성공했습니다 !")
}

// if에선 여러 조건을 중첩할경우 가독성이 떨어지지만 guard는 그렇지 않다.

if true {
    if true {
        if false {
            //이런식으로 계속 들여쓰기가 되면서 읽기가 어려워진다.
        }
    }
}

func doSomething2() {
    guard true else { return }
    guard false else { return }
    guard true else { return } // 이렇게 여러 조건을 판별하더라도 안으로 들어가는 경우가 없기 때문에 보기에 훨씬 편하다.
}
