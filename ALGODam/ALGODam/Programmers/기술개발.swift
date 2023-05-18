// 내 풀이

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var result : [Int] = []
    // ### 고차함수를 써서 날짜를 계산했는데 시간초과로 실패함
   // var leftDaysArray = progresses.map{Float($0)}.enumerated().map { (pIndex, progress) in
   //      return speeds.map{Float($0)}.enumerated().filter({ (sIndex, element) in
   //          pIndex == sIndex
   //      }).map{ (index, speed) in ceil((100 - progress) / speed) }
   // }.flatMap{$0}

    var leftDaysArray: [Int] = []
    for i in 0..<speeds.count {
        var day = 0
        if (100 - progresses[i]) % speeds[i] == 0 {
            day = (100 - progresses[i]) / speeds[i]
        } else {
            day = (100 - progresses[i]) / speeds[i] + 1
        }

        leftDaysArray.append(day)
    }

    print(leftDaysArray)

     var distributed = 0
     var priorDay = leftDaysArray[0]
     for postDay in leftDaysArray {
         if priorDay >= postDay {
             distributed += 1
         } else {
             result.append(distributed)
             distributed = 1
             priorDay = postDay
         }
     }
    result.append(distributed)
     print(result)

    return result
}
