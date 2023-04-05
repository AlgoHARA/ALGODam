//
//  bj2630.swift
//  ALGODam
//
//  Created by 김담인 on 2023/03/31.
//

// MARK: - BaekJoon 2630
var N = Int(readLine()!)!
var square: [[Int]] = []
for _ in 0 ..< N {
    square.append(readLine()!.split(separator: " ").map{Int($0)!})
}

var bluePaper = 0
var whitePaper = 0

func getFourSquares(sqr: [[Int]], n: Int) {
    let isAllSame = checkIfAllSame(arr: sqr)
    // 배열의 원소가 다 같지 않으면
    if !isAllSame {
        // N을 절반으로
        let len = n / 2
        // 4분면의 배열을 담을 딕셔너리 초기화
        var dict: [Int:[[Int]]] = [0:[], 1:[], 2:[], 3:[]]
        // 4분면으로 나누기
        for i in 0...3 {
            // 각 분면의 행 반복
            for r in 0..<len {
                var row: [Int] = []
                // 각분면의 열 반복
                for c in 0..<len {
                    // 0,1분면일 때
                    if i <= 1{
                        // r은 그대로 c는 1분면에서 + len의 값을 가져야함
                        row.append(sqr[r][c+i*len])
                        // 2,3분면일 때
                    }else {
                        // r은 +len값을 가지고, c는 0,1과 같지만 i값에 -2를 해줘야함
                        row.append(sqr[r+len][c+(i-2)*len])
                    }
                }
                dict[i]?.append(row)
            }
            // 재귀 호출로 각 분면에 대해 확인
            getFourSquares(sqr: dict[i]!, n: len)
        }
        // 원소가 다 같으면
    } else {
        // 0으로 다 같은 거면 white에
        if sqr.flatMap({$0}).contains(0) {
            whitePaper += 1
            // 그게 아니면 1로 같은것이므로 blue에 추가
        } else {
            bluePaper += 1
        }
    }
}

// 배열이 모두 같은 원소로 이루어져있는지 판단하는 함수
func checkIfAllSame(arr: [[Int]]) -> Bool {
    // 2차원 배열을 1차원 배열로 만들어줌
    let flat = arr.flatMap{$0}
    
    // flat된 1차원 배열내에 0,1 둘다 있으면 false
    if flat.contains(1) && flat.contains(0) {
        return false
    }
    return true
}
//실행 구문
getFourSquares(sqr: square, n: N)
print(whitePaper)
print(bluePaper)

