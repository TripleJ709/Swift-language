import UIKit

/*
 1. 동기 비동기, 직렬 동시의 예시
 */

func Task1() {
    print("Task1 시작")
    sleep(3)            // sleep은 몇초동안 작업을 중지하는데 쓰이는 코드이다. 여기선 3초동안 작업을 중지했다가 다시 시작한다.
    print("Task1 종료")
}

func Task2() {
    print("Task2 시작")
    sleep(3)
    print("Task2 종료")
}

func Task3() {
    print("Task3 시작")
    sleep(3)
    print("Task3 종료")
}

func Task4() {
    print("Task4 시작")
    sleep(3)
    print("Task4 종료")
}

func Task5() {
    print("Task5 시작")
    sleep(3)
    print("Task5 종료")
}

DispatchQueue.global().async {  // 비동기 코드에 대한 키워드이다. DispatchQueue의 객체가 있고 global이라는 Queue로 보낸다. async는 비동기에 대한 처리로 작업을 Queue에 보내기만 하고 곧바로 메인스레드로 복귀한다. sync라는 키워드도 있는데 이게 동기에 대한 키워드다. 알고만 있고 넘어가자
    Task1()
}

DispatchQueue.global().async {  // 실행을 해보면 Task1, 2, 3, 4, 5가 차례대로 시작한 뒤 3초 후에 종료가 되는 것을 볼 수 있다. 종료되는 순서는 바뀔 수도 있다.
    Task2()
}

DispatchQueue.global().async {  // 단순히 작업을 다른 스레드로 보낸 뒤 다시 메인스레드에서 해야할 작업을들 진행하는 것이다.
    Task3()
}

DispatchQueue.global().async {
    Task4()
}

DispatchQueue.global().async {
    Task5()
}

//-----------------------------------------

let aThread = DispatchQueue(label: "Serial") // DispatchQueue객체에 원하는 레이블 값을 넣어주면 이 객체로 인해 실행되는 작업들은 모두 같은 스레드로 가서 작업한다. 직렬에 대한 개념이다.
aThread.async {
    Task1()
}

aThread.async {
    Task2()
}

aThread.async {
    Task3()
}

aThread.async {
    Task4()
}

aThread.async {
    Task5()
}
