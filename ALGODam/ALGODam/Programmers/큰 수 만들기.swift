import Foundation

// 출처: https://sio2whocode.tistory.com/182
func solution(_ number:String, _ k:Int) -> String {
    var answer = ""

    var _k:Int = k // k를 감소시키기 위해 변수로 선언
    let numbers:[Character] = Array(number) // swift 문자열은 서브스크립트를 제공하지 않기 때문에 편의상 배열로 변환
    let n:Int = numbers.count
    var stack:[Character] = []
    
    for num in numbers {
        // 스택에서 값을 빼내는 반복문
        while !stack.isEmpty && _k > 0 &&
        stack.last!.wholeNumberValue! < num.wholeNumberValue! {
            stack.removeLast()
            // 스택에서 값을 뺀다는 것은 이 값들을 아예 빼겠다는 것임,
            // 그 횟수가 최대 k개니까 while문에서 k > 0 일때까지만 돌림
            _k -= 1
        }
        // 정해진 길이를 넘지 않는다면 stack에 append
        // stack내 개수가 최댓값 - 1일때 append해서 최댓값이 되므로 n-k 보다 작을때만!
        if stack.count < n-k {
            stack.append(num)
        }
    }
    return String(stack)
}
