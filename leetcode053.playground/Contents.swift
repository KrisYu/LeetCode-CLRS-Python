class Solution {
    func maxSubArray(nums: [Int]) -> Int {
        
        let (_,_,sum) = findMaximumSubarray(nums, low: 0, high: nums.count - 1 )
        return sum
    }
    func findMaxCrossingSubarray(A: [Int], low: Int, mid: Int, high:Int) -> (leftIdx:Int, rightIdx:Int, leftSumPlusRightSum :Int) {
        
        var leftSum = -3000
        var sum = 0
        var leftIdx = mid
        var maxLeft = mid
        
        while maxLeft >= low{
            sum += A[maxLeft]
            if sum > leftSum {
                leftSum = sum
                leftIdx = maxLeft
            }
            maxLeft -= 1
        }
        
        var rightSum = -3000
        sum = 0
        var rightIdx = mid+1
        var maxRight = mid + 1
        
        while maxRight <= high {
            sum += A[maxRight]
            if sum > rightSum {
                rightSum = sum
                rightIdx = maxRight
            }
            maxRight += 1
        }
        
        return (leftIdx ,rightIdx ,leftSum + rightSum)
    }
    
    
    func findMaximumSubarray(A: [Int], low: Int, high: Int) -> (leftIdx: Int, rightIdx: Int, maxSum: Int) {
        
        let mid = (low + high)/2
        
        if high == low {
            return (low,high,A[low])
        }
        else {
            let (left_low,left_high,left_sum) =  findMaximumSubarray(A, low: low, high: mid)
            let (right_low,right_high,right_sum) = findMaximumSubarray(A, low: mid+1, high: high)
            let (cross_low,cross_high,cross_sum) = findMaxCrossingSubarray(A, low: low, mid: mid, high: high)
            if left_sum >= right_sum && left_sum >= cross_sum {
                return (left_low,left_high,left_sum)
            }
            else if right_sum >= left_sum && right_sum >= cross_sum{
                return (right_low,right_high,right_sum)
            } else {
                return (cross_low,cross_high,cross_sum)
            }
        }
        
    }

}
