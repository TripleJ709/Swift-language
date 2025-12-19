import UIKit

/*
 1. 아규먼트 레이블
 함수의 파라미터와 아규먼트 이름을 다르게 할 수 있는 방법
 함수 선언에서 쓰이는 이름과 호출 부분에서 쓰이는 이름이 다를 때 편한 경우가 있고,
 와일드카드 패턴(_)으로 사용도 가능해 편해질 때도 있다.
 */

func doSomething(num1 firstNumber: Int, num2 secondNumber: Int) { // 이런식으로 아규먼트로 받을 이름과 파라미터로 사용할 이름을 따로 적을 수 있다.
    let plusNum = firstNumber + secondNumber  // 함수 내부에선 파라미터로 적은 firstNumber, secondNumber을 사용해야 한다.
    print(plusNum)
}

doSomething(num1: 10, num2: 40) // 함수를 호출할 땐 아규먼트 이름으로 적은 num1, num2를 사용해야 한다.

func divisionFunc(_ num1: Double, _ num2: Double) { // 이렇게 와일드카드 패턴을 사용할 수 있다.
    print(num1 / num2) // 함수 내부에선 동일하게 파라미터로 받은 num1, num2를 사용해야 한다.
}

divisionFunc(30, 4) // 함수 이름만 봐도 두 수를 나눈다는 것을 쉽게 유추할 수 있으므로 아규먼트로 넣을 이름을 안써도 된다.




/*
 2. 가변 파라미터
 하나의 파라미터는 하나의 값만 가질 수 있지만 가변 파라미터를 사용하면 여러개의 값을 받을 수 있다.(배열형태로 전달되나 아직 배열을 배우지 않았기 때문에 배열로 받는다만 알고 있자)
 */

func doSomething2(a: Int...) { // 똑같은 인풋을 받은 뒤 "..."을 연결하면 된다. 그럼 a에는 파라미터가 1개가 올 수도 2개가 올 수도 3개, 4개 등등 올 수 있다.
    var total = 0
    
    for i in a {
        total += i
    }
    
    print("평균은 \(Double(total) / Double(a.count))입니다.") // a.count는 배열이 몇개의 원소로 구성됐는지 알려주는 키워드(정확히는 메서드이지만 나중에 배우자)
}

doSomething2(a: 1, 10, 29, 41) // ,로 연결해서 여러개의 아규먼트를 넣으면 된다. 단, 파라미터로 선언된 타입이 Int이기에 정수만 넣어야 함




/*
 3. 파라미터에 기본값 정하기
 만약 값을 받지 않았을 때 기본 값이 있어도 된다라고 생각들 때 아래와 같이 사용하면 된다.
 */

func doSomething3(a: Int, b: Int = 5) { // 여기서 b: Int = 5는 b를 파라미터로 받되, 값을 넣지 않으면 b는 5로 쓰겠다라는 의미다.
    print(a + b)
}

doSomething3(a: 10) // b의 값 자체를 넣지 않아도 함수가 실행이 된다.




/*
 4. 파라미터에 대한 정확한 이해
  - 파라미터는 상수로 선언된다. 파라미터는 함수내부에서 직접 바꿀 수 없다. 새로운 변수로 선언하는 등 우회해야 한다.
  - 함수 내 선언된 변수의 범위 for, if처럼 중괄호 블럭 밖에서는 함수 내부의 변수를 사용할 수 없다.
 */

func doSomething4(a: Int) {
//    a = 10 // 이런식으로 사용하게 되면 "Cannot assign to value: 'a' is a 'let' constant" 라는 에러 문구가 뜨는데 a는 let으로 선언되었으니 변경 불가능하다 라는 의미다.
    var b = a // 변경하고 싶다면 이렇게 바꿀 수 있다.
}

func doSomething5(a: Int...) { // 가변 파라미터에서 사용한 함수와 똑같음
    var total = 0 // 함수 내부에 total이라는 변수를 만들었다.
    
    for i in a {
        total += i
    }
    
    print("평균은 \(Double(total) / Double(a.count))입니다.")
}

//print(total) // 하지만 함수 밖에서는 사용할 수 없다.




/*
 5. 리턴의 사용법
 7-1에서처럼 특정 값을 반환하는 사용이 있을 수 있고
 함수를 조기에 종료하기 위해 사용할 수도 있다.
 */

func doSomething6(a: Int) {
    if a % 2 == 0 {
        print("짝수이므로 함수를 조기종료합니다.")
        return // 여기선 반환하는 값은 없지만 함수를 종료하는 곳
    }
    
    print("홀수이므로 함수를 끝까지 실행했습니다.")
}

doSomething6(a: 2)
doSomething6(a: 3)




/*
 6. 리턴타입이 있는 경우 실행문의 의미
 리턴값을 준다는 것은 함수 호출부분에 그 리턴값을 넣는다는 의미다.
 */

func doSomething7() -> String {
    return "Hello"
}

var str = doSomething7() // doSomething7함수에서 "Hello"라는 값을 받아 str에 할당된다.
print(doSomething7())    // 사실 여긴 print("Hello")와 같은 의미다.




/*
 7. 함수의 중첩사용
 함수 내부에서 함수를 선언할 수 있다. 물론 이 함수의 범위도 중괄호 블럭 안이다.
 */

func chooseStep(isBack: Bool, firstPosition: Int) -> Int {
    func back() -> Int {
        return firstPosition - 1
    }
    func front() -> Int {
        return firstPosition + 1
    }
    
    if isBack {
        return back()
    } else {
        return front()
    }
}

print(chooseStep(isBack: true, firstPosition: 10))



/*
 8. 함수 타입의 표기
 함수는 ()->()으로 타입이 표기 된다.
 인풋이나 아웃풋이 없더라도 ()을 써야한다.
 예를 들어, 인풋이 Int, 아웃풋이 Int라면 (Int) -> Int
 */

func a(a: Int) -> Int {
    return 0
}

a

// 인풋이 여러개일 경우 (Int, Int)등으로 사용
