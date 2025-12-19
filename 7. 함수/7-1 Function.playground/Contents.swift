import UIKit

/*
 1. 함수란?
 예를 들어 수학에서 y=2x+3이라는 함수를 떠올리면 x에 어떤 값을 넣을 때마다 y의 값이 나오고 계속 활용할 수 있다.
 코딩에서의 함수도 이와 비슷한 맥락으로 특정 코드를 실행하는 블럭을 만들고 필요할 때마다 사용하는 문법
 함수는 선언과 호출로 나뉜다.
 */




/*
 2. 함수의 사용법
 */

// 선언 방법
func sayHello() { // func 키워드 뒤에 함수로 쓰고 싶은 이름을 정한 뒤 ()를 쓴다. 그 뒤 중괄호 블럭 안에 실행하고 싶은 코드를 쓴다.
    print("Hello!")
}

// 호출 방법
sayHello() // 함수 이름과 ()를 쓰면 선언한 함수가 실행된다





/*
 3. input이 있는 함수
 */

func doSomething(a: String) { // ()안에 "파라미터 이름": "타입" 으로 사용할 수 있다. 이 파라미터를 함수 내부에서 사용 가능(함수 선언에서 사용되는 변수를 파라미터라 부르고 호출에서 값을 입력할 땐 아규먼트라고 부름
    print(a)                  // 단, 파라미터는 let으로 선언되기 때문에 변경 불가능(변경하기 위해선 var b = a 등으로 우회해야함.
}

doSomething(a: "Hello") // 호출할 때 아규먼트에 리터럴 값을 직접 넣을 수도, 변수명으로 넣을 수도 있다.

var str = "Hello"
doSomething(a: str)




/*
 4. output이 있는 함수
 */

func doSomething2() -> String { // 일반적인 함수 선언에서 "->"를 쓴 뒤 반환하고 싶은 타입을 쓰면 된다.
    return "Hello2"             // 아웃풋이 있는 경우 반드시 return으로 값을 돌려줘야 한다.
}

doSomething2() // 여기를 실행해보면 값이 Hello2라고 나오는데, 함수를 실행하면 리턴된 값을 받기 때문
let str2 = doSomething2() // 즉, 이런식으로 사용하기 위해 아웃풋이 있는 함수를 사용한다.
print(str2)




/*
 5. input과 output이 모두 있는 함수
 */

func doSomething3(a: Int, b: Int) -> Int { // 위 3, 4번을 합쳐 이런식의 함수로 사용할 수 있다.
    let c = a + b                          // 이 함수는 파라미터로 받은 두 정수를 더한 뒤 더한 값을 반환해주는 함수다.
    return c
}

let plusNum = doSomething3(a: 5, b: 10)
print(plusNum)




/*
 6. Void타입의 이해(아웃풋이 없는 경우)
 사실 아웃풋이 없을 때 "-> Void"가 생략됐다고 생각하면 된다.
 Void는 단어 그래도 비었다는 것을 의미해서 값이 없는 것이라고 보면 됨
 */

func voidFunction() {
    print("voidfunction1")
}

func voidFunction2() -> Void {
    print("voidfunction2")
}

voidFunction()
voidFunction2() // 이 두 함수를 option + 마우스로 클릭해보면 알겠지만 같은 타입의 함수인 것을 알 수 있다.(함수 타입에 대해선 7-2에 다시 배우기 때문에 배운 뒤 돌아와서 확인해보면 좋을 것 같다.)
