//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Jigneshkumar Patil on 2022/05/18.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}
protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
