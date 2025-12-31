//아래 예시는 모두 for문으로 했지만 while문도 동일하게 적용된다.
import UIKit

/*
 1. continue
 반복문에서 이후 코드를 실행하지 않고 다음 반복으로 넘어갈 때 사용한다.
 아래 예시를 보면 이해가 빠르다.
 */

for i in 1...10 {
    if i % 2 == 0 { // i가 짝수일 때
        continue    // 이번 반복문은 넘어가겠다.
    }               // 즉, 홀수만 나온다.
    print(i)
}




/*
 2. break
 반복문에서 break를 만나게 되면 반복문 자체를 벗어나게 된다.
 */

for i in 1...10 {
    if i % 2 == 0 { // i가 짝수일 때
        break       // 반복문을 벗어난다. (다음 모든 반복을 중지함)
    }               // 결국 1만 나오고 다음 반복인 2가 짝수이기에 반복문을 나가버려 1만 출력됨
    print(i)
}




/*
 3. 중첩 사용시 적용 범위
 for문도 중첩사용이 가능하다.
 중첩됐을 때 continue나 break는 가장 인접한 for문을 빠져나간다.
 */

// 아래 코드를 천천히 잘 생각해보자. 42번째 줄부터 천천히 하나씩 읽어보면 좋다. continue와 break에 따라 실행되는 결과가 다른 이유도 생각해보자.
for i in 0...3 {
    print("OUTER: \(i)")
    for j in 0...3 {
        if i <= j {
            print("    INNER: \(j)")
            continue
            //break
        }
    }
}


print("\n\n\n") // 결과창 보고 헷갈릴 수 있기 때문에 띄워두는 코드(신경 안써도 됨)


/*
 4. 레이블이 매겨진 반복문
 각 반복문에 이름이 새겨질 수 있다. 이를 통해 continue와 break를 어디에 적용할지 정할 수 있다.
 */

OUTER: for i in 0...3 { // 각 for문 앞에 이름과 콜론을 붙이면 된다.
    print("OUTER: \(i)")
    INNER: for j in 0...3 {
        if i <= j {
            print("    INNER: \(j)")
            continue OUTER // continue나 break를 어떤 반복문에 적용할지 정할 수 있다.
            //break OUTER
        }
    }
}
// 그렇게 자주 쓰이진 않는다.
