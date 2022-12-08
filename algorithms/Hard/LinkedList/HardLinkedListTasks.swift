//
//  HardLinkedListTasks.swift
//  Algorithms
//
//  Created by Igor Ratynski on 08.12.2022.
//

import Foundation

extension Solution.Hard {
  func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    let lists = lists.compactMap { $0 }
    guard lists.count > 0 else { return nil }
    var head: ListNode?, map: [Int:Int] = [:], index = 0
    
    for list in lists {
      head?.next = list
      head = list
      
      while head?.next != nil {
        map[head!.val] = (map[head!.val] ?? 0) + 1
        head = head?.next
      }
      
      map[head!.val] = (map[head!.val] ?? 0) + 1
    }
    
    let sorted = map.sorted { $0.key < $1.key }
    
    head = lists[0]
    
    while head != nil {
      for _ in 0..<sorted[index].value {
        head!.val = sorted[index].key
        head = head?.next
      }
      index += 1
    }
    
    return lists[0]
  }
}
