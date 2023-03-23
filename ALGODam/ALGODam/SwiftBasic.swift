//
//  SwiftBasic.swift
//  ALGODam
//
//  Created by 김담인 on 2023/03/23.
//

import Foundation

// MARK: - 입력 받기
let value = readLine()
/*
 readLine() 리턴값은 Optional String이다
 
 필요한 데이터에 따라 알아서 가공하기..

 키보드 입력받은 값 공백으로 구분하기

 입력 : 1 2 3 4 일 경우

 첫번째, split()으로 쪼개기
 */
let nums = readLine()!.split(sperator:" ") // ["1", "2", "3", "4"]

// 둘째, component()를 이용하는 방법 - import Foundation 필요
let nums = readLine()!.components(speratedBy: " ") // ["1", "2", "3", "4"]

// MARK: - 배열 다루기
// 1. 빈배열 만들기

var empty: [Int] = []
var empty = [Int]()
var empty: Array<Int> = []

// 2. 임의의 Data 넣어서 만들기
var array = Array(1...5) // [1,2,3,4,5]

// 3. 크기가 정해진 배열
var arr = Array(repeating: 0, count: 3) // [0,0,0]

//4. 2차원 배열 만들기
let matrix = [[Int]]()
// 안쪽 count가 행, 바깥 count가 열
let arr: [[Int]] = Array(repeating: Array(repeating: 1, count: 5), count: 3)

// 배열 거꾸로 출력
array.reversed()

// 배열 정렬하기
array.sorted() // default는 오름차순
array,sorted(by: >) // 내림차순

// 7. 배열 다룰때 가장 중요한 3가지
// *** map ***
var string = ["1", "2", "3", "4"]
string.map { Int($0)! } // [1,2,3,4] -> 각 원소를 Int로 매핑

// *** filter ***
var array = [1, 2, 3, 4]
array.filter { $0 % 2 == 0 } // [2,4] -> 조건에 맞는 수만 뽑아냄

// *** reduce***
var array = [1, 2, 3, 4]
array.reduce(0, +) // 숫자 합이 나타남. 문자열 합치기도 가능

// MARK: - String, Substring, Index

let secondIndex = string.index(after: string.startIndex)
let second = string[secondIndex]

let endIndex = String.index(before: str.endIndex)

// n번째 문자 index 구하는 법
let index = string.index(string.startIndex, offsetBy: n-1)

// subString 구하는법
let sustring = string[start...end]

// 문자 검색해서 index 찾기
"abc123".index(firstOf: "c")

// 특정 character replace
string.replacingOccurrences(of: " ", with: "+" )

// 인덱스 번호로 문자열 char 가져오기
extension String {
    func getChar(at index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

//print 할 때 따옴표('), 쌍따옴표(") 출력하기
print("이렇게 \'써준다")

// 비트연산
/*
 1. NOT : ~value // 00001111->11110000 으로. 0과 1을 바꿔준다
 2. AND : first & second // 두 개 자릿수가 둘 다 1일 때 1 리턴
 3. OR : first | second // 둘 중 하나라도 자릿수가 1이면 1 리턴
 4.XOR : first ^ second // 두 자릿수가 다르면 1, 같으면 0 리턴
 5. Left Shift : value << n // n만큼 왼쪽으로 이동하고 빈자리는 0으로 채운다
 6. Right Shift : value >> n // n만큼 오른쪽으로 이동하고 빈자리는 0으로
 7. 3항 연산자 : 조건문 ? 참 : 거짓 // a < b ? a: b 중첩도 가능
 */

// 앱 종료
exit(0)

// 무한 루프
while true {
//  ...
}

//do while 문
repeat {
//  ...
} while

// swift에는 '++' 연산자가 없다!!(마이너스도)

// string 한 글자와 Character 형 구분 할 때
Character("a") // 타입 명시 해줘야함

// 거듭제곱
pow(밑, 지수) // 밑에는 Decimal 타입이 들어감

// Decimal을 Int로
(decimal as NSDecimalNumber).intValue

// MARK: - 부동 소수점 다루기
// NumberFormatter 이용

let formatter = NumberFormatter()
formatter.roundingMode = .down // 내림
formatter.minimumFractionDigits = 2 // 2자릿수까지만 표현
formatter.maximumFractionDigits = 2
let num = formatter.string(from: NSNumber(value: 2.3243254)) // 2.32

// 타입 범위
Int, Int64 = 2의 8승 - 1 // 19 자리
Int32 = 2의 6승 - 1
Float = 소수점 6자리까지 표현 가능
Double = 소수점 15자리까지 표현 가능

// 진수 표현
// 10진수 -> N진법
String(integer, radix: n)
// N진법 -> 10진수
Int("11100110", radix: n)! // n에 몇 진수에서 바꿀껀지 입력

// 문자를 ASCII 코드로 변환
Character("a").asciiValue!

// String에 식이 들어있을 때 그대로 계산하기
let mathExpression = NSExpression(format: "3+4+2-1*6")
let mathValue = mathExpression.expressionValue(with: nil, context: nil) as! Int // result : 3

// 절대값 변환
abs(-29) // 29

// for 문에서 원하는 수치만큼 증가or감소하는 반복문 필요할때
stride(from: 1, to: 5, by: 2) // open range..5 불포함 1,3 까지만
stride(from: 1, through: 5, by: 2) // closed range..5 포함 1,3,5까지

for even in stride(from: 2, through: 100, by: 2)

// MARK: - Dictionary 사용하기

// 1. 생성
var dic: [Int:String] = [:]
var dic = [Int:String]()
var dic = [1:"a", 2:"b", 3:"c"]

// 2.값 수정
dic.updateValue("c", forKey: 3)
dic[3] = "d"

// 3. 값 추가
// 둘 다 4라는 키가 있을 경우 수정이 됨
dic[4] = "5"
dic.update("5", forkey: 4)

// 4. 접근
dic[4]! // Unwrapping을 해준다

// 5. for문 돌기
for (key, value) in dic {
    print(key) // 1,2,3
    print(value) // a,b,c
}
// 단, 순서는 랜덤으로 나옴

// 6. 값 삭제
dic.removeValue(forKey: 4) // 특정 키 값 삭제
dic.removeAll()

// 7. Key를 바꿀 경우, 지우고 다시 넣어줘야 함
// 8. Dictionary Key로 sort하기
let sort = dic.sorted(by: {$0.key < $1.key }) // value로 sort할 경우 $0.value
