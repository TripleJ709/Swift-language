import UIKit

/*
 1. filter함수
 filter는 말그대로 필터링을 해주는 함수다.
 numbers.filter(<#T##isIncluded: (Int) throws -> Bool##(Int) throws -> Bool#>) 이렇게 보이게 되는데 여기서 보면 함수 타입으로 (Int) -> Bool 타입의 함수이다.
 리턴 타입이 Bool인 것을 보면 예상할 수 있지만, true인 요소는 그대로 냅두고 false인 요소는 배열에서 제거해 새로운 배열을 만든다.
 */

let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let a = numbers.filter { a in
    return a % 2 == 0           // 짝수인지 판별하는 방법
}

print(a)        // 2, 4만 포함된 배열이 나오는 걸 보아 filter함수가 잘 적용 되었다.

let b = numbers.filter { $0 % 2 == 0 } // 앞서 배운 축약 문법을 이용해 이렇게도 표현할 수 있다.
                                       // 지금 배우는 함수들은 각 요소를 한번씩 돌며 어떤 기능을 수행하는데 이는 반복문과 유사하다.
                                       // 하지만 반복문보다 훨씬 간결한 문장이 된다. 반복문일 경우 변수를 선언하고, if문으로 상태를 확인하고 continue를 쓰는 등 꽤 긴 코드가 될텐데 단 한줄로 똑같은 표현이 가능하다.




/*
 2. reduce함수
 reduce는 각 요소를 돌아가며 초기값에 어떤 대응을 하는 함수다. 말로만 보기엔 좀 어려울 수 있지만 예제를 보면 어렵지 않게 이해할 수 있을 것이다.
 numbers.reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Int) throws -> Result##(Result, Int) throws -> Result##(_ partialResult: Result, Int) throws -> Result#>) reduce는 앞선 2개의 함수와 다르게 2개의 파라미터를 요구한다.
 첫번째 파라미터는 초기값, 두번째 파라미터는 함수를 요구한다. 또한 reduce는 새로운 배열이 아닌 하나의 값만 반환한다.
 */

let c = numbers.reduce(0) { sum, num in // 첫번째 파라미터로 0을 넣어줬는데 초기값이다. 그리고 클로저 안의 파라미터엔 또 2개의 파라미터가 필요한데, 첫번째는 초기값을 매 요소마다 새로 가져온다.
    sum + num                           // 우선 이 함수의 목적은 각 배열의 요소를 모두 더하는 것이다. 처음엔 sum에 초기값으로 설정해둔 첫번째 파라미터 0이 들어가고 num엔 첫번째 요소인 1이 들어간다.
}                                       // 그 뒤 클로저 내부를 실행해 두 값을 더하고 1이 나온다. 그럼 sum에는 1이 들어가고 num에는 두번째 요소인 2가 들어간다. 그렇게 3이 되고, sum엔 다시 그 3이 들어간다.
                                        // 이렇게 쭉 실행되어 1부터 10까지 모두 더한 값인 55가 나오게 된다.
print(c)
