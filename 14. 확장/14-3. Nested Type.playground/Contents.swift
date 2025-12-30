import UIKit

/*
 1. 중첩타입
 클래스 안에 클래스, 클래스 안에 구조체, 구조체 안에 열거형등 타입을 중첩해서 사용할 수 있다.
 */

class A {
    struct B {
        var x: Int
        var y: Int
        
        func doSomething() {
            print(x, y, "좌표입니다.")
        }
    }
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var a = A(name: "triple")
a.name
var ab = A.B(x: 10, y: 15)
ab.doSomething()
var aab = A(name: "Leo")
