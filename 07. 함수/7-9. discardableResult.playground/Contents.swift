import UIKit

/*
 1. @(어트리뷰트)의 의미
 - 선언에 추가정보 제공 ex) available(iOS 18.0) iOS 18버전부터 실행할 수 있도록 하는 코드
 - 타입에 추가정보 제공 ex) func doSomething(completion: @escaping () -> ()) { }
 위와 같이 컴파일러에게 추가적인 정보를 제공하는 것
 */




/*
 2. discardableResult
 함수에서도 사용이 가능한 어트리뷰트가 있는데 아래와 같이 사용할 수 있다.
 */

@discardableResult // 이런식으로 함수 위에 선언이 가능하다.
func doSomething() -> String {
    return "Hello"
}

doSomething() // 이 함수 호출은 리턴값이 있기 때문에 컴파일러가 리턴값을 사용할 수 있는데 안하고 있다고 경고를 준다.
              // 하지만 discardableResult를 사용해서 이 경고 문구를 안뜨도록 할 수 있다.




/*
 3. (추가)함수에서 쓸 수 있는 튜플
 사실 함수의 리턴값은 하나의 값만 보낼 수 있다.(정확히는 하나의 타입)
 하지만 튜플은 정보는 여러개지만 값 자체는 하나이기에 여러 정보를 리턴할 수 있다.
 */

func doSomething2() -> (Int, Int, Int) {
    return (0, 1, 2)
}

var (xPoint, yPoint, zPoint) = doSomething2()
print(xPoint)
print(yPoint)
print(zPoint)
