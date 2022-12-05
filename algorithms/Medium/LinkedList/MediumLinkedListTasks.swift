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

// MARK: Pair sum
extension Solution.Medium {
  func pairSum(_ head: ListNode?) -> Int {
    var head = head, result = 0, temp = 0, array: [Int] = []
    
    while head != nil {
      array.append(head!.val)
      head = head?.next
    }
    
    let max = array.count - 1
    for index in 0..<array.count / 2 {
      temp = array[index] + array[max - index]
      guard temp > result else { continue }
      result = temp
    }
    
    return result
  }
}

// MARK: Delete middle
extension Solution.Medium {
  func deleteMiddle(_ head: ListNode?) -> ListNode? {
    guard head?.next != nil else { return nil }
    var count = 1, tempHead = head
    
    while tempHead?.next != nil {
      count += 1
      tempHead = tempHead?.next
    }
    
    tempHead = head
    count = count / 2
    
    // TODO: Test speed vs for _
    while count > 1 {
      count -= 1
      tempHead = tempHead?.next
    }
    
    tempHead?.next = tempHead!.next?.next
    
    return head
  }
}

// MARK: Remove nth from end
extension Solution.Medium {
  func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    guard head?.next != nil else { return nil }
    var count = 1, tempHead = head
    
    while tempHead?.next != nil {
      count += 1
      tempHead = tempHead?.next
    }
    
    guard n < count else { return head?.next }
    
    tempHead = head
    count -= n
    
    while count > 1 {
      count -= 1
      tempHead = tempHead?.next
    }
    
    tempHead?.next = tempHead!.next?.next
    
    return head
  }
}

// MARK: Swap nodes
extension Solution.Medium {
  func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard head?.next != nil else { return head }
    var count = 1, tempHead = head, leftNode: ListNode?, last: Int
    
    while tempHead?.next != nil {
      count += 1
      tempHead = tempHead?.next
    }
    
    last = count - k + 1
    tempHead = head
    count = min(k, last)
    
    while count > 1 {
      count -= 1
      tempHead = tempHead?.next
    }
    leftNode = tempHead
    
    count = max(k, last) - min(k, last) + 1
    while count > 1 {
      count -= 1
      tempHead = tempHead?.next
    }
    
    count = leftNode!.val
    leftNode?.val = tempHead!.val
    tempHead?.val = count
    
    return head
  }
}

// MARK: 2181. Merge Nodes in Between Zeros
extension Solution.Medium {
  func mergeNodes(_ head: ListNode?) -> ListNode? {
    guard head?.next != nil else { return nil }
    let result = head
    var head = head
    
    while head?.next?.val != 0 {
      head = head?.next
      result?.val += head?.val ?? 0
    }
    
    result?.next = mergeNodes(head?.next)
    
    return result
  }
}
