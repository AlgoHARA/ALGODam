
import Foundation

let MN = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = MN[1]
let M = MN[0]
let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
var box: [[Int]] = []
var totalZero = 0
var rowColDay: [[Int]] = []
var ripenCount = 0

func inRange(row: Int, col: Int) -> Bool {
    if row < 0 || col < 0 || row > N-1 || col > M-1 {
        return false
    }
    return true
}

func bfs() {
    var idx = 0
    while idx < rowColDay.count {
        let rc = rowColDay[idx]
        idx += 1
        for (dx, dy) in directions {
            let nextRow = rc[0] + dx
            let nextCol = rc[1] + dy
            if inRange(row: nextRow, col: nextCol) && box[nextRow][nextCol] == 0 {
                box[nextRow][nextCol] = 1
                rowColDay.append([nextRow,nextCol,rc[2]+1])
                ripenCount += 1
                if ripenCount >= totalZero {
                    return
                }
            }
        }
    }
}

for i in 0..<N {
    let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
    for j in 0..<M {
        if arr[j] == 1 {
            rowColDay.append([i,j,0])
        }
        if arr[j] == 0{
            totalZero += 1
        }
    }
    box.append(arr)
}
 
bfs()
if ripenCount >= totalZero {
    print(rowColDay[rowColDay.count-1][2])
}else {
    print(-1)
}

