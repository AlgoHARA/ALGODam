import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    // n보다 2만큼 큰 배열 생성(맨앞, 맨뒤 추가)
    var arr:[Int] = Array(repeating: 1, count: n+2)

    // 체육복이 없는 학생 1 -> 0
    for l in lost {
        arr[l] -= 1
    }
    
    // 체육복 여분이 있는 학생 1 -> 2 (도난 당한 학생일때는 0 -> 1)
    for r in reserve {
        arr[r] += 1
    }

    // 체육복이 없을때 먼저 앞번호가 있으면 빌리고 없으면 뒷번호를 보고 있으면 빌린다.
    for i in 1..<arr.count-1 {
        if arr[i] < 1 {
            if arr[i-1] >= 2{
                arr[i-1] -= 1
                arr[i] += 1
            }else if arr[i+1] >= 2 {
                arr[i+1] -= 1
                arr[i] += 1
            }
        }
    }

    return arr.filter{$0 >= 1}.count-2
}

