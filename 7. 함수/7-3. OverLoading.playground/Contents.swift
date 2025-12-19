import UIKit

/*
 1. 함수의 오버로드
 함수에서 동일한 이름으로 파라미터 이름, 갯수, 타입등에 따라 여러개를 사용할 수 있다.
 */

func printFunc(a: Int) {
    print(a)
}

func printFunc(a: String) {
    print(a)
}

func printFunc(a: Double) {
    print(a)
}


printFunc(a: 10)
printFunc(a: 10.1)
printFunc(a: "10") 
