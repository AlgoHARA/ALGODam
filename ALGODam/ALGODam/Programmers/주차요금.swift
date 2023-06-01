
/*
1. records 각 String원소를 [시간, 차번호, 출입여부]로 매핑 -> 2차원 배열 필요
    시간:분을 -> 분으로 바꿔버리자
2. 차량별 주차시간 기록을 딕셔너리로 String(차번호):Int(총주차시간) 저장
3. 입차 후 출차를 안한 차량에 대해 판별하기 위해 입차한 차의 출차 여부를 판별할 딕셔너리 사용
    String(차번호) : 출차여부(Bool)
    마지막에 출차가 안된 차는 마지막 23:59(분으로 변환해야함) - 입차 시간(분) 계산해서 주차시간에 추가
4. 주차시간 딕셔너리의 모든 차량에 대해 주차요금 계산
    총 주차시간이 기본시간 이하이면 -> 기본요금
    기본 시간보다 크면 -> 기본요금 + (총주차시간 - 기본시간 + 9(올림처리))/10
*/

import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var totalDict: [String: Int] = [:]
    var parkedDict: [String: Int] = [:]
    let parkTimes: [[String]] = records.map{ $0.components(separatedBy: " ") }
    
    for p in parkTimes {
        let HHMM = p[0].components(separatedBy:":").map{Int($0) ?? 0}
        let parkTime = HHMM[0]*60 + HHMM[1]
        print("park")
        print(parkedDict)
        print("total")
        print(totalDict)
        // IN
        if p[2] == "IN" {
            // 주차시간 기록(분으로)
            parkedDict[p[1]] = parkTime

        // OUT
        } else {
            if let total = totalDict[p[1]], let parked = parkedDict[p[1]] {
                totalDict[p[1]] =  total + (parkTime - parked)
            }else {
                if let parked = parkedDict[p[1]] {
                    totalDict[p[1]] = parkTime - parked
                }
            }
            parkedDict[p[1]] = nil
        }
    }
    // 출차되지 않은 차 시간 추가
    parkedDict.keys.forEach {
        if let total = totalDict[$0], let parked = parkedDict[$0] {
            totalDict[$0] = total + ((23*60+59) - parked)
        }else {
            totalDict[$0] = (23*60+59) - parkedDict[$0]!
        }
        
    }
    // 요금 계산
    let allCars: [String] = totalDict.keys.sorted()
    var result: [Int] = []
    for c in allCars {
        let parkTime = totalDict[c] ?? 0
        let totalFee = parkTime <= fees[0] ? fees[1] : fees[1] + ((parkTime - fees[0] + fees[2] - 1) / fees[2])*fees[3]
        result.append(totalFee)
    }
    print("totalDict \(totalDict)")
    print("parkedDict \(parkedDict)")
    print("result \(result)")
    return result
}

