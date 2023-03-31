//
//  bj1058.swift
//  ALGODam
//
//  Created by 김담인 on 2023/03/23.
//

// bj1058  친구 - 브루트포스, 플로이드 워셜

let N = Int(readLine()!)!
var fd: [[Character]] = []
var fdCount: [Int] = []

for _ in 0 ..< N {
    fd.append(readLine()!.map{$0})
        fdCount.append(0)
}

for i in 0 ..< N {
    for j in 0 ..< N {
        if i == j {
            continue
        }
        if fd[i][j] == "Y" {
            fdCount[i] += 1
        } else if fd[i][j] == "N" {
            for k in 0 ..< N {
                if i != k && k != j && fd[i][k] == "Y" && fd[k][j] == "Y" {
                    fdCount[i] += 1
                    break
                }
            }
        }
    }
}
print(fdCount.max()!)
