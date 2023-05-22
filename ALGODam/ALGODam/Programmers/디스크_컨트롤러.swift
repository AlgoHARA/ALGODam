import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    print("jobs \(jobs)")
    var jobsCopy = jobs
    var result = 0
    var currentTime = 0
    var workTime = 0
    var waitingTime = 0
    
    func controller( _ leftJobs: inout [[Int]]) {
        if leftJobs.isEmpty { return }
        var minWork = 1001
        var chosen = 0
        var hasRequest = false
        for i in 0..<leftJobs.count {
            if currentTime >= leftJobs[i][0] {
                hasRequest = true
                if currentTime + leftJobs[i][1] < minWork  {
                    minWork = currentTime + leftJobs[i][1]
                    chosen = i
                }
            }
        }
        if hasRequest {
            workTime += leftJobs[chosen][1]
            waitingTime += currentTime - leftJobs[chosen][0]
            currentTime += leftJobs[chosen][1]
            hasRequest = false
            leftJobs.remove(at: chosen)
        }else {
            currentTime += 1
        }
        controller(&leftJobs)
    }
    
   controller(&jobsCopy)
    result = (waitingTime + workTime) / jobs.count
    print("result \(result)")
    return result
    
}
