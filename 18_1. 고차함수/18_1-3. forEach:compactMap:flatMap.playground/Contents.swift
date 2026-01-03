import UIKit

/*
 1. forEach함수
 map과 정말 유사하다. map은 각 요소를 어떤 기능을 통해 매핑하는 반면 forEach는 각 요소를 어떤 일만하고 따로 리턴은 하지 않는다.
 numbers.forEach(<#T##body: (Int) throws -> Void##(Int) throws -> Void#>) 함수를 보면 반환 타입이 Void다 아무것도 리턴하지 않는다는 뜻으로 내부 구현만 하면 된다.
 */

let numbers = [1, 2, 3, 4, 5]
numbers.forEach { number in
    print("현재 숫자는 \(number)입니다.")
}




/*
 2. compactMap함수
 nil포함한 옵셔널 배열에서 nil값을 지운다. nil을 모두 지우고 반환하기 때문에 옵셔널 타입이 지워지게 된다.
 optionalArray.compactMap(<#T##transform: (Int?) throws -> ElementOfResult?##(Int?) throws -> ElementOfResult?#>) 이렇게 나오게 되는데 다른 함수와 똑같이 사용하면 된다.
 */

let optionalArray = [1, 2, nil, 3, nil, 4, nil, 5, 6]
let a = optionalArray.compactMap { $0 }
print(a)



/*
 3. flatMap함수
 고차원 배열을 1차원 배열로 만들어주는 함수다.
 intArray.flatMap(<#T##transform: ([Int]) throws -> Sequence##([Int]) throws -> Sequence#>) 이 함수 또한 앞선 함수들처럼 사용하면 된다.
 */

let intArray = [[1,2,3],[4,5,6],[7,8,9]] // [[Int]]타입의 배열이다.
let b = intArray.flatMap { $0 }
print(b)
