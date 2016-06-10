class Solution {
    func findMedianSortedArrays(nums1: [Int], _ nums2: [Int]) -> Double {
        
        let m = nums1.count
        let n = nums2.count
        let total = m + n
        
        if total % 2 == 1 {
            return Double(findKth(nums1, nums2, k: (total+1)/2))
        } else {
            return (Double(findKth(nums1, nums2, k: total/2) + findKth(nums1, nums2, k: total/2+1)))/2
        }
        
    }
    
    
    func findKth(nums1: [Int], _ nums2: [Int], k:Int) -> Int{
        //always make nums2 bigger than nums1
        if nums2.count < nums1.count {
            return findKth(nums2, nums1, k: k)
        }
        
        if nums1.count == 0 {
            return nums2[k-1]
        }
        
        if k == 1 {
            return min(nums1[0], nums2[0])
        }
        
        let idx1 = min(nums1.count, k/2)
        let idx2 = k - idx1
        
        if nums1[idx1-1] < nums2[idx2-1] {
            var newNums1 = nums1
            newNums1.removeFirst(idx1)
            return findKth(newNums1, nums2, k: k-idx1)
        } else {
            var newNum2:[Int] = nums2
            newNum2.removeFirst(idx2)
            return findKth(nums1, newNum2, k: k-idx2)
        }
    }
    
}
