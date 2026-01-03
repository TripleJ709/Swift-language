import UIKit

/*
 1. 중첩타입
 타입 내부에 타입을 만드는건 언제나 가능하다.
 전에 잠깐 언급한 적이 있는데 단순히 타입 내부에 타입을 만든다고 생각하면 된다.
 */

class Aclass {          // 여기 예제처럼 단순히 내부에 타입을 더 만든다고 볼 수 있다.
    struct Bstruct {
        var name: Cenum
        
        enum Cenum {
            case a
            case b
            
            struct Dstruct {
                
            }
        }
    }
}

// 아래와같이 타입 내부의 타입이므로 타입과 인스턴스 생성에 주의하면서 사용하면 된다.
let aClass: Aclass = Aclass()
let bStruct: Aclass.Bstruct = Aclass.Bstruct(name: .a)
let cEnum: Aclass.Bstruct.Cenum = .b
let dStruct: Aclass.Bstruct.Cenum.Dstruct = Aclass.Bstruct.Cenum.Dstruct()




/*
 2. 왜 사용할까?
 특정 타입 내부에서만 사용할 수 있게 하기 위함 - 위 예시를 볼 때 Bstruct는 Aclass 안에서만 동작이 가능한데 이렇게 하면 범위를 한정지을 수 있다.
 또한 타입 간의 연관성을 명확하게 하고 내부 구조를 디테일하게 설계가 가능함.
 */




/*
 3. 애플 공식문서 예제
 중첩타입을 더 이해하면서 지금까지 배운 타입들을 더 이해하기 좋을 것 같아 보인다.
 아래 예제를 보면 코드가 좀 길어보여 복잡해 보일 수 있으나, 천천히 하나의 타입씩 보면 어렵지 않게 이해할 수 있다.
 */

struct BlackjackCard {

    enum Suit: Character {      // 구조체 안에 열거형 타입을 선언함. 각 문양을 나타냄
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"  // 각 case를 콤마로 나열하며 한 줄로 표현이 가능하다.
    }

    enum Rank: Int {            // 각 카드의 숫자를 나타내는 것으로 보인다. 문양과 숫자를 나눠 다양한 조합을 볼 수 있다.
        case two = 2, three, four, five, six, seven, eight, nine, ten  // 원시값을 사용해 2~10의 숫자를 나타낸다.
        case jack, queen, king, ace
        
        struct Values {         // 이 구조체와 아래 values 계산속성은 ace케이스를 위함으로 보인다. 블랙잭카드에서는 ace를 1과 11로 쓸 수 있는 것 같다. 그래서 첫번째 숫자와 두번째 숫자를 나눈 모습이다.
            let first: Int, second: Int?
        }
        
        var values: Values {    // 읽기전용 계산속성이다. switch문으로 만들었으며 여기서 self는 Rank인스턴스를 의미한다.(현재 계산 속성의 본체는 Rank타입이기 때문)
            switch self {
            case Rank.ace:
                return Values(first: 1, second: 11)     // return값으로 Values인스턴스를 내보낸다. ace일 경우 1과 11로 쓰일 수 있어 보인다.
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)   // 잭, 퀸, 킹일 경우 10이라는 숫자로 판단되는 것 같다. 그래서 두번째 숫자는 nil이 된다.
            default:
                return Values(first: self.rawValue, second: nil)  // 나머지 숫자카드의 경우 현재 인스턴스의 원시값(2~10)을 반환한다. 마찬가지로 두번째 숫자는 없기 때문에 second는 nil을 넣어준다.
            }
        }
    }
    
    let rank: Rank, suit: Suit      // 저장 속성이다. 문양과 숫자를 넣을 수 있어보인다. 구조체이기 때문에 멤버와이즈 생성자가 제공되어 생성자를 생략했다.
    
    var description: String {       // 계산 속성이다. 읽기전용으로 return값만 내보내며 각 문양과 어떤 숫자를 생성했는지 알려준다.
        get {
            var output = "\(suit.rawValue) 세트,"
            output += " 숫자 \(rank.values.first)"
            
            if let second = rank.values.second {    // ace일 경우 second값이 생성되는데 이 경우에 두번째 숫자까지 고려해야하기 때문에 추가한 로직이다. 나머지 카드의 경우는 nil이기 때문에 실행되지 않음.
                output += " 또는 \(second)"
            }
            
            return output
        }
    }
}

let aCard = BlackjackCard(rank: .ace, suit: .diamonds)
let bCard = BlackjackCard(rank: .four, suit: .hearts)
print(aCard.description)
print(bCard.description)
