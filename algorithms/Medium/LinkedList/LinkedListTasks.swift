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
    let result = ListNode()
    var lastValue: Int?
    var currentNode: ListNode? = result
    var head = head
    
    while head != nil {
      if head?.val == head?.next?.val {
        lastValue = head?.val
      } else {
        if head?.val != lastValue {
          currentNode?.next = head
          currentNode = currentNode?.next
        }
      }
      
      head = head?.next
      currentNode?.next = nil
    }

    return result.next
  }
  
  func testDeleteDuplicates() {
    let a =  ListNode(0, ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(3, ListNode(3)))))))
    var result: ListNode? = Solution().deleteDuplicates(a)

    while result != nil {
     print("result: \(result!.val)")
      result = result?.next
    }
  }
}
