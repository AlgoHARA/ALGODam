//
//  main.swift
//  ALGODam
//
//  Created by 김담인 on 2023/03/23.
//

// bj2961
import Foundation

var dic = [1:"a", 2:"b", 3:"c"]
let sort = dic.sorted(by: {$0.key > $1.key }) // value로 sort할 경우 $0.value
print(sort)
