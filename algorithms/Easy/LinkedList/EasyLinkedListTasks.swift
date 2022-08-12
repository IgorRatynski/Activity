//
//  EasyLinkedListTasks.swift
//  Easy
//
//  Created by Igor Ratynski on 17.07.2022.
//

import Foundation

// MARK: - Delete duplicates
extension Solution.Easy {
  static func deleteDuplicates(_ head: ListNode?) -> ListNode? {
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
  
  static func testDeleteDuplicates() {
    //let a = ListNode(0, ListNode(0, ListNode(1, ListNode(1, ListNode(1)))))
    //let a = ListNode(1, ListNode(1, ListNode(1, ListNode(1, ListNode(1)))))
    let a =  ListNode(0, ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(3))))))
    var result: ListNode? = deleteDuplicates(a)

    while result != nil {
     print("result: \(result!.val)")
      result = result?.next
    }
  }
}

// MARK: Reverse list
extension Solution.Easy {
  static func reverseList(_ head: ListNode?) -> ListNode? {
    let result = head
    var head = head
    var array: [Int] = []
    
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
  
  static func testReverseList() {
    let a =  ListNode(0, ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(3))))))
    var result: ListNode? = Solution.Easy.reverseList(a)

    while result != nil {
     print("result: \(result!.val)")
      result = result?.next
    }
  }
}

// MARK: Reverse list
extension Solution.Easy {
  static func isPalindrome(_ head: ListNode?) -> Bool {
    var head = head
    var array: [Int] = []
    
    while head != nil {
      array.append(head!.val)
      head = head?.next
    }
    
    let max = array.count - 1
    for (index, value) in array.enumerated() {
      if array[index] != array[max - index] {
        return false
      }
    }
    
    return true
  }
  
  static func testIsPalindrome() {
    let a =  ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(2, ListNode(1))))))
    
     print("result: \(Solution.Easy.isPalindrome(a))")
  }
}
