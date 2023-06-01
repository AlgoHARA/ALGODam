struct Queue<T> {
    var enqueue: [T]
    var dequeue: [T] = []
    mutating func push(_ x: T) {
        enqueue.append(x)
    }
    
    mutating func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        
        // popLast 자체가 옵셔널 리턴값을 가지므로 pop함수도 T? 옵셔널 리턴
        return dequeue.popLast()
    }
}

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var goingTrucks = Queue(enqueue: Array(repeating: 0, count: bridge_length))
    var second = 0
    // 다리위 트럭의 무게
    var sum = 0
    // 다리에 올라갈 트럭의 인덱스
    var idx = 0
    while idx < truck_weights.count {
        // 한 번 돌때마다 초 추가
        second += 1
        if let popped = goingTrucks.pop() {
            sum -= popped
        }
        // 다음 순서의 트럭이 올라가도 무게가 괜찮
        if sum + truck_weights[idx] <= weight {
            // 다리에 올라갈 트럭무게
            let truck = truck_weights[idx]
            idx += 1
            sum += truck
            goingTrucks.push(truck)
        // 무게가 넘어가서 안되면 그냥 0을 추가
        } else {
            goingTrucks.push(0)
        }
    }
    // 마지막 트럭이 다리 건너는 시간
    second += bridge_length
    return second
}
