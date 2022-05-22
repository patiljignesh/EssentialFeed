//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Jigneshkumar Patil on 2022/05/19.
//

import XCTest

class RemoteFeedLoader {
    
    func load(){
        HTTPClient.shared.get(from: URL(string: "https://www.something.com")!)
    }
}

class HTTPClient {
    
    static var shared = HTTPClient()
    
    func get(from url: URL){}
}

class HTTPClientSpy: HTTPClient {
    
    override func get(from url: URL){
        requestURL = url
    }
    var requestURL: URL?
}


//Case: RemoteFeedLoader does not request data upon creation
class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader() //System Under Test
        
        XCTAssertNil(client.requestURL)
    }
    
    func test_load_requestDataFromURL(){
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestURL)
    }
}


