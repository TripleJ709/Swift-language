import UIKit

/*
 1. 타입으로서의 프로토콜
 프로토콜은 타입으로 사용할 수 있다.
 */

protocol Remote {
    func turnOn()
    func turnOff()
}

class TV: Remote {
    func turnOn() {
        print("TV켜기")
    }
    
    func turnOff() {
        print("TV끄기")
    }
}

class SetopBox: Remote {
    func turnOn() {
        print("셋톱박스 켜기")
    }
    
    func turnOff() {
        print("셋톱박스 끄기")
    }
}

var tv1 = TV()
var stBox1 = SetopBox()

tv1 is Remote
stBox1 is Remote




/*
 2. 프로토콜 타입 취급의 사용법
 아래 예제와 같은 방식으로 사용할 수 있고 경우에 따라 업캐스팅, 다운캐스팅이 가능하다.
 이렇게 사용하면 하나의 프로토콜 타입으로 다형성을 구현할 수 있다.
 */

var remotes: [Remote] = [tv1, stBox1]

for remote in remotes {
    remote.turnOn()
}



func doSomething(remote: Remote) {
    print(remote.turnOff())
}

doSomething(remote: tv1)
doSomething(remote: stBox1)
