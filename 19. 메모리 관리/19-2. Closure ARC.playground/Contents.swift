import UIKit

/*
 1. 클로저의 캡처리스트(값타입)
 클로저에서도 메모리 누수가 나올 수 있다. 우선 전에 배운 캡처에 대해 명확히 알고 시작하면 그나마 쉽게 보일 것이다.
 우선 클로저에선 캡처리스트라는 것이 있다. []로 쓰이며 파라미터를 선언할 때 사용된다. 명시적으로 캡처를 하겠다고 선언하는 것이다.
 */

var num = 0
let closure1 = {
    print("closure1: \(num)")
}
closure1()
num = 10
closure1()          // 여기까지의 결과는 당연하게 받아들일 수 있을 것이다.

num = 0
let closure2 = { [num] in
    print("closure2: \(num)")
}
closure2()
num = 10
closure2()          // 여기서 결과를 보면 num을 10으로 바꿨음에도 불구하고 결과는 0이다. 이게 캡쳐리스트인데, 클로저를 선언할 때 외부 변수의 값을 캡쳐해서 들고 있겠다는 뜻이다.
                    // 물론 값타입이기 때문에 캡처해서 값을 그대로 갖고 있을 뿐 메모리 누수나 강한 참조등에는 크게 신경쓰지 않아도 된다.




/*
 2. 참조 타입 캡처와 캡처리스트
 참조 타입일 때 문제가 생기는데 예시를 보면서 이해해보자.
 */

class Point {
    var point = 0
}

var x = Point()
var y = Point()

x.point
y.point

let pointPrint = { [x] in
    print("x,y 각각 값: \(x.point), \(y.point)")
}

pointPrint()
x.point = 1
y.point = 1
pointPrint()        // 값 자체는 둘 다 0, 0과 1, 1이 나오면서 같은 동작을 하는 것처럼 보인다. 자세히 보면 다른 점이 있다.
// 우선 y의 경우 캡처리스트를 사용하지 않았다. y는 직접적으로 인스턴스를 가르키고 있는데 클로저 내부에서 사용하는 y에 대해서는 클로저에서 스택프레임에 있는 y를 찾아가고 y에 할당되어 있는 인스턴스 주소를 찾아가게 된다.
// x경우는 조금 다른데 캡처리스트를 사용했기 때문에 클로저에 x인스턴스 주소값 자체가 들어가 있다. 즉, x인스턴스는 클로저에서 하나, 스택프레임에서 하나 이렇게 총 2의 RC가 증가하였다.
// 물론 지금은 강한 참조가 일어나고 있지 않지만 이런 경우에 의해 순환참조가 될 수 있어 메모리 누수가 발생할 수 있다.




/*
 3. 클로저에서의 weak, unknown
 클로저에서 이런 캡처리스트를 사용할 때 weak, unknown키워드를 사용하게 된다.
 */

class A {
    var name = "triple"
    
    func doSomething() {
        var doSomething2 = { //[self] in                // 클래스 내부의 클로저에서 속성을 사용할 땐 반드시 self를 사용해야한다. 없으면 에러다. 아니면 파라미터 부분에 [self]를 사용할 수도 있다.
            print("제 이름은 \(self.name)입니다.")
        }
    }
}

class Person {
    var name = "triple"
    
    func myName() {
        DispatchQueue.global().async {          // 이 코드는 비동기를 위한 코드인데 간단하게 지금까진 cpu가 하나라고 가정하고 문법을 배웠다. 하지만 일반적인 기기는 cpu가 여러개가 있고 이건 그 여러개의 cpu를 쓰겠다는 의미이다.
            print("제 이름은 \(self.name)입니다.")  // 잘 모르겠다면 곧 비동기를 배울텐데 배우고 나서 다시 돌아와 보는것도 괜찮다.
        }
    }
    
    func myName1() {
        DispatchQueue.global().async { [weak self] in   // 위와 이 코드의 차이는 weak self이다. 힙 영역에서 클로저는 인스턴스 외부에 생긴다. 또한 self는 클래스 인스턴스를 강하게 가르키기 때문에 강한 참조가 나올 수 있는데
            print("제 이름은 \(self?.name)입니다.")         // weak를 통해 약하게 가르키는 것이다. 물론 여기선 두 함수 모두 동일하게 동작하지만 RC의 갯수가 다를 것이다.
        }
    }
}
