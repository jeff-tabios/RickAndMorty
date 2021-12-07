//
//  RMTests.swift
//  RMTests
//
//  Created by Jeffrey Tabios on 11/2/21.
//

import XCTest
import Combine
@testable import RM

class RMTests: XCTestCase {
    var sut: CharsViewModel?
    
    override func setUp() {
        sut = CharsViewModel(service: MockCharsService())
    }
    
    func test_getCharsShouldGet20Chars() {
        let expectation = self.expectation(description: "Get Chars")
        
        sut?.getCharacters {
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertEqual(self.sut?.chars?.results.count, 20)
    }

}

class MockCharsService: CharsServiceProtocol {
    
    let charInfo = Info(count: 1, pages: 12, next: "12", prev: nil)
    let char = CharResult(id: 1, name: "Morty", status: .alive, species: .human, type: "male", gender: .male, origin: Location(name: "Earth", url: "http://earrth.com"), location: Location(name: "Earth", url: "http://earrth.com"), image: "http://asdasd", episode: ["Wakadoo"], url: "http://whocares.co", created: "12-12-21")
    
    func getCharacters() -> Future<RMCharacters, Error> {
        return Future { promise in
            let chars = RMCharacters(info: self.charInfo,
                                     results: [self.char,
                                               self.char,
                                               self.char,
                                               self.char,
                                               self.char,
                                               self.char,
                                               self.char,
                                               self.char,
                                               self.char,
                                               self.char,
                                               self.char,
                                               self.char,
                                               self.char,
                                               self.char,
                                               self.char,
                                               self.char,
                                               self.char,
                                               self.char,
                                               self.char,
                                               self.char])
            
            promise(.success(chars))
        }
    }
}
