//
//  LinkedListTasks.swift
//  Medium
//
//  Created by Igor Ratynski on 17.07.2022.
//

import Foundation

// MARK: - Delete duplicates
extension Solution {
  func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    let result = head
    var currentNode = result
  }
  
  func testDeleteDuplicates() {
    //let a = ListNode(0, ListNode(0, ListNode(1, ListNode(1, ListNode(1)))))
    var result: ListNode? = Solution().deleteDuplicates(a)

    while result != nil {
     print("result: \(result?.val)")
      result = result?.next
    }
  }
}
