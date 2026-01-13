import UIKit

/*
 1. available키워드
 @으로 사용하는 방법과 #으로 사용하는 방법이 있다.
 이 키워드는 일정 이상의 iOS, macOS 등의 버전을 갖고 있을 때만 동작하게 할 수 있다.
 */

@available(iOS 15.0, *) // 어트리뷰트 방식은 이와 같이 선언 후 사용할 수 있다.
func doSomething() {
    print("여기는 iOS15.0이상의 버전만 확인 가능한 영역입니다.")
}


if #available(iOS 15.0, *) {    // 이와 같이 조건문 등에서도 사용이 가능한데 이럴땐 #키워드를 사용할 수 있다.
    print("iOS 15.0버전 이상입니다.")
} else {
    print("버전이 낮아 사용할 수 없습니다.")
}
