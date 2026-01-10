import UIKit

/*
 1. Calendar 구조체
 Date와 같은 어떤 절대적인 시점을 기준을 연도, 월, 일, 요일과 같은 달력의 요소로 변환해주는 객체다.
 현재 전세계 표준은 양력이며 그레고리력이라고도 한다. 그래서 기본 값은 그레고리력이다.
 */

var calendar = Calendar.current // 현재의 달력(양력)반환
calendar.locale
calendar.timeZone
calendar.identifier     // 이런 속성들이 존재하며 달력의 지역, 시간과 관련된 개념 등이 존재한다. 모든 것을 외우려 하지 말고 나중에 찾아 써보는 습관을 가지자.

calendar.component(.year, from: Date())     // 현재의 시점으로 년도를 반환하는 메서드다.
calendar.component(.day, from: Date())
calendar.component(.hour, from: Date())     // 월, 일, 시간등 반환이 가능하다.
calendar.component(.weekday, from: Date())  // 요일을 반환해주는데 현재는 토요일이다. 일요일부터 1로 시작하기 때문에 정수로 받아들일 수 있어야 한다.

