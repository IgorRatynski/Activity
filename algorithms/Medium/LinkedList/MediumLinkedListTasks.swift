//
//  MediumLinkedListTasks.swift
//  Medium
//
//  Created by Igor Ratynski on 17.07.2022.
//

import Foundation

// MARK: Delete duplicates
extension Solution.Medium {
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
}

// TODO: MARK: Odd even list
extension Solution.Medium {
  func oddEvenList(_ head: ListNode?) -> ListNode? {
    let result = head, evenHead = ListNode(0)
    var head = head, even: ListNode? = evenHead, lastAlive = head
    
    while head != nil {
      lastAlive = head!
      even?.next = head?.next
      even = even?.next
      head?.next = head?.next?.next
      head = head?.next
    }
    lastAlive?.next = evenHead.next
    return result
  }
}

// MARK: TODO: Check
extension Solution.Medium {
  func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
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
  
  func testReverseBetween() {
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

// TODO: Check
extension Solution.Medium {
  func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let result = l1
    var l1 = l1, l2 = l2, needToAdd = false
        
    while l2 != nil || needToAdd {
      l1?.val = (l1?.val ?? 0) + (l2?.val ?? 0) + (needToAdd ? 1 : 0)
      
      if l1!.val > 9 {
        l1!.val = l1!.val - 10
        needToAdd = true
      } else {
        needToAdd = false
      }
      
      if l1?.next == nil && (l2?.next != nil || needToAdd) {
        l1?.next = ListNode()
      }
      l1 = l1?.next
      l2 = l2?.next
    }
    
    return result
  }
}
