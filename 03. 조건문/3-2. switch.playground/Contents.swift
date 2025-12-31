import UIKit

/*
 1. switch문
 if문과 같은 조건문이지만 약간 다르게 사용됨
 if문은 1번 조건, 2번 조건 등 차례로 따지지만,
 switch문은 특정 변수에 대해 적용되는 값을 찾아 실행함(switch문도 내부적인 순서는 있지만 병렬로 실행되는 듯한 느낌)
 */

var season = "봄"

switch season { // switch 후 비교할 변수명을 사용함
case "봄":       // 반드시 switch에서 사용한 변수와 같은 타입을 사용해야함 여기선 season이 String타입이기 때문에 "봄", "여름"과 같은 String타입을 사용해야만 비교 후 실행하게 됨
    print("눈이 녹는 계절")
case "여름":
    print("꽃 피는 계절")
case "가을":
    print("하늘 높은 계절")
case "겨울":
    print("눈 내리는 계절")
default:        // 반드시 해당 타입의 모든 경우의 수를 써야하며 String타입의 경우 가능성이 사실상 무한이라 default를 이용해 case에 나오지 않은 값에 대해 매칭시킬 수 있다.
    print("알 수 없는 계절")
}




/*
 2. fallthrough
 switch문은 기본적으로 case에 한번 해당되게 되면 그 블록을 실행하고 switch문을 빠져나오게 된다. 만약 다음 블럭까지 실행하고 싶다면 fallthrough를 사용하면 된다.
 */

switch season {
case "봄":
    print("눈이 녹는 계절")
    print("다음 계절은?")
    fallthrough  // 이처럼 봄 케이스에 해당하는 블럭을 실행한 뒤 다음 블럭까지 넘어가 여름 케이스에 해당하는 블럭까지 실행할 수 있다.
case "여름":
    print("꽃 피는 계절")
case "가을":
    print("하늘 높은 계절")
case "겨울":
    print("눈 내리는 계절")
default:
    print("알 수 없는 계절")
}




/*
 3. 범위 연산자
 "..."으로 표현하며 양쪽 피연산자에 해당하는 범위만큼 값을 가지는 변수이다.
 "..<"는 오른쪽 피연산자보다 작은 숫자까지 값을 가지게 되며 ...과 ..<은 다른 타입이다.
 */

var range1 = 1...5
var range2 = 1..<5

print(type(of: range1))
print(type(of: range2))




/*
 4. switch에서 범위 연산자
 */

var temperature = 20

switch temperature{
case ..<0:
    print("엄청 추운 영하의 날씨")
case 0..<10:
    print("추운 날씨")
case 10..<20:
    print("보통적인 날씨")
default:
    print("따뜻한 날씨, \(temperature)도")
}




/*
 5. switch문의 활용
 바인딩 - switch에 사용한 변수를 조건에 따라 나누고 싶을 때 쓸 수 있다.
 where절 - let x로 switch변수를 바인딩했을 때 조건을 추가할 수 있다. 아래 예시에서 이해하는 것이 빠르다.
 */

var num = 100

switch num {
case let x where x % 2 == 0: // 이 조건을 보면 num은 정수이지만 짝수인지 판별을 하기 위해 true, false를 알고 싶다면 바인딩 후 조건을 사용해 조건문을 사용할 수 있다. (원칙적으로 switch에서 정수타입의 num을 사용했다면 정수타입의 case만 들어올 수 있다.)
    print("num은 짝수입니다.")
case let x where x % 2 != 0:
    print("num은 홀수입니다.")
default:
    print("알 수 없는 숫자입니다.")
}

