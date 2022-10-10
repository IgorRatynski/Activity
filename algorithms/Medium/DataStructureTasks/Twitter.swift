//
//  Twitter.swift
//  Medium
//
//  Created by Igor Ratynski on 10.10.2022.
//

import Foundation

// MARK: 355. Design Twitter
extension Solution.Medium {
  class Twitter {
    
    private typealias UserId = Int
    private typealias NewsId = Int
    private typealias TwitterId = Int
    
    // MARK: Properties
    private var news: [UserId:[NewsId:TwitterId]] = [:]
    private var follows: [UserId:[UserId]] = [:]
    private var newsId = 0
    
    // MARK: Functions
    func postTweet(_ userId: Int, _ tweetId: Int) {
      if news[userId] == nil {
        news[userId] = [newsId:tweetId]
      } else {
        news[userId]?[newsId] = tweetId
      }
      newsId += 1
    }
    
    func getNewsFeed(_ userId: Int) -> [Int] {
      var userNews = news[userId] ?? [:]
      follows[userId]?.forEach {
        news[$0]?.forEach { userNews[$0.key] = $0.value }
      }
      let dropCount = userNews.count > 10 ? userNews.count  - 10 : 0
      return userNews.sorted { $0.key > $1.key }.map { $0.value }.dropLast(dropCount)
    }
    
    func follow(_ followerId: Int, _ followeeId: Int) {
      if follows[followerId] == nil {
        follows[followerId] = [followeeId]
      } else {
        follows[followerId]!.append(followeeId)
      }
    }
    
    func unfollow(_ followerId: Int, _ followeeId: Int) {
      guard let index = follows[followerId]?.firstIndex(where: { $0 == followeeId } ) else { return }
      follows[followerId]?.remove(at: index)
    }
  }
}
