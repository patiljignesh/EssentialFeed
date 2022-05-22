//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Jigneshkumar Patil on 2022/05/19.
//

import XCTest

class RemoteFeedLoader {
    
    let client: HTTPClient
    
    init(client:HTTPClient){
        self.client = client
    }
    
    func load(){
        client.get(from: URL(string: "https://www.something.com")!)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    
    func get(from url: URL){
        requestURL = url
    }
    var requestURL: URL?
}


//Case: RemoteFeedLoader does not request data upon creation
class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client) //System Under Test
        
        XCTAssertNil(client.requestURL)
    }
    
    func test_load_requestDataFromURL(){
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)
        
        sut.load()
        
        XCTAssertNotNil(client.requestURL)
    }
}


