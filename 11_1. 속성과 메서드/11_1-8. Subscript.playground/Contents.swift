import UIKit

/*
 1. 서브스크립트
 배열에서 사용했던 []문법을 서브스크립트라고 한다.
 클래스에서도 적용이 가능하다.
 */

class A {
    var strArray = ["Swift", "iOS", "triple", "iphone"]
    
    subscript(n: Int) -> String { // subscript키워드로 만든다. 파라미터와 리턴 타입이 있어야 반환할 수 있다.
        get {
            return strArray[n]
        }
        set {
            strArray[n] = newValue // 계산 타입처럼 get, set블럭을 나눌 수 있으며 역시 get만 선언해도 된다. get만 선언할 땐 get도 생략 가능하다.
        }
    }
}

var a = A()
a[1]            // 인스턴스에 접근해서 서브스크립트 문법을 사용할 수 있다.
a[1] = "Android"
a[1]
a.strArray
