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
