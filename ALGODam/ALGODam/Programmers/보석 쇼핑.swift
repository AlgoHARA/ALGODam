import Foundation

func solution(_ gems:[String]) -> [Int] {
    // set으로 중복제거하고 유형별 보석 타입 추출
    let gemTypes = Set(gems)
    // 답으로 리턴할 튜플
    var ans = (0,gems.count)
    // 두개로 나눠서 탐색할 투 포인터
    var left = 0, right = 0
    // 보석이름: 배열의 있는 보석 수
    var dict: [String:Int] = [:]
    dict[gems[0]] = 1
    // 포인터 두 개가 범위안에 있을 때
    while left < gems.count && right < gems.count {
        // 탐색한 보석 종류 수가 전체 보석 종류 수랑 같을때
        if dict.count == gemTypes.count {
            // ans에 이미 있는 구간이 right-left보다 짧으면 기존 값 유지
            // right-left가 더 짧으면 left, right값 대입
            ans = ans.1-ans.0 <= right-left ? ans : (left,right)
            // left를 이동시키전 left 위치에 있는 보석의 수를 -1
            dict[gems[left], default: 0] -= 1
            // 보석의 수가 0이면 딕셔너리 삭제 -> left를 이동함으로써 구간의 보석 종류 수가 전체 보석 중류 수와 달라질 수 있어서
            if dict[gems[left]] == 0 { dict.removeValue(forKey: gems[left]) }
            // left 이동
            left += 1
            // left가 right 보다 클때 while문 탈출
            if left >= gems.count || left >= right { break }
            // 아직 전체 보석 종류를 찾지 못했을 때
        } else {
            // 오른쪽 포인터 먼저 이동
            right += 1
            // 범위 벗어나면 while 문 탈출
            if right >= gems.count { break }
            // 전체 보석 배열에서 right 인덱스에 해당하는 보석을 딕셔너리에 키로 디폴트 밸류 0으로 추가하고 +1, 이미 있으면 그냥 밸류 +1
            dict[gems[right],default: 0] += 1
        }
    }
    
    return [ans.0+1, ans.1+1]
}
