import UIKit

/*
 1. switch와의 활용
 거의 모든 경우에서 열거형은 switch와 같이 활용한다고 볼 수 있다.
 각 분기에 따라 실행할 곳을 정할 수 있기 때문
 물론 if문으로도 당연히 사용 가능하다.
 */

enum Week {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

var week = Week.monday

switch week { // 이 경우 모든 케이스를 처리하고 있으므로 default가 없어도 실행된다.
case .monday:
    print("월요일이네요 !")
case .tuesday:
    print("화요일이네요 !")
case .wednesday:
    print("수요일이네요 !")
case .thursday:
    print("목요일이네요 !")
case .friday:
    print("금요일이네요 !")
case .saturday:
    print("토요일이네요 !")
case .sunday:
    print("일요일이네요 !")
}




/*
 2. 옵셔널 열거형
 열거형 또한 타입이기 때문에 옵셔널로 사용이 가능하다.
 앞에서 배운것처럼 옵셔널 또한 열거형이기에 원래는 2번 switch문을 사용해야 하나
 애플에서 미리 만들어둔 문법으로 편하게 빼낼 수 있다.
 */

var week2: Week? = .friday // 앞에서 배운것을 잠깐 다시 보자면 현재 week2에는 .some(.friday)가 들어 있는 것 .some을 먼저 벗겨내고 .friday를 switch로 분기처리 하면 써야한다.

switch week2 { // 이렇게 사용해야 한다. 하지만 애플에서 만들어둔 문법을 사용하면 더 간편하다.
case .some(let value):
    switch value {
    case .friday:
        print("금요일이다 !")
    default:
        print("오늘은 금요일이 아니네요..")
    }
case .none:
    print("옵셔널 값")
}

switch week2 { // 여기 사용한 문법이 애플에서 더 편하게 쓸 수 있도록 제공하는 것이다. 열거형은 switch와 호환이 아주 좋기 때문에 잘 사용하면 좋다.
case .monday:
    print("월요일이네요 !")
case .tuesday:
    print("화요일이네요 !")
case .wednesday:
    print("수요일이네요 !")
case .thursday:
    print("목요일이네요 !")
case .friday:
    print("금요일이네요 !")
case .saturday:
    print("토요일이네요 !")
case .sunday:
    print("일요일이네요 !")
case nil:             // 여기선 .none을 써도 되고 nil을 사용해도 된다. nil과 .none은 같은 것이다.
    print("요일이 없네요?")
}




/*
 3. if case, for case문
 만약 하나의 케이스만 보고 싶을때나 모든 케이스를 돌아보며 처리를 하고 싶을 때 사용할 수 있다.
 */

enum Computer {
    case cpu(core: Int, ghz: Double)
    case ram(Int, String)
    case hrd(Int)
}

var com = Computer.cpu(core: 8, ghz: 3.5)

if case Computer.cpu(core: 8, ghz: 3.5) = com { // if case와 조건문을 사용할 수 있다. 오른쪽 com을 왼쪽에 할당한다고 보면 된다. 만약 이를 switch문으로 할 경우 더 긴 코드를 작성해야 하는 불편함이 있다.
    print("제가 찾던 컴퓨터네요 !")
} else {
    print("제가 찾는 컴퓨터가 없어요")
}

var coms: [Computer] = [
    .cpu(core: 4, ghz: 2.5),
    .cpu(core: 6, ghz: 3.0),
    .cpu(core: 4, ghz: 3.5),
    .ram(8, "DDR4"),
    .ram(16, "DDR5"),
    .hrd(512),
    .hrd(1024)
]

for case .cpu in coms { // .cpu인 것들만 골라 실행한다 coms엔 cpu가 3개 들어 있으니 3번 실행
    print("CPU칩")
}

for case .cpu(core: let x, ghz: let y) in coms { // 이렇게 원하는 연관값을 꺼내 쓸 수도 있다.
    print("CPU칩 - (\(x)코어), (\(y)ghz)")
}



/*
 4. @unknown키워드
 개발자의 논리적 오류를 막아주기 위한 키워드다.
 예를 들어, 어떤 앱이 구글, 페이스북, 네이버 로그인이 있다고 생각했을 때 사용자의 요구에 의해 카카오 로그인도 추가 됐다고 생각해보자.
 실제 프로젝트에선 카카오 로그인을 구현했더라도 코드가 매우 복잡하고 길고 파일이 많기 때문에 switch에서 빼먹었을 수도 있다.
 이럴 때 개발자에게 경고를 날리며 모든 케이스를 구현하지 않았다고 말해주는 것이다.
 */

enum Login {
    case google
    case facebook
    case naver
    case kakao
}

var login: Login = .facebook

switch login {  // 사실 이 코드도 문법적인 오류는 없다. 하지만 카카오 로그인의 선택지가 잘못 됐다는 것을 인간의 눈으론 알 수 있다.
case .google:
    print("구글 로그인 선택")
case .facebook:
    print("페이스북 로그인 선택")
case .naver:
    print("네이버 로그인 선택")
default:
    print("에러입니다.")
}


switch login { // 지금 이 줄에서 경고가 뜨는데 모든 케이스를 다 넣지 않았다는 의미이다. 여기서 개발자는 카카오 로그인도 추가해야 한다는 것을 놓치지 않을 수 있다.
case .google:
    print("구글 로그인 선택")
case .facebook:
    print("페이스북 로그인 선택")
case .naver:
    print("네이버 로그인 선택")
@unknown default:
    print("에러입니다.")
}
