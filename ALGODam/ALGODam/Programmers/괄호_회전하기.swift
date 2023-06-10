//
//  괄호 회전하기.swift
//  ALGODam
//
//  Created by 김담인 on 2023/06/10.
//

import Foundation

func solution(_ s:String) -> Int {
    var result = 0
    
    func checkRightS(string: [String]) {
        var dict: [String:(Int,String)] = ["[":(0,"]"), "{":(0,"}"), "(":(0,")"), "]":(-1,"["), "}":(-1,"{"), ")":(-1,"("), ]
        var stack: [String] = []
        for c in string {
            if dict[c]!.0 == 0 {
                stack.append(c)
            } else {
                if stack.isEmpty {
                    return
                }
                if dict[stack.removeLast()]!.1 != c {
                    return
                }
                
            }
            
        }
        result += 1
    }
    
    var sArr = s.map{String($0)}
    var first: String = ""
    var leftArr: [String] = []
    var turned = sArr
    
    if sArr.count % 2 != 0 { return 0 }
    
    for _ in 0..<sArr.count{
        checkRightS(string: turned)
        first = String(turned[0])
        leftArr = Array(turned.dropFirst())
        turned = leftArr + [first]
    }
    
    return result
}

