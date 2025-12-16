import UIKit

/*
 1. if문
 true와 false에 따라 중괄호({}) 블럭을 실행할지 안할지 분기를 나누는 문법
 if 조건문 형식으로 사용한다.
 */

var grade = 100

if grade > 90 { // grade > 90은 비교연산자로 반드시 true, false값이 나오고 true일 때 중괄호 블럭을 실행한다. 만약 grade를 90이하로 설정하면 print문은 실행되지 않음
    print("A등급입니다!")
}




/*
 2. if else문
 if가 실행되지 않았을 때 else의 중괄호 블럭이 실행된다.
 */

if grade < 60 { // grade는 100으로 60보다 높기 때문에 false이므로 if문이 실행되지 않는다.
    print("불합격입니다.")
} else { // if문이 실행되지 않았기 때문에 else문이 반드시 실행된다. 반대로 if문이 실행된다면 else문은 실행되지 않는다.
    print("합격입니다!")
}




/*
 3. if else-if문
 if가 실행되지 않았을 때, 다음 조건을 보고 실행될 수도 있다.
 예시 코드를 보고 이해하는 것이 빠르다.
 */

if grade < 60 {
    print("불합격입니다.")
} else if grade < 70 { // grade가 60보다 낮은 값은 위 if에서 걸러졌기 때문에 60 <= grade < 70의 범위를 보는것과 같다.
    print("재시험 대상자입니다.")
} else if grade > 80 { // else if는 몇개를 쓰든 상관없다. 1개부터 100개까지 자유롭게 사용하면 된다.
    print("합격입니다!")
}



/*
 4. if else-if else문
 위의 모든 경우를 합친 케이스로 다양하게 사용할 수 있다.
 */

if grade < 60 {
    print("F입니다.")
} else if grade < 70 {
    print("D입니다.")
} else if grade < 80 {
    print("C입니다.")
} else if grade < 90 {
    print("B입니다.")
} else {
    print("A입니다.")
}



/*
 5. if의 논리
 if문은 위에서부터 순차적으로 판별식을 판단하기 때문에 논리적인 오류가 발생할 수 있다.
 이를 잘 생각해서 논리적인 오류가 없도록 해야한다.
 */

// 아래는 논리적인 오류가 있는 경우
var a = 10

if a > 0 { // 실행했을 때 컴파일러 오류는 뜨지 않지만 a에 어떤 양수 값을 넣더라도 양수인지만 알 수 있고 짝수인지 홀수인지는 알 수 없다. 논리적으로 잘 써내려가야한다.
    print("a는 양수입니다.")
} else if a % 2 == 0 {
    print("a는 짝수입니다.")
} else if a % 2 == 1 {
    print("a는 홀수입니다.")
} else {
    print("a는 음수입니다.")
}

// 위 코드를 보완한 경우
if a > 0 {
    print("a는 양수입니다.")
    if a % 2 == 0 { // 이처럼 if안에 if를 또 쓸 수 있다. 보통 중첩된다고 말하며 중첩 또한 몇번을 하든 상관없다.
        print("a는 짝수입니다.")
    } else {
        print("a는 홀수입니다.")
    }
} else {
    print("a는 음수입니다.")
}
