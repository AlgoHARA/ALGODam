/*
build = [x, y, 기둥(보), 설치(삭제)]
 1. nxn 크기의 2차원 배열
 2. build를 보고 판단해야 할 것
    2-1. 설치 - 기둥 or 보 설치 조건 만족?
        a. 기둥 설치 가능 조건
            - 바닥
            - 보의 한쪽 끝
            - 기둥의 위
        b. 보 설치 가능 조건
            - 한 쪽 끝이 기둥 위
            - 양쪽 동시에 보에 연결
    2-2. 삭제 - 삭제 후 구조 상태 ok?
        - 삭제시 양쪽에 연결되어 있는 구조물의 x,y,기둥(보)값을 구하고
        - 이게 2-1의 설치 가능 조건을 만족하는지 판별
 3. 리턴 배열 정렬
    - [x,y,기둥(보)]
    - x,y,기둥 우선 순위로 정렬
*/

import Foundation

func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    var answer = Set<[Int]>()

    func canConstruct() -> Bool {
        for structure in answer {
            let x = structure[0], y = structure[1], a = structure[2]

            // 기둥
            if a == 0 {
                if answer.contains([x - 1, y, 1]) || answer.contains([x, y, 1]) || answer.contains([x, y - 1, 0]) || y == 0 { continue }
                return false
            }
            // 보
            else {
                if answer.contains([x, y - 1, 0]) || answer.contains([x + 1, y - 1, 0]) || (answer.contains([x - 1, y, 1]) && answer.contains([x + 1, y, 1])) { continue }
                return false
            }
        }
        return true
    }

    for structure in build_frame {
        var valid = true
        // 설치
        if structure[3] == 1 {
            answer.insert([structure[0], structure[1], structure[2]])
            valid = canConstruct()
            if !valid { answer.remove([structure[0], structure[1], structure[2]]) }
        }
        // 삭제
        else {
            let comp = [structure[0], structure[1], structure[2]]
            answer.remove(comp)
            valid = canConstruct()
            if !valid { answer.insert(comp) }
        }
    }

    return answer.sorted { lhs, rhs in
        if lhs[0] == rhs[0] {
            if lhs[1] == rhs[1] {
                return lhs[2] < rhs[2]
            }
            return lhs[1] < rhs[1]
        }
        return lhs[0] < rhs[0]
    }
}
