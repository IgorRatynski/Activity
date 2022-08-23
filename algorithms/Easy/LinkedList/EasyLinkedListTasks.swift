//
//  EasyLinkedListTasks.swift
//  Easy
//
//  Created by Igor Ratynski on 17.07.2022.
//

import Foundation

// MARK: Delete duplicates
extension Solution.Easy {
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
}

// MARK: Reverse list
extension Solution.Easy {
  func reverseList(_ head: ListNode?) -> ListNode? {
    let result = head
    var head = head, array: [Int] = []
    
    while head != nil {
      array.append(head!.val)
      head = head?.next
    }
    
    head = result
    let max = array.count - 1
    for index in 0..<array.count {
      head?.val = array[max - index]
      head = head?.next
    }
    
    return result
  }
}

// MARK: Is palindrome
extension Solution.Easy {
  func isPalindrome(_ head: ListNode?) -> Bool {
    var head = head, array: [Int] = []
    
    while head != nil {
      array.append(head!.val)
      head = head?.next
    }
    
    let max = array.count - 1
    for index in 0..<array.count / 2 {
      if array[index] != array[max - index] {
        return false
      }
    }
    
    return true
  }
}

// MARK: Remove elements
extension Solution.Easy {
  func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    guard head != nil, val != 0 else { return head }
    
//    // I. while
//
//    let result: ListNode? = ListNode(0, head)
//    var head = result
//
//    while head?.next != nil {
//      if head?.next?.val == val {
//        head?.next = head?.next?.next
//      } else {
//        head = head?.next
//      }
//    }
//
//    return result?.next
    
    // II. recursion
    
    var head = head
    if head?.val == val {
      head = removeElements(head?.next, val)
    } else {
      head?.next = removeElements(head?.next, val)
    }
    return head
  }
}

// MARK: Middle node
extension Solution.Easy {
  func middleNode(_ head: ListNode?) -> ListNode? {
    var count = 1, iteration = 0, steelNeed = 0, tempHead = head
    
    while tempHead?.next != nil {
      count += 1
      tempHead = tempHead?.next
    }
    
    tempHead = head
    count = count / 2
    while iteration < count {
      steelNeed = count - iteration
      switch steelNeed {
        case 1:
          return tempHead?.next
        case 2:
          return tempHead?.next?.next
        case 3...:
          tempHead = tempHead?.next?.next?.next
          iteration += 3
        default:
          return tempHead
      }
    }
    
    return tempHead
  }
}

// MARK: Delete node
extension Solution.Easy {
  func deleteNode(_ node: ListNode?) {
    node?.val = node!.next!.val
    node?.next = node?.next?.next
  }
}
