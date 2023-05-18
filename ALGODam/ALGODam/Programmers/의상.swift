import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var result: Int = clothes.count
    var dict: [String: [String]] = [:]
    for clothe in clothes {
        if var clothesCollection = dict[clothe[1]] {
          clothesCollection.append(clothe[0])
            dict[clothe[1]] = clothesCollection
        } else {
            dict[clothe[1]] = [clothe[0]]
        }
    }
    var answer = 1
    Array(dict.keys).forEach {
        if let collection = dict[$0] {
            answer *= collection.count + 1
        }
    }
    answer -= 1
    return answer
}
