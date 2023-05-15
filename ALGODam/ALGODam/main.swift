// 내 풀이

let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }
var map: [[Int]] = []
var houseMap: [(Int,Int)] = []
var chickenMap: [(Int, Int)] = []
for r in 0..<NM[0] {
    let row = readLine()!.split(separator: " ").map{ Int(String($0))! }
    map.append(row)
    for c in 0..<row.count {
        if row[c] == 1 {
            houseMap.append((r,c))
        }
        if row[c] == 2 {
            chickenMap.append((r,c))
        }
    }
}
var chickenPositions: [[(Int,Int)]] = []
func combination(_ targetArr: [(Int,Int)], _ targetNum: Int, _ index: Int, _ arr: [(Int,Int)]) {
    if arr.count == targetNum {
        chickenPositions.append(arr)
        return
    }
    
    for i in index..<targetArr.count {
        combination(targetArr, targetNum, i+1, arr + [targetArr[i]])
    }
}

combination(chickenMap, NM[1], 0, [])
var result = Int.max
for arr in chickenPositions {
    var chickenDistance = 0
    for housePosition in houseMap {
        var minDistance = Int.max
        arr.forEach {
            let distance = abs($0.0 - housePosition.0) + abs($0.1 - housePosition.1)
            minDistance = min(distance, minDistance)
        }
        chickenDistance += minDistance
    }
    result = chickenDistance < result ? chickenDistance : result
}
print(result)
