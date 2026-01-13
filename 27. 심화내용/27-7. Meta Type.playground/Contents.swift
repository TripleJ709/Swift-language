import UIKit

/*
 1. 메타타입
 메타타입은 어떤 타입을 만들게 되면 항상 데이터 영역에 타입이 생긴다.(객체가 생성되면 객체는 힙 영역에 생기며 데이터 타입을 가르키고 있다.)
 메타타입은 이 타입의 타입이다.
 메타라는 뜻이 대상보다 더 위의 위치에서 어떤 것을 확인한다는 그런 의미가 있다. 타입보다 위에서 타입을 확인한다고 이해하면 될 것 같다.
 */

class Dog {
    static let species = "Dog"
    var name: String = ""
    var weight: Double = 0.0
}


       // ⬇︎ 타입
let dog1: Dog = Dog()
               // ⬆︎ 인스턴스

        // ⬇︎ 타입(여기를 메타타입이라고 한다.)
let dog2: Dog.Type = Dog.self
                   // ⬆︎ 타입


// 실제 앱 만들 때 사용하는 API
// 간간히 앱을 만들다 보면 마주칠 때가 있다. 물론 어느정도 규모가 있는 앱을 만들고 싶으면 거의 필수로 나오는 개념들이다.
// tableView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellReuseIdentifier: <#T##String#>) // 여기서 첫번째 파라미터로 메타타입이 필요하다.
// try? decoder.decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: <#T##Data#>)                // 여기서 첫번째 파라미터로 메타타입이 필요하다.
