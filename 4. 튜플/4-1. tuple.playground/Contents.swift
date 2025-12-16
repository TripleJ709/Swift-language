import UIKit

/*
 1. 튜플
 연관되는 특징들을 나열할 때 사용하며 한번 선언하고 나면 튜플의 크기나 내부 타입을 변경할 수 없다.
 */

var point = (100, 200) // point의 변수 타입을 확인해보면 (Int, Int)타입으로 되어 있다. 이것이 튜플이며 타입의 변경은 불가능하다.(내부 값은 변경 가능)




/*
 2. 튜플의 접근과 변경
 */

print(point.0) // 튜플의 첫번째 값인 100에 접근하려면 0, 두번째 값에 접근하려면 1, 만약 세번째 값이 있다면 2 이런 식으로 0부터 하나씩 늘어나게 된다.
print(point.1) // 뒤에 배울 배열에서 가장 중요한 내용 중 하나(0부터 시작하는 것)
point = (300, 400) // 가능
print(point.0)
print(point.1)
//point = ("300", 500) //불가능 - String타입으로 변경하려 하기 때문





/*
 3. 네임드 튜플(Named Tuple), 튜플의 분해
 0, 1, 2처럼 접근하기 헷갈린다면 튜플 인자에 이름을 정해줄 수도 있다.
 또한 1번과 같이 튜플을 선언 안하고 튜플로 여러 변수에 값을 지정하는 방법도 있다. 아래 예시를 보면 이해가 빠르다.
 */

// 네임드 튜플 - 튜플 인자에 이름 정해주기
var person: (name: String, age: Int, adrress: String) = ("Triple", 20, "성남시")
print(person.name) // 이런식으로 인자에 특정 이름으로 접근할 수 있다.
print(person.age)
print(person.adrress)

// 튜플의 분해
var (x, y, z) = (100, 200, 300) // 튜플로 여러 변수에 값을 할당할 수 있다.
print(x)
print(y)
print(z)




/*
 4. 튜플의 활용
 switch문에서의 튜플 활용
 */

var exPoint = (0, 5)

switch exPoint {
case (let x, 0) where x != 0:
    print("exPoint는 원점이 아닌 x축 위에 있습니다.")
case (0, let y) where y != 0:
    print("exPoint는 원점이 아닌 y축 위에 있습니다.")
default:
    print("exPoint는 어떠한 축 위에도 있지 않습니다.")
}
