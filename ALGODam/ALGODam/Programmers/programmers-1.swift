//
//  test3.swift
//  ALGODam
//
//  Created by 김담인 on 2023/03/23.
//

// MARK: - 숫자 문자열과 영단어
import Foundation

func solution(_ s:String) -> Int {
    var arr: [Character] = s.map { $0 }
    var sol: [String] = []
    var i = 0
    while i < arr.count {
        switch arr[i] {
            case "z":
                i += 4
                sol.append("0")
            case "o":
                i += 3
                sol.append("1")
            case "t":
                if arr[i+1] == "w" {
                    i += 3
                    sol.append("2")
                } else {
                    i += 5
                    sol.append("3")
                }
            case "f":
                if arr[i+1] == "o" {
                    i += 4
                    sol.append("4")
                } else {
                    i += 4
                    sol.append("5")
                }
            case "s":
                if arr[i+1] == "i" {
                    i += 3
                    sol.append("6")
                } else {
                    i += 5
                    sol.append("7")
                }
            case "e":
                i += 5
                sol.append("8")
            case "n":
                i += 4
                sol.append("9")
            default:
                sol.append("\(arr[i])")
                i += 1

        }
        
    }

    return Int(sol.reduce("",+))!
}

