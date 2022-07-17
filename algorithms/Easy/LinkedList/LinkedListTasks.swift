//
//  LinkedListTasks.swift
//  Easy
//
//  Created by Igor Ratynski on 17.07.2022.
//

import Foundation

// MARK: - Delete duplicates
extension Solution {
  func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    let result = head
    var currentNode = result
    var head = head?.next
    currentNode?.next = nil

    while head != nil {
      if currentNode?.val != head?.val {
        currentNode?.next = head
        currentNode = head
      } else {
        currentNode?.next = nil
      }
      head = head?.next
    }

    return result
  }
  
  func testDeleteDuplicates() {
    //let a = ListNode(0, ListNode(0, ListNode(1, ListNode(1, ListNode(1)))))
    //let a = ListNode(1, ListNode(1, ListNode(1, ListNode(1, ListNode(1)))))
    let a =  ListNode(0, ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(3))))))
    var result: ListNode? = Solution().deleteDuplicates(a)

    while result != nil {
     print("result: \(result?.val)")
      result = result?.next
    }
  }
}
