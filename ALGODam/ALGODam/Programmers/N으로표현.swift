import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    
    if N == number {return 1}
    // 사용한 N개수: [표현가능 숫자]
    var expressions = [Int:[Int]]()
    // num: num을 표현하는데 사용한 N의 개수
    var usecount = [Int:Int]()
    expressions[1] = [N]   // 5를 1개 사용하여 표현 가능한 숫자: 5
    usecount[N] = 1   // 5를 표현하는 데에 필요한 숫자: 1개
    
    func expressable(_ num: Int, use count: Int) {
        // num을 표현하는데 사용한 N의 수가 아직 nil이여야하고?
        // num이 조건에 주어진 범위안에 있어야 함
        guard usecount[num] == nil else {return}
        guard 0 < num && num <= 32000 else {return}
        // count로 표현가능한 수들 append
        expressions[count]?.append(num)
        // num을 표현하는데 사용한 N의 개수는 count
        usecount[num] = count
    }
    
    // count가 1일때는 이미 초기화 했기때문에 2~8까지
    for count in 2...8 {
        // count 만큼의 N으로 표현할 수 있는 수를 저장할 배열 초기화
        expressions[count] = [Int]()
        
        // N을 count번 반복한 수가 number와 같으면 연산 수행 필요 없음
        if makeRepeating(N, count: count) == number { return count }
        // N의 count만큼 반복한 수를 딕셔너리에 추가
        expressable(makeRepeating(N, count: count), use: count)
        
        
        for i in 1..<count {
            // 총 count만큼 N 사용시 i 번 썼을때랑, count-1번 썼을때 값들 바인딩
            // numbers1,2는 배열
            guard let numbers1 = expressions[i], let numbers2 = expressions[count-i] else {
                continue
            }
            
            // numbers1,2안에 있는 값들을 for문으로 같이 연산 시킴
            for op1 in numbers1 {
                for op2 in numbers2 {
                    if op1/op2==number||op1-op2==number||op1+op2==number||op1*op2==number {
                        return count
                    }
                    expressable(op1/op2, use: count)
                    expressable(op1-op2, use: count)
                    expressable(op1+op2, use: count)
                    expressable(op1*op2, use: count)
                }
            }
        }
    }
    return -1
}

func makeRepeating(_ num: Int, count: Int) -> Int {
    var result = 0
    for _ in 0..<count {
        result = result*10 + num
    }
    return result
}
