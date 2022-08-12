//
//  MediumLinkedListTasks.swift
//  Medium
//
//  Created by Igor Ratynski on 17.07.2022.
//

import Foundation

// MARK: - Delete duplicates
extension Solution.Medium {
  static func deleteDuplicates(_ head: ListNode?) -> ListNode? {
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
  
  static func testDeleteDuplicates() {
    let a =  ListNode(0, ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(3, ListNode(3)))))))
    var result: ListNode? = deleteDuplicates(a)

    while result != nil {
     print("result: \(result!.val)")
      result = result?.next
    }
  }
}

extension Solution.Medium {
  static func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
    guard left != right else { return head }
    
    let result = head
    var count = 1
    var head = head
    var tempArray: [ListNode] = []
    
    while head != nil {
      if count >= left && count <= right {
        tempArray.append(head!)
      } else if count > right {
        break
      }
      head = head?.next
      count += 1
    }
    
    var temp: Int
    count = tempArray.count - 1
    for index in 0...count / 2 {
      temp = tempArray[index].val
      tempArray[index].val = tempArray[count - index].val
      tempArray[count - index].val = temp
    }
    
    return result
  }
  
  static func testReverseBetween() {
    let a =  ListNode(0, ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(3))))))
    var result: ListNode? = reverseBetween(a, 2, 5)

    while result != nil {
     print("result: \(result?.val)")
      result = result?.next
    }
    
//    [3,5] == [5,3]
//    1
//    2
  }
}

