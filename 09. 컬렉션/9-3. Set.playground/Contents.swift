import UIKit

/*
 1. Set
 Set은 집합이라고도 불리며 수학적인 집합으로 생각할 수 있다.
 중복은 안되며 순서 또한 존재하지 않는다.
 딕셔너리와 마찬가지로 hash함수로 값을 유니크하게 판단한다.
 집합은 많이 사용하지 않기 때문에 전체적으로 이런 바구니도 있다라고 생각하고 있으면 될 것 같다.
 */

var a: Set = [1, 1, 2, 3, 3, 4, 5] // 배열과 선언은 같지만 같기 때문에 Set이라고 타입 명시를 해야한다.
print(a) //  또한 값이 중복되더라도 하나만 나온다.
var b: Set<Int> = [1, 2, 3, 4, 5] // 정식 선언 문법이지만 위 방법을 더 많이 사용한다.




/*
 2. Set 다루기
 */

b.count
b.isEmpty // 배열과 같이 데이터 갯수나 비어있는지 확인할 수 있다.

b.update(with: 10) // 기존 집합에 10이 있는지 확인하고 없다면 10을 추가한다.
b.update(with: 5)
print(b.insert(20)) // 집합에 20이 있는지 확인후 있으면 false, 없으면 true와 들어간 값을 반환한다.
print(b.insert(10)) // 기존에 10이 있었기 때문에 false가 나오며 false와 10을 반환한다.
b.contains(1) // 집합에 1이 있는지 확인한다 true, false로 반환함

b.remove(1) // 집합에서 특정 데이터를 지울 때 사용한다.
b.remove(0)
print(b)



/*
 3. 집합에서의 Set
 집합은 수학에서의 집합수식도 사용 가능하다.
 물론 이것 또한 다 외울 필요 없다 너무 많기도 하고 만약 필요해질 때가 온다면 검색하면 자세하게 나온다.
 다 외우는 것보단 검색해서 쓰는 것이 효율적
 단순히 Set에는 수학에서의 집합 개념이 있구나 정도만 생각해두자
 */

var set1: Set = [1,2,3,4,5,6,7,8,9,10]
var set2: Set = [1,3,5,7,9]
var set3: Set = [2,4,6,8,10]

set1.isSubset(of: set2) // 부분집합의 여부를 확인한다. set1이 더 큰 범위이기에 false
set2.isSubset(of: set1) // set2가 더 작은 범위이기에 true

set1.isStrictSubset(of: set2) // 진부분집합의 여부

set1.isSuperset(of: set2) // 상위 집합의 여부
set2.isSuperset(of: set1)

set2.isDisjoint(with: set3) // 서로소 여부

set2.union(set3) // 합집합
set1.intersection(set2) // 교집합
set1.subtracting(set2) // 차집합
set1.symmetricDifference(set2) // 대칭차집합
