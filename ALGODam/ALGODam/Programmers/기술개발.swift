
import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    return zip(progresses, speeds)
        .map { (100 - $0) / $1 }
        // tuple 에는 이전 값(배열, 일자)의 튜플 형태 , day는 다음 원소 값
        .reduce(([], 0)) { (tuple, day) -> ([Int], Int) in
            var (list, lastMax) = tuple

            if lastMax >= day {
                list[list.count - 1] += 1
                return (list, lastMax)
            }
            
            // 새로운 요소 1로 추가, lastMax도 day로 변경
            return (list + [1], day)
            
            /* 야곰님 코드
             list가 빈 배열이면 guard else 로 리턴
             guard let lastCount = list.last else {
                 return ([1], day)
             }
             
             / day 가 lastMax보다 같거나 작으면 요소의 크기를 증가 시킴 ( 맨 끝요소 자르고 끝 값 + 1을 해서 넣어줌)
             if lastMax >= day {
                return (list.dropLast() + [lastCount + 1], lastMax)
             }
             
             return (list + [1], day)
             */
        }.0
}

let progresses = [95, 90, 99, 99, 80, 99]
let speeds = [1, 1, 1, 1, 1, 1]
print( solution(progresses, speeds) )

