//
//  TestMediumDataStructuresTasks.swift
//  TestAlgorithms
//
//  Created by Igor Ratynski on 10.10.2022.
//

import XCTest

class TestMediumDataStructuresTasks: MediumTestCase { }

// MARK: 355. Design Twitter
extension TestEasyDataStructureTasks {
  
  private enum TwitterActions {
    case postTweet(byUser: Int, tweetId: Int)
    case follow(user: Int, folowee: Int)
    case unfollow(user: Int, followee: Int)
    case getNewsFeed(of: Int)
  }
  
  func testTwitter() {
    let twitter = Solution.Medium.Twitter()
    let inputs = [[1,5],[1,3],[1]]
    let actions: [TwitterActions] = [.postTweet(byUser: 1, tweetId: 5), .postTweet(byUser: 1, tweetId: 3),
                                     .getNewsFeed(of: 1)]
    let outputs = [[],[],[3,5]]
    
    let set = Set([inputs.count, actions.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
      switch actions[i] {
        case .postTweet(byUser: let user, tweetId: let tweetId):
          twitter.postTweet(user, tweetId)
        case .follow(user: let user, folowee: let folowee):
          twitter.follow(user, folowee)
        case .unfollow(user: let user, followee: let folowee):
          twitter.unfollow(user, folowee)
        case .getNewsFeed(of: let user):
          XCTAssertEqual(twitter.getNewsFeed(user), outputs[i])
      }
    }
  }
}
