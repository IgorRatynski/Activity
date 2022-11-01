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
    var currentNode = result, head = head?.next
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

// MARK: 237. Delete Node in a Linked List
extension Solution.Easy {
  func deleteNode(_ node: ListNode?) {
    node?.val = node!.next!.val
    node?.next = node?.next?.next
  }
}

// MARK: 112. Path Sum
extension Solution.Easy {
  func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    guard let root = root else { return false }
    if root.val == targetSum && root.left == nil && root.right == nil { return true }
    
    return hasPathSum(root.left, targetSum - root.val) || hasPathSum(root.right, targetSum - root.val)
  }
}

// MARK: 938. Range Sum of BST
extension Solution.Easy {
  func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
    guard let root = root else { return 0 }
    return rangeSumBST(root.left, low, high) + rangeSumBST(root.right, low, high) + (root.val >= low && root.val <= high ? root.val : 0)
  }
}

// MARK: 1290. Convert Binary Number in a Linked List to Integer
extension Solution.Easy {
  func getDecimalValue(_ head: ListNode?) -> Int {
    var result = 0, head = head

    while head != nil {
      if head!.val == 1 {
        result += 1
      }
      result *= 2
      head = head?.next
    }

    return result / 2
  }
}
