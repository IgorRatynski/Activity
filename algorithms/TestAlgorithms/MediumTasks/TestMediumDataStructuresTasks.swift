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
    var twitter: Solution.Medium.Twitter
    let actions: [[TwitterActions]] = [
      [.postTweet(byUser: 1, tweetId: 5), .postTweet(byUser: 1, tweetId: 3), .getNewsFeed(of: 1)],
      [.postTweet(byUser: 1, tweetId: 5), .getNewsFeed(of: 1), .follow(user: 1, folowee: 2), .postTweet(byUser: 2, tweetId: 6), .getNewsFeed(of: 1), .unfollow(user: 1, followee: 2), .getNewsFeed(of: 1)],
      [.postTweet(byUser: 1, tweetId: 5), .postTweet(byUser: 1, tweetId: 3), .postTweet(byUser: 1, tweetId: 101), .postTweet(byUser: 1, tweetId: 13), .postTweet(byUser: 1, tweetId: 10), .postTweet(byUser: 1, tweetId: 2), .postTweet(byUser: 1, tweetId: 94), .postTweet(byUser: 1, tweetId: 505), .postTweet(byUser: 1, tweetId: 333), .postTweet(byUser: 1, tweetId: 22), .postTweet(byUser: 1, tweetId: 11), .getNewsFeed(of: 1)]
    ]
    let outputs = [
      [[],[],[3,5]],
      [[],[5],[],[],[6,5],[],[5]],
      [[],[],[],[],[],[],[],[],[],[],[],[11,22,333,505,94,2,10,13,101,3]]
    ]
    
    let set = Set([actions.count, outputs.count])
    XCTAssertTrue(set.count == 1)
    
    for i in 0..<set.first! {
    twitter = Solution.Medium.Twitter()
      for (index, action) in actions[i].enumerated() {
        switch action {
          case .postTweet(byUser: let user, tweetId: let tweetId):
            twitter.postTweet(user, tweetId)
          case .follow(user: let user, folowee: let folowee):
            twitter.follow(user, folowee)
          case .unfollow(user: let user, followee: let folowee):
            twitter.unfollow(user, folowee)
          case .getNewsFeed(of: let user):
            XCTAssertEqual(twitter.getNewsFeed(user), outputs[i][index])
        }
      }
    }
  }
}
