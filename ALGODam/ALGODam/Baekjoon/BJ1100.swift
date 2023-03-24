//
//  test2.swift
//  ALGODam
//
//  Created by 김담인 on 2023/03/23.
//

// MARK: - BaekJoon 1100
var cheseBorad: [String] = []
var count = 0
for i in 0...7 {
    cheseBorad.append(readLine()!)
    for j in 0...7 {
        if i % 2 == 0 {
            if cheseBorad[i].getChar(at: j) == "F" && j%2 == 0  {
                count += 1
            }
        }else {
            if cheseBorad[i].getChar(at: j) == "F" && j%2 == 1  {
                count += 1
            }
        }
        
        
    }
}
print(count)


extension String {
    func getChar(at index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
