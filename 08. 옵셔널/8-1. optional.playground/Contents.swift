import UIKit

/*
 1. optional
 기본적으로 어떤 변수에 값이 없을 때 컴파일러는 그걸 읽으려다 에러를 발생하게 된다.
 Swift에서는 값이 없음을 의미하는 nil이라는 값이 있고 nil은 실제 값이 없다는 것이 아니라 값이 없다는 걸 의미한다. 이 차이를 알아두자.
 또한 옵셔널 타입은 기존 타입에 +nil이 된 것이다.
 예를 들어, 옵셔널 정수 타입은 기존 정수 타입인 ..., -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, ... 의 정수 타입에서 nil이라는 값이 추가된 것
 따라서 Int타입보다 옵셔널 Int타입이 더 큰 범위라고 볼 수 있다.
 
 옵셔널 타입은 해당 변수가 값이 있을 수도 있고 없을 수도 있다는걸 알려주기 위함으로 기존 타입 겉에 하나의 박스에 담겨 있다고 볼 수 있다.
    ________
   |  Int값  |   <- 처럼 박스에 담겨 있기 때문에 그대로 쓰게 되면 활용할 수 없다. 그래서 박스를 한 번 벗기는 과정이 필요하다.
    --------
 */

var num: Int
//print(num) // num에는 아직 값이 없는데 접근하려 하는 순간 에러가 나며 앱이 꺼지게 된다.

var num2: Int? // 이렇게 타입 뒤에 ?만 쓰면 옵셔널타입이 된다. 그리고 기본적으로 처음 값을 넣지 않으면 nil로 할당이 됨
var num3: Optional<Int> // 이게 정식 문법이고 Int?는 단축문법이지만 단축문법을 더 많이 사용함

num2

var num4: Int? = 10
print(num4) // 이렇게 출력하면 Optional(10)이라는 결과가 나오게 되는데 이 Optional()이 박스라고 생각하면 된다. 이 박스를 벗기는 과정이 필요하다.




/*
 2. 옵셔널값의 추출
 박스를 벗기는 과정은 총 5개가 있다.
    1. 강제 언래핑
    2. nil인지 판단 후 강제언래핑
    3. 옵셔널 바인딩
    4. 닐 코얼래싱
    5. 옵셔널 체이닝
 여기서 5번은 나중에 배우도록 하고 1-4번을 먼저 알아보자
 */

// 1. 강제 언래핑
var a: String? = "Hello"
print(a)
print(a!)       // 이렇게 옵셔널 타입 뒤에 !를 붙이면 강제로 박스를 벗긴다. 대신 nil이 들어 있다면 에러가 나기 때문에 정말 확실할 때 사용하거나 아예 사용을 안하는 것이 좋다.
a = nil
//print(a!)       // a에는 nil이 들어 있으므로 여기서 강제 언래핑을 사용하면 에러


// 2. nil인지 판단 후 강제언래핑
var b: String? = "Triple"
if b != nil {       //만약 b가 nil이 아닐 경우만 해당 블럭을 실행하기 때문에 에러가 날 일이 없다.
    print(b!)
}


// 3. 옵셔널 바인딩 - 가장 많이 사용하는 방법이고 자주 사용하게 될 것이기 때문에 자연스럽게 알게 될 것이다.
var c: Double? = 3.14
var d: Double? = 2.71828

if let c = c {      // if 뒤에 let c = c로 옵셔널 Double타입인 c를 상수에 넣어준다. 이때 c의 값이 nil이라면 들어가지 않고 if가 실행되지 않는다.
    print(c)
}

func doSomething(d: Double?) { // guard문은 early exit이 필요하기 때문에 함수를 사용함
    guard let d = d else { return } // guard 뒤에 let d = d로 옵셔널 Double타입인 d를 상수에 넣는다. 이때 d의 값이 nil이라면 else문을 실행해 함수를 종료한다.
    print(d)
}

doSomething(d: d)

// 요즘 가능한 문법
// if와 guard 모두 let a = a 꼴로 쓰는 경우가 많은데 옵셔널 바인딩을 한 모든 변수가 c = c, d = d처럼 같은 이름의 변수에 할당하고 있다.
// 이럴 땐 let a만 써도 알아서 바인딩 해준다. 아래 예시를 보자

var e: Int? = 10
var f: Int? = 20

if let e {
    print(e)
}

func doSomething(f: Int?) {
    guard let f else { return }
    print(f)
}

doSomething(f: f)

if var a {  // if let이 아닌 if var, guard var도 사용이 가능하지만 굳이 사용하지 않는다 실제로 그렇게 필요하진 않다.
    print(a)
}



// 4. 닐 코얼래싱 - nil일 경우 기본값을 정해둬 에러가 나지 않도록 한다.
var userName: String? = "triple"
print(userName ?? "Guest User") // 이렇게 옵셔널 타입 뒤에 ?? 연산자를 사용하고 그 뒤 기본 값을 제시하면 된다.



/*
 3. 파라미터에서 옵셔널타입
 애플에서 미리 만들어둔 함수들을 보면 옵셔널 타입의 파라미터를 받을 때 기본 값으로 nil을 설정해둔 함수가 많다.
 굳이 아무것도 없는 nil을 계속 아규먼트로 쓰게 하는 것 보단 기본값으로 nil을 주고 안쓰도록 하는 것이 편하다.
 */

func doSomething2(a: Int, b: Int?) {
    guard let b else {
        print(a)
        return
    }
    print(a, b)
}

doSomething2(a: 10, b: nil) // 이렇게 b의 값이 nil일 때도 항상 넣어줘야하는 귀찮음이 있다.

func doSomething3(a: Int, b: Int? = nil) {
    guard let b else {
        print(a)
        return
    }
    print(a, b)
}

doSomething3(a: 10) // 따라서 이렇게 하게 되면 b의 값을 굳이 안넣어줘도 되는 편함과 애플이 이렇게 만들어둔 함수가 많으니 미리 알아두자




/*
 4. guard let 기타 내용
 guard에서 선언한 변수는 그 이후에도 사용이 가능하다.
 */

func doPrint(a: String?) {
    guard let printString = a else { return }
    print(printString)      // guard에서 선언한 printString을 여기서도 사용할 수 있다.
}

