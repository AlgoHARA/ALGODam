//
//  징검다리_건너기.swift
//  ALGODam
//
//  Created by 김담인 on 2023/06/16.
//

import Foundation

func solution(_ stones:[Int], _ k: Int) -> Int {
    // end는 다리를 건널 가능성있는 최대 인원 (= 돌의 max 값)
    // or 문제의 조건에서 주어진 최댓값 2억으로 설정 가능
    var start = 0, end = stones.max()!
    
    while start <= end {
        // 이분 탐색으로 start와 end사이 mid의 건너는 인원을 가정
        let mid = (start + end) / 2
        
        var isPossible = true
        var skipCount = 0
        
        for stone in stones {
            // 현재 돌 값이 건너려는 인원이 다 지나 갈수 있을 정도로 큰지?
            if stone - mid >= 0 {
                // 그러면 건너뛰지 않아도 됨 -> 건너뛰기 리셋
                skipCount = 0
                
                // 현재 돌 값이 건너는 인원보다 작다면 건너뛰어야 되는 돌 + 1
            } else {
                skipCount += 1
                
                // 건너뛰는 돌이 연속 k개 이상이 되면 break
                if skipCount >= k {
                    isPossible = false
                    break
                }
            }
        }
        
        // mid 인원으로 건널 수 있으므로 최소 인원값 조정
        if isPossible {
            start = mid + 1
        // mid 인원으로 건널 수 없으므로 최대 인원값 조정
        } else {
            end = mid - 1
        }
    }
    return end
}

