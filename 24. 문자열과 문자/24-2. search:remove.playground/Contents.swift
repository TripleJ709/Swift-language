import UIKit

/*
 1. 특정 문자 제거
 - 간단하게 앞뒤의 특정 문자를 제거하는 메서드
     "A".trimmingCharacters(in: <#T##CharacterSet#>)
 - 문자열 중간에 특정 문자를 제거하는 방법
     "A".components(separatedBy: <#T##CharacterSet#>).joined()
 */

var userEmail = " my-email@example.com "

var trimmedString = userEmail.trimmingCharacters(in: [" "])
print(trimmedString)

trimmedString = userEmail.trimmingCharacters(in: .whitespaces)
print(trimmedString)

var someString = "?Swift!"
var removedString = someString.trimmingCharacters(in: ["?","!"])
print(removedString)

someString = "?Swi!ft!"
removedString = someString.trimmingCharacters(in: ["?","!"])
print(removedString)

var name = " S t e v e "
var removedName = name.components(separatedBy: " ").joined()
print(removedName)

var phoneNum = "010-1234-1234"
var newPhoneNum = phoneNum.components(separatedBy: "-").joined()
print(newPhoneNum)

var numString =  "1+2-3*4/5"
var removedNumString =  numString.components(separatedBy: ["+","-","*","/"]).joined()
print(removedNumString)

var str =  "Hello Swift"
var arr = str.split(separator: " ")
print(arr)
print(arr.joined())

str.split(separator: " ")

str.split { $0 == " " }


// 특정 문자열 검색에도 활용 가능
name = "hello+world"

if let range = name.rangeOfCharacter(from: .symbols) {
    print(name[range])
}

