
let n = readLine()!

var numString: String = ""
var minusNum: Int = 0
var result: Int = 0

enum OP {
    case minus
    case plus
}

// 초기 연산값은 +로 지정 (처음 나오은 숫자는 무조건 더해지기 때문에)
var op: OP = .plus

// 이전 연산자에 따라 결과값을 계산하는 함수
func calculate(preOp: OP){
    // 함수 실행 전까지 나온 숫자들을 Int로 변환
    minusNum += Int(numString) ?? 0
    numString = ""
    switch preOp {
    case .minus:
        result -= minusNum
    case .plus:
        result += minusNum
    }
    // minusNum 초기화
    minusNum = 0
}

for i in n {
    switch i {
    case "-":
        // - 연산자를 기준으로 이전 연산자에 대한 계산 수행
        // 이전 연산자에 -가 나왔으면 - 를 해주지만
        // 그렇지 않으면 초기값인 + 연산 수행
        calculate(preOp: op)
        op = .minus
    case "+":
        // + 연산일때는 numString에 저장해둔 숫자를 Int로 변환해
        // minusNum 업데이트
        minusNum += Int(numString) ?? 0
        numString = ""
    default:
        numString += String(i)
    }
}

// 마지막에 연산자가 없으므로 그 이전 연산자에 따른 계산 실행
calculate(preOp: op)
print(result)
