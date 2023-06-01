import Foundation

func caculation(numbers: [Int], target: Int, index: Int, sum: Int) -> Int {
    if index == numbers.count {
        return sum == target ? 1 : 0
    }

    return caculation(numbers: numbers, target: target, index: index + 1, sum: sum + numbers[index]) + caculation(numbers: numbers, target: target, index: index + 1, sum: sum - numbers[index])

}

func solution(_ numbers: [Int], _ target: Int) -> Int {
    return caculation(numbers: numbers, target: target, index: 0, sum: 0)
}
