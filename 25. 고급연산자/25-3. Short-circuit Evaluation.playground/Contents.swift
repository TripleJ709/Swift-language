import UIKit

/*
 1. 단락평가
 우선 논리연산자부터 간단하게 다시 보자. !는 부정, ||는 or, &&는 and다
 여기서 or, and연산자를 보면 or는 양 옆 피연산자들중 하나만 true여도 반드시 true가 나온다. 그렇다면 true || false 라는 식에서 앞이 true인걸 확인한 이상 뒤 피연산자가 true인지 false인지 판단할 필요 없이 반드시 true가 나온다는 것이다.
 or와 마찬가지로 and에서도 양 옆 피연산자중 하나만 false여도 반드시 false가 나온다. false && true인 경우 앞에서 false라는 것만 확인하면 뒤는 확인할 필요가 없다.
 Swift에서는 이런 방식을 사용한다. 이게 어떤 문제를 발생할 수 있는지 알아보자.
 */

var num = 0

@MainActor func doSomething() -> Bool { // 이 함수를 실행하게 되면 외부의 변수인 num에 1의 값을 더해준다.
    num += 1
    return true
}

//doSomething()     // 여기서 1이 늘어나는걸 확인할 수 있다.
//print(num)

if doSomething() || doSomething() {
              // 또는 여기서 &&해보기
}

print(num)  // 여기서 값이 1이 나온다. if조건문에서 분명 2번의 함수를 실행하려 했지만 or연산자에서 앞의 값이 true이기 때문에 뒤는 볼 것 없이 true라고 판단해 넘어간 것이다.
            // 이처럼 외부의 값을 활용할 때는 이 단락평가도 봐야할 때도 있다. 에러는 나지 않지만 함수의 호출 횟수 때문에 논리적인 문제가 생길 수도 있다.
