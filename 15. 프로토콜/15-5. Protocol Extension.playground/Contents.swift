import UIKit

/*
 1. 프로토콜의 확장
 프로토콜의 확장은 기본값을 정의한다는 개념을 기본으로 알고 시작하면 좋다.
 위 내용이 확장에 있어 가장 핵심적이지만, 위 내용과 더불어 클래스, 구조체의 메서드 테이블, 프로토콜의 테이블까지 알아보자
 */

protocol Remote {
    func turnOn()
    func turnOff()
}

class TV: Remote {      // 현재 TV, Aircon 두 클래스는 모두 동일한 구현을 하고 있다. 이럴때 확장을 사용하면 굳이 동일하게 하지 않아도 기본 메서드가 제공된다.
    func turnOn() {
        print("전원 켜기")
    }
    
    func turnOff() {
        print("전원 끄기")
    }
}

class Aircon: Remote {
    func turnOn() {
        print("전원 켜기")
    }
    
    func turnOff() {
        print("전원 끄기")
    }
}

protocol Remote2 {
    func turnOn()
    func turnOff()
}

extension Remote2 {
    func turnOn() {
        print("전원 켜기")
    }
    func turnOff() {
        print("전원 끄기")
    }
    
    func doAnother() {
        print("다른 특정 기능") // 프로토콜 본체의 요구사항이 아닌 메서드도 가능하다.
    }
}

class TV2: Remote2 {  // 아무것도 구현하지 않았지만 전원 끄고 키는 메서드가 기본값으로 구현된다.
    
}

/*
 여기서 좀 더 알았으면 하는 내용은 전에 잠깐 언급했었지만 클래스타입은 데이터 영역에 있고 클래스에 정의된 메서드들은 주소값을 갖는 배열로 이뤄진다고 했었다.
 이를 Virtual Table(VT)라고 하며, 이 VT에 주소값 배열을 갖게 된다. [turnOn주소, turnOff주소]처럼 말이다.
 */

class TV3: Remote2 {
    func turnOn() {
        print("TV 전원 켜기")
    }
    func turnOff() {
        print("TV 전원 끄기")
    }
    
    func doAnother() {
        print("TV 특정 기능")
    }
}

var tv3 = TV3() // 이 변수는 현재 TV3타입이다. 그렇다면 이 인스턴스는 힙 영역에 있고 데이터영역에 있는 TV3클래스를 가르키고 있을 것이다.
tv3.turnOn()    //TV 전원 켜기
tv3.turnOff()   //TV 전원 끄기
tv3.doAnother() //TV 특정 기능
                // 그래서 다음과 같은 결과가 나오는데 현재 클래스타입을 가르키고 있기 때문

var tv3_1: Remote2 = TV3() // 그렇다면 이 변수는 현재 Remote2타입이다. 이 인스턴스는 데이터영역의 프로토콜을 가르키는 중이다. 프로토콜에는 기본 정의된 함수들이 있다.
tv3_1.turnOn()    //TV 전원 켜기
tv3_1.turnOff()   //TV 전원 끄기
tv3_1.doAnother() //다른 특정 기능
                  //여기서 봐야할 것은 doAnother()다. 결과가 다르게 나오는데 각각의 인스턴스가 현재 가르키고 있는 타입이 다르기 때문에 나타나는 결과다. 프로토콜의 메서드 주소를 갖는 것은 Witness Table(WT)라고 부른다.
                  //현재 WT에는 [turnOn주소, turnOff주소, doAnother주소]처럼 된다. 그렇기에 tv3_1이 프로토콜을 가르키게 되고 그 프로토콜에서 실행한 결과 확장에서 정의한 메서드를 실행하게 되는 것

print()

struct TV4: Remote2 {
    func turnOn() {
        print("TV 전원 켜기")
    }
    func turnOff() {
        print("TV 전원 끄기")
    }
    
    func doAnother() {
        print("TV 특정 기능")
    }
}

var tv4 = TV4() // 구조체는 값타입이다. 힙 영역에 따로 인스턴스를 찍어내는 것이 아닌 스택 영역에 함수가 있는 동안 생성된다. 그래서 위 클래스처럼 VT를 갖고 있지 않고 직접 메서드를 가르키게 된다.
tv4.turnOn()
tv4.turnOff()
tv4.doAnother()

var tv4_1: Remote2 = TV4()
tv4_1.turnOn()
tv4_1.turnOff()
tv4_1.doAnother()


/*
 2. 프로토콜지향 프로그래밍
 사실 1번에서 배운 내용이 프로토콜지향 프로그래밍으로 프로토콜로 다형성을 구현할 수 있고, 타입으로 사용할 수 있으며 애플에서 프로토콜을 중심으로 코드를 써 내려가길 권장하면서 프로토콜지향 프로그래밍을 선언했다.
 물론 자바와 같은 언어에서도 위 기능 대부분을 사용할 수 있는 것으로 알고 있는데 자바는 기본적으로 클래스 중심의 설계를 권장하기에 Swift와는 사뭇 다른 느낌으로 사용된다.
 */




/*
 3. 프로토콜 확장의 적용 제한
 where절을 사용해 특정 프로토콜의 확장을 제한하는 것도 가능하다.
 */

protocol A {
    func x()
    func y()
}

extension A where Self: B {  // 이렇게 사용하게 되는데 이는 A프로토콜의 확장이 B를 채택해야지만 보이게 된다는 것을 의미한다. 아래 클래스를 보고 이해하면 될 것 같다.
    func x() {
        print("x와 관련된 어떤 일을 합니다.")
    }
    
    func y() {
        print("y와 관련된 어떤 일을 합니다.")
    }
}

protocol B {
    func z()
}

class AClass: A {   // 분명 A프로토콜은 확장으로 기본값을 만들었는데 에러문구로 만들지 않았다며 에러가 나온다.
    func x() {
        print("x와 관련된 어떤 일을 합니다.")
    }
    
    func y() {
        print("y와 관련된 어떤 일을 합니다.")
    }
}

class BClass: A, B {   // 이처럼 A프로토콜의 확장은 어떤 클래스에서 B프로토콜을 채택한 경우에만 보이게 된다. 그래서 이 클래스에선 x, y함수를 구현하지 않아도 됐다.
    func z() {
        print("z와 관련된 어떤 일을 합니다.")
    }
}
