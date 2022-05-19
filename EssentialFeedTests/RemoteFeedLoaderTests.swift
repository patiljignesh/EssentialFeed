//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Jigneshkumar Patil on 2022/05/19.
//

import XCTest

class RemoteFeedLoaderTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    class RemoteFeedLoader {
        
    }
    
    class HTTPClient {
        var requestURL: URL?
    }

    //Case: RemoteFeedLoader does not request data upon creation
    class RemoteFeedLoaderTests: XCTestCase {
        func test_init() {
            let client = HTTPClient()
            _ = RemoteFeedLoader() //System Under Test
            
            XCTAssertNil(client.requestURL)
        }
    }

}
