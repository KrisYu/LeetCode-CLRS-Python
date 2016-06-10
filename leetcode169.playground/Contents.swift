class Solution {
    func majorityElement(nums: [Int]) -> Int {
        var count = 0
        var majority = 0
        for n in nums {
            if count == 0{
                majority = n
            }
            if majority == n {
                count += 1
            }
            else{
                count -= 1
            }
        }
        return majority
    }
}