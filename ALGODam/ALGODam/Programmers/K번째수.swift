import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    var result: [Int] = []
    var section: [Int] = []

    for command in commands {
        section = []
        for i in 0..<array.count {
            if i >= command[0] - 1 {
                section.append(array[i])
            }
            
            if i == command[1] - 1 {
                break
            }
        }
        section.sort(by: { $0 < $1 })
        result.append(section[command[2]-1])
    }
    
    return result
}
