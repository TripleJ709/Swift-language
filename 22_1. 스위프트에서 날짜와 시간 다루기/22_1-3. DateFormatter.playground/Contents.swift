import UIKit

/*
 1. DateFormatter 클래스
 DateFormatter는 날짜와 시간을 원하는 형식으로 변환해주는 클래스라고 보면 된다. 문자열로 변환한다.
 */

let formatter = DateFormatter()
formatter.dateStyle = .full
formatter.dateStyle = .none
formatter.dateStyle = .short
formatter.dateStyle = .medium
formatter.dateStyle = .long

formatter.timeStyle = .short
formatter.timeStyle = .medium
formatter.timeStyle = .none
formatter.timeStyle = .full
formatter.timeStyle = .long     // 다양한 방식이 있으며 주석을 활용하며 어떻게 나오는지 확인해보자. 이것도 절대 외우는 개념이 아니다.

let someDate = formatter.string(from: Date())   // 이 방식을 사용해서 출력해볼 수 있다.
print(someDate)

// 또한 커스텀 방식으로 사용할 수 있는데 아래와 같이 사용한다.
formatter.dateFormat = "yyyy년 MMMM월 d일 (E)"    // 이렇게 사용할 수 있는데 유니코드라는 약속의 기준으로 쓰이며 구글에 쳐본다면 더 자세하게 알 수 있다.
let someDate2 = formatter.string(from: Date())  // yy, yyyy, MM, MMMM, HH등 문자열 보간법 ("\()")과 같은 문법을 사용하지 않더라도 알아서 변환해준다.
print(someDate2)

// 날짜 다루기에 대해 굉장히 간단하게 알아봤는데 외우는 개념이 아니라 찾아보며 적용하는 느낌으로 사용해야 한다고 생각이 들기 때문에 자세하게 들어가지 않았다.
// 프로젝트를 진행하면서 자신에게 필요한 방법들을 인터넷에서 찾아 사용하는 것을 추천한다.
