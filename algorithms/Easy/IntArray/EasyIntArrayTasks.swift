//  print("# m: \(m), n: \(n), ip: \(inoutPointer), nums1: \(nums1)")
extension Solution.Easy {
  static func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    guard m > 0, n > 0 else {
      if n > 0 {
        nums1 = nums2
      }
      return
    }
    var inoutPointer = m + n - 1, m = max(m - 1, 0), n = max(n - 1, 0)
    
    while inoutPointer > -1 {
      if nums1[m] < nums2[n] {
        nums1[inoutPointer] = nums2[n]
        
        n = max(0, n - 1)
      } else {
        nums1[inoutPointer] = nums1[m]
        nums1[m] = 0
        m = max(0, m - 1)
      }
      
      inoutPointer -= 1
    }
  }
  
  static func testMergeIntArrays() {
    var nums1 = [1,2,3,0,0,0]
    let m = 3, nums2 = [2,5,6], n = 3
//    var nums1 = [1,0,0]
//    let m = 1, nums2 = [1,1], n = 2
//    var nums1 = [1]
//    let m = 1, nums2: [Int] = [], n = 0
//    var nums1 = [2,0]
//    let m = 1, nums2: [Int] = [1], n = 1
    
    merge(&nums1, m, nums2, n)
    
    print(nums1)
  }
  
  
//  public static int[] TwoSum(int[] nums, int target)
//  {
//
//    for (int i = 0; i < nums.Length - 1; i++)
//    {
//      for (int j = i + 1; j < nums.Length; j++)
//      {
//        if (nums[i] + nums[j] == target)
//        {
//          return new int[] { i, j };
//        }
//      }
//    }
//    return Array.Empty<int>();
//  }
//}
  
  // ------------
  
//  public class IntNumber
//  {
//
//    public static bool IsHappy2(int n)
//    {
//      string tempString;
//      int tempResult;
//
//      HashSet<int> cache = new HashSet<int>();
//
//      while (!cache.Contains(n))
//      {
//        if (n == 1) { return true; }
//        else { cache.Add(n); }
//
//        tempString = n.ToString();
//        tempResult = 0;
//
//        for (int i = 0; i < tempString.Length; i++)
//        {
//          //Console.WriteLine($"tempString: {tempString}, value: {int.Parse(tempString[i].ToString())}, result: {int.Parse(tempString[i].ToString()) * int.Parse(tempString[i].ToString())}");
//          //Console.WriteLine($"n: {tempString}, value: {int.Parse(tempString[i].ToString())}, result: {int.Parse(tempString[i].ToString()) * int.Parse(tempString[i].ToString())}");
//          tempResult += int.Parse(tempString[i].ToString()) * int.Parse(tempString[i].ToString());
//        }
//        n = tempResult;
//      }
//
//      return false;
//    }

  
  // ---------------------
//  }
}

        
