import UIKit

/*
 1. defer문
 사실 에러와는 그렇게 연관은 없다.
 defer문은 나중에 실행할 문장을 미리 써놓는 것이며 함수가 종료될 때 호출된다. 단, 반드시 함수 실행중 한번은 호출이 되어야 실행이 된다.
 */

func a() {
    defer {             // defer 키워드를 사용할 수 있으며 함수가 종료되기 전 해당 블럭이 실행된다.
        print("나중에 실행")
    }
    
    print("먼저 실행")
}

a()

func b() {
    if true {
        print("먼저 실행")
        return
    }
    
    defer {             // defer가 실행되기 전 return이 반드시 일어나기 때문에 defer가 한번도 호출되지 못한다. 즉, 이 함수에서 defer문은 절대 실행되지 않는다.
        print("나중에 실행")
    }
}

b()

func c() {          // 먼저 호출된 defer가 가장 마지막에 실행된다.(예시일 뿐 실제론 defer는 하나만 쓰는것이 좋다.)
    defer {
        print("1")
    }
    defer {
        print("2")
    }
    defer {
        print("3")
    }
}

c()
