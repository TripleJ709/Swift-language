import UIKit

/*
 1. 클로저의 실제 활용 예시
 */

// 첫번째 예시
// 네트워크를 진행하는 코드로 이런 식으로 애플이 미리 만들어 놨다. 우리는 클로저를 이용해 사용만 하면 된다.
// 물론 아직 배운 코드가 아니기에 클로저가 어떤 형태로 되어 있는지만 보자.
//URLSession(configuration: .default).dataTask(with: <#T##URLRequest#>, completionHandler: <#T##(Data?, URLResponse?, (any Error)?) -> Void#>)


URLSession(configuration: .default).dataTask(with:  URL(string: "http://주소")!) { data, res, error in
    // 데이터 처리 코드
}



// 두번째 예시
// 특정 시간뒤에 어떤 코드를 실행하는 코드 반복하거나 안할 수도 있다.
// 여기 또한 아직 배운 코드는 아니기에 클로저가 어떤 식으로 사용되는지만 보고 넘기자.
Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
    // 실행할 코드
}




/*
 2. 멀티플 트레일링 클로저
 하나의 함수에서 여러가지의 클로저를 받고 있다면 나오는 문법인데
 사실 자동완성이 만들어주기 때문에 굳이 외울 필요는 없다고 본다.
 이런 식으로 사용된다만 생각해보자.
 */

func aFunction(a: () -> (), b: () -> (), c: () -> ()) {
    a()
    b()
    c()
}

// aFunction(a: <#T##() -> ()#>, b: <#T##() -> ()#>, c: <#T##() -> ()#>) // aFunction을 자동완성하면 이렇게 될텐데

//aFunction {        // 거기서 엔터 한번만 치면 이런 형태가 된다. 이정도만 알아두면 충분하다고 본다.
//    <#code#>
//} b: {
//    <#code#>
//} c: {
//    <#code#>
//}



