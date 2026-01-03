import UIKit

/*
 1. 클로저의 문법 최적화
 앞 파일에서 언급한것처럼 클로저는 어느정도 간편하게 사용하기 위함도 있다. 따라서 문법 축약이 가능한 경우가 몇개 있다.
 */

func closureFunction(a: String, closure: (String) -> Int) {  // 이렇게 정의된 함수를 갖고 클로저를 통해 함수를 실행시켜보자.
    closure(a)
}


closureFunction(a: "Hello, Swift", closure: { (str: String) in  // 모든 문법을 원칙적으로 지켜가며 사용하려면 이렇게 해야한다.
    return str.count
})


// 파라미터 타입과 return키워드는 뺄 수 있다. 컴파일러가 다 타입을 추론해 어떤 타입인지 알고 있다.
closureFunction(a: "Hello, Swift", closure: { str in
    str.count
})


// 아규먼트 이름을 규칙을 통해 사용할 수 있다. $ + 숫자로 나타내며 첫번째 아규먼트는 $0, 두번째 아규먼트는 $1, 세번째 아규먼트는 $2 등 사용할 수 있다.
closureFunction(a: "Hello, Swift", closure: {
    $0.count
})


// 트레일링 클로저 - 후행 클로저 문법이라고 부르며 함수를 호출할때 더 간편한 방법이다.
closureFunction(a: "Hello, Swift") { $0.count }     // 이렇게 괄호의 위치가 바뀌게 되는데 헷갈려할 필요 없이 자동완성이 알아서 이렇게 만들어준다. 첫번째 모든 문법을 원칙적으로 지키며 호출한 함수와 여기서의 함수를 비교해보면 확실하게 짧아진 것을 볼 수 있다.
                                                    // 예시 코드 자체가 그렇게 길지 않아 체감되지 않을 수 있지만, 코드가 길어질수록 편리해진다.
