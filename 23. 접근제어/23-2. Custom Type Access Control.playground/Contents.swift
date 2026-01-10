import UIKit

/*
 1. 커스텀 타입에서 접근 제어
 타입의 접근제어 수준은 해당 타입의 멤버보다 반드시 높아야 한다. 낮게 설정해도 에러는 나지 않지만 자동으로 조정이 된다.
 */

public class SomeClass {    // public으로 명시적으로 선언했다.
    open var str1 = "open"  // 여기서는 모든 멤버가 public이하의 접근 수준을 가져야 한다. open으로 명시하게 되면 에러는 나지 않지만 실제 실행할 때 public으로 인식한다.
    public var str2 = "public"
    internal var str3 = "internal"
    fileprivate var str4 = "fileprivate"
    private var str5 = "private"
}

// 다른 모든 경우도 똑같이 동작하지만, private의 경우는 조금 얘기가 다르다.
// class 자체를 private로 선언하게 된다면 그 코드는 아무런 의미가 없게 된다. class 스코프 밖에서 접근할 수가 없기 때문에 그 어디에서도 클래스 타입을 사용할 수가 없다.
// 그래서 private class로 선언하게 되면 내부적으로 fileprivate로 인식하게 된다.

private class SomeClass2 {  // 내부적으로 알아서 filepriavte로 인식함. 또한 fileprivate보다 높은 수준의 접근 제어를 가진 멤버들은 fileprivate로 인식한다.
    open var str1 = "open"
    public var str2 = "public"
    internal var str3 = "internal"
    fileprivate var str4 = "fileprivate"
    private var str5 = "private"
}

fileprivate var a = SomeClass2()    // private라면 원래는 접근할 수 없어 에러가 나와야 한다.


