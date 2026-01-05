import UIKit

/*
 1. 메모리 누수의 사례
 */

class Dog {
    var name = "Leo"
    var run: (() -> ())?
    
    func saveClosure() {
        run = {
            print("\(self.name)이 뛴다.")
        }
    }
    
    deinit {
        print("\(self.name)이 메모리에서 해제됨")
    }
}

func doSomething() {
    var leo = Dog()
    leo.saveClosure()
}

doSomething()

/*
 위 코드를 천천히 생각해보자.
 Dog클래스 속성에는 run이라는 함수타입의 속성이 있고 saveClosure함수를 실행하면 클로저를 통해 run속성에 할당한다.
 doSomething함수를 실행하면 우선 Dog타입의 인스턴스가 힙에 생길 것이다. 여기서 인스턴스는 RC가 1올라가게 된다.
 그 뒤 leo.saveClosure()가 실행되는데 그렇게 되면 run클로저는 인스턴스와 무관하게 다른 힙영역에 생길 것이다.
 그렇다면 인스턴스는 run이 어떻게 실행될지 알아야 하기 때문에 run클로저를 가르키고 있을 것이다. 현재까지 인스턴스의 RC == 1, 클로저의 RC == 1이다.
 여기서 run 또한 self를 사용하고 있기 때문에 인스턴스를 가르켜야 한다. 그러므로 인스턴스의 RC는 2가 되는데
 이제 문제는 함수가 종료가 된다. 함수가 종료되면 인스턴스를 가르키던 leo가 없어지기 때문에 인스턴스의 RC는 1이 되는데 클로저와 인스턴스가 서로 가르키고 있다.
 이러면 함수가 스택영역에서 사라졌기 때문에 더이상 접근할 방법이 없고, 서로 가르키고 있는 강한 순환참조가 일어나 메모리 누수가 일어난다.
 */

