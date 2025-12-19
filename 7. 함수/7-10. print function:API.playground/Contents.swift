import UIKit

/*
 1. print함수의 이해
 print도 결국 애플에서 미리 만들어 놓은 함수이다.
 내부에서 어떻게 코드가 실행되는지 정확히 알 수 없지만 print라는 이름을 쓰고 ()을 쓰면 함수가 실행된다.
 조금 더 자세히 알아보면
 print(<#T##items: Any...##Any#>, separator: <#T##String#>, terminator: <#T##String#>)로 이뤄져있다.
 print함수는 items, separator, terminator라는 3개의 파라미터를 갖고 있다(to라는 것도 있긴 하다.)
 items는 가변파라미터로 여러개의 인자를 받을 수 있다. print("a", "b")가 가능
 separator, terminator는 기본 값을 갖는 파라미터이기 때문에 print함수를 쓸 때 신경쓰지 않을 수 있었다.
 */




/*
 2. API의 이해
 API는 Application Programming Interface의 약자로 일종의 약속같은 것이다.
 애플에서 미리 만들어둔 API로는 Int.random같은 것으로 규칙을 지키며 써내려 가면서 코드를 짠다.
 또는 외부(기상청, 국가사이트, 네이버 등)사이트에서 제공하는 API도 있으며 제공하는 곳에서 만든 규칙을 따르면 해당 API를 사용할 수 있다.
 */
