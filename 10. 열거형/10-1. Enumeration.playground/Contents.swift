import UIKit

/*
 1. Enumeration(열거형)
 지금까지 사용했던 타입들은 모두 Swift에서 기본적으로 제공해주는 기본 타입이다.
 열거형 또한 타입이지만 사용자가 직접 만들 수 있는 커스텀 타입이라고 볼 수 있다.
 열거형은 한정된 데이터들을 나타낼 때 사용한다. ex) 동서남북, 가위바위보, 요일 등
 */

enum Week { // enum 키워드를 사용하고 뒤에 앞으로 사용할 타입을 쓴다. 타입이기 때문에 대문자로 시작해야한다.
    case monday // case로 나타내고 싶은 데이터들을 나열한다.
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

var week: Week = Week.friday // 이 줄과 같이 특정 요일을 변수에 저장할 수 있다.
var week2: Week = .friday // 타입을 Week라고 명시해줬기에 .friday만으로도 선언이 가능하다.
var week3 = Week.friday // 당연하게도 타입을 명시해주지 않으면 타입추론을 위해 Week.friday로 사용해야 한다.


/*
 2. 열거형의 원시값
 hashable한 타입은 모두 사용이 가능하나 보통 정수와 문자열 타입만 사용한다.
 원시값은 각 case에 대해 대응하는 값을 지정하는 것이다.
 */

enum Week2: Int { // Week2변수 뒤 : Int를 사용하면 된다. 지금 상황에선 monday엔 0, tuesday엔 1처럼 0부터 1씩 늘어가며 자동으로 배정된다.
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

var week4 = Week2.friday.rawValue // 이런식으로 원시값을 꺼내 사용할 수 있다. week4변수는 Int타입이다.
print(week4)

enum Week3: Int {
    case monday = 10 // 직접 정수를 입력할 수 있다. 이렇게 되면 tuesday는 11처럼 10부터 1씩 늘어난 값이 들어간다.
    case tuesday
    case wednesday
    case thursday
    case friday = 25 // 중간에서도 입력이 가능하며 thursday까진 10부터 1씩 늘어나다가 friday부턴 25에서 1씩 늘어난다.
    case saturday
    case sunday
}

enum Direction: String { // String값으로도 원시값이 가능하다. left와 right는 Swift키워드라 중복되지 않도록 l과 r을 하나씩 더 썼다.
    case lleft // 기본적으로 아무것도 선언하지 않으면 case이름과 동일하게 들어간다.
    case center
    case rright
}

var dir = Direction.center.rawValue // case와 같은 center가 들어감
print(dir)

enum Direction2: String {
    case lleft = "L"
    case center = "C"
    case rright = "R"
}

var dir2 = Direction2.lleft.rawValue // 이런식으로 간편하게 사용할 수 있다.
print(dir2)




/*
 3. 열거형의 연관값
 열거형은 한정된 값을 사용한다 했는데 각 케이스에 변수를 추가해 좀 더 다양하게 사용할 수도 있다.
 단, 원시값과 연관값은 서로 배타적이라 동시에 사용할 수 없다.
 */

enum Computer {
    case cpu(core: Int, ghz: Double) // 이름을 지정해 줄 수도 있고 지정하지 않을 수도 있다.
    case ram(Int, String)
    case hrd(Int)
}

var com = Computer.cpu(core: 4, ghz: 2.5) //이렇게 선언이 가능하다.
var com2 = Computer.ram(16, "DDR4")
var com3 = Computer.hrd(512)
