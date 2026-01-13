import UIKit

/*
 1. keyPath
 예제와 같이 클래스의 속성에 있는 클래스 또 그 안의 클래스에 접근하는 이런 방식을 좀 더 간편하게 하고 싶을 때 사용한다.
 키패스의 타입은 총 5개며 굳이 외울 필요는 없다. 이정도가 있는지 정도만 한번 보고 넘어가자.
 keyPath 타입 (외울 필요 없음)
 - AnyKeyPath                             : 어떤 속성인지 특정되지 않음(보통, 함수 파라미터형식으로만 사용)
 - PartialKeyPath<Root>                   : 타입에 대한 키패스(예를 들어 배열 같은 것으로 묶을때 사용)
 - KeyPath<Root, Value>                   : 타입과 (읽기)속성에 대한 키패스(구조체)
 - WritableKeyPath<Root, Value>           : 타입과 읽기/쓰기 가능한 속성에 대한 키패스(구조체)
 - ReferenceWritableKeyPath<Root, Value>  : 클래스의 타입과 읽기/쓰기 가능한 속성에 대한 키패스
 또한 키패스의 결론은 정말 짧으니 기억하고 넘어가도 좋다. (48, 49번째 줄이 사용하는 방법 및 결론이다.)
 물론 예전 코드를 볼 일이 생기면 좀 다른 형태로 생겼을 것인데 forKey, keyPath와 같은 키워드가 있을 것이다. 이걸 보고 대략 키패스를 사용했다라고 알고 넘어가면 된다.(현재는 이 방식으로 직접 구현할 일 없음)
 */

class School {
    var name: String
    var affiliate: SmallSchool
    
    init(name: String, affiliate: SmallSchool) {
        self.name = name
        self.affiliate = affiliate
    }
}


class SmallSchool {
    var classMember: Person
    init(classMember: Person) {
        self.classMember = classMember
    }
}


class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let person1 = Person(name: "홍길동")
let smallSchool1 = SmallSchool(classMember: person1)
let school1 = School(name: "슈퍼고", affiliate: smallSchool1)

let gildogsName = school1.affiliate.classMember.name

let namePath = \School.affiliate.classMember.name   // 미리 경로를 지정해둔다.
school1[keyPath: namePath]  // 딕셔너리 방식으로 접근하면 된다.




/*
 2. seletor
 keyPath는 속성을 가르키고 selctor는 메서드를 가르킨다고 보면 된다. selector는 objective-c에서 온 문법이므로 가르키는 메서드는 반드시 @objc키워드를 사용해야한다.
 이 키워드는 실제 앱을 만들 때 UIKit을 사용하면 정말 빈번하게 사용된다. 굳이 깊게 이해할 필요까진 없겠지만 함수를 가르킨다 정도는 알고 있는 것이 좋다.
 */

class Dog {
    var num = 1.0
    
    @objc var doubleNum: Double {
        get {
            return num * 2.0
        }
        set {
            num = newValue / 2.0
        }
    }
    
    @objc func run() {
        print("강아지가 달립니다.")
    }
}

// 계산 속성일 경우
let eyesSelector = #selector(getter: Dog.doubleNum)    // 계산(읽기) 속성
let nameSelector = #selector(setter: Dog.doubleNum)    // 계산(쓰기) 속성


// 메서드일 경우
let runSelector = #selector(Dog.run)


// 실제 앱에서 사용
class ViewController: UIViewController {
    
    lazy var myButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("MyButton", for: .normal)
        button.frame = CGRect(x: 0.0, y: self.view.frame.height - 150, width: view.frame.width, height: 50.0)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myButton)
        myButton.addTarget(self, action: #selector(ViewController.doSomething(_:)), for: .touchUpInside)
    }
    
    @objc func doSomething(_ sender: Any) {

    }
    
}
