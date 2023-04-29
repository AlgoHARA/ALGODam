
import Foundation

let N = Int(readLine()!) ?? 0
var RGB: [[String]] = []
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
var result: [Int] = [0,0]

for _ in 0..<N {
    let line: String = readLine()!
    var stringArr: [String] = []
    for i in line {
        stringArr.append(String(i))
    }
    RGB.append(stringArr)
}
var visitedArr: [[Bool]] = Array(repeating: Array(repeating: false, count: N), count: N)
var needVisitedArr:[[Int]] = []

// x,y 좌표가 범위를 벗어났는지 판별하는 함수
func inRange(x: Int, y:Int) -> Bool{
    if x < 0 || x > N-1 || y < 0 || y > N-1 {
        return false
    }
    return true
}

// 상하좌우를 확인해 color가 같은 좌표는 needVisitedArr에 추가
func checkArea(row:Int, col:Int, color: String, isRG: Bool) {
    for i in 0..<4 {
        let nX = row+dx[i]
        let nY = col+dy[i]
        if inRange(x: nX, y: nY) && !visitedArr[nX][nY] {
            if isRG && (((color == "R" || color == "G") && RGB[nX][nY] != "B")
                        || ( color == "B" && RGB[nX][nY] == "B")) {
                needVisitedArr.append([nX,nY])
                visitedArr[nX][nY] = true
            } else if color == RGB[nX][nY] {
                needVisitedArr.append([nX,nY])
                visitedArr[nX][nY] = true
            }
        }
    }
}

func DFS(color: String, isRG: Bool) {
    while !needVisitedArr.isEmpty {
        // needVisitedArr를 스택처럼 사용해 DFS로 구현
        let xy = needVisitedArr.removeLast()
        // i,j 좌표를 이미 방문했으면 continue로 다음 좌표탐색
        checkArea(row: xy[0], col: xy[1], color: color, isRG: isRG)
    }
}

for i in 0..<N {
    for j in 0..<N {
        if visitedArr[i][j]{ continue }
        needVisitedArr.append([i,j])
        visitedArr[i][j] = true
        DFS(color: RGB[i][j], isRG: false)
        result[0] += 1
    }
}

visitedArr = Array(repeating: Array(repeating: false, count: N), count: N)

for i in 0..<N {
    for j in 0..<N {
        if visitedArr[i][j] { continue }
        needVisitedArr.append([i,j])
        visitedArr[i][j] = true
        DFS(color: RGB[i][j], isRG: true)
        result[1] += 1
    }
}

print("\(result[0]) \( result[1])")

