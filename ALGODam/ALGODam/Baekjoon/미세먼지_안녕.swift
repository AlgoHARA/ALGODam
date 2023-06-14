

import Foundation

let RCT = readLine()!.split(separator: " ").map{Int($0)!}
var dustMap: [[Int]] = []
var airCleaner: [Int] = []
for i in 0..<RCT[0] {
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    dustMap.append(line)
    if line[0] == -1 && airCleaner.isEmpty {
        airCleaner = [i, i+1]
    }
}
let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]
var pendingDusts: [(Int, Int, Int)] = []

func diffuseDust() {
// 모든 그래프를 돌며 확산될 먼지를 확인
    for r in 0..<RCT[0] {
        for c in 0..<RCT[1] {
            let diffused = dustMap[r][c] / 5
            if diffused > 0 {
                for i in 0..<4 {
                    let ny = r+dy[i]
                    let nx = c+dx[i]
                    if nx < 0 || ny < 0 || ny >= RCT[0] || nx >= RCT[1] || dustMap[ny][nx] == -1 { continue }
                    // 먼지가 확산되는 곳의 좌표와 먼지의 양을 따로 배열에 저장
                                        pendingDusts.append((ny, nx, diffused))
                                        확산 될 때마다 가운데 먼지에서 확산되는 먼지를 빼줌
                    dustMap[r][c] -= diffused
                }
            }
        }
    }
    for (y, x, d) in pendingDusts {
        dustMap[y][x] += d
    }
        // 여기 이 배열을 초기화 안해줘 틀렸었음
    pendingDusts = []
}

func cleanAir() {
    let up = airCleaner[0]
    let down = airCleaner[1]
    let r = RCT[0] - 1
    let c = RCT[1] - 1
    
    let upBottom = [-1, 0] + dustMap[up][1...c-1]
    let upTop = Array(dustMap[0][1...c]) + [dustMap[1][c]]
    for nx in stride(from: 0, through: up-1, by: +1) {
        dustMap[nx][c] = dustMap[nx+1][c]
    }
    
    for nx in stride(from: up-1, through: 1, by: -1) {
        dustMap[nx][0] = dustMap[nx-1][0]
    }
    dustMap[0] = upTop
    dustMap[up][1] = 0
    dustMap[up] = upBottom
    
    let downTop = [-1, 0] + dustMap[down][1...c-1]
    let downBottom = Array(dustMap[r][1...c]) + [dustMap[r-1][c]]

    for nx in stride(from: r, through: down+1, by: -1) {
        dustMap[nx][c] = dustMap[nx-1][c]
    }
    for nx in stride(from: down+1, through: r-1, by: +1) {
        dustMap[nx][0] = dustMap[nx+1][0]
    }
    dustMap[down][1] = 0
    dustMap[down] = downTop
    dustMap[r] = downBottom
}


for _ in 0..<RCT[2] {
    diffuseDust()
    cleanAir()
}

var result = 0
for r in 0..<RCT[0] {
    for c in 0..<RCT[1] {
        if dustMap[r][c] > 0 {
            result += dustMap[r][c]
        }
    }
}
print(result)
