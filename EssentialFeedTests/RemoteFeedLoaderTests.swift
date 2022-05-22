//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Jigneshkumar Patil on 2022/05/19.
//

import XCTest

class RemoteFeedLoader {
    
    let client: HTTPClient
    let url : URL
    
    init(url: URL,client:HTTPClient){
        self.client = client
        self.url = url
    }
    
    func load(){
        client.get(from: url)
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
        let url = URL(string: "https://www.givenurl123.com")!
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(url: url,client: client) //System Under Test
        
        XCTAssertNil(client.requestURL)
    }
    
    func test_load_requestDataFromURL(){
        let url = URL(string: "https://www.givenurl.com")!
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url,client: client)
        
        sut.load()
        
        XCTAssertEqual(client.requestURL, url)
    }
}


