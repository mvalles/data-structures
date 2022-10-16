import XCTest
@testable import SimpleLinkedListModule

final class SimpleLinkedListTests: XCTestCase {
    // MARK: - Computed instance properties
    func test_isEmpty() {
        let list = SimpleLinkedList<Int>()
        XCTAssertTrue(list.isEmpty)
        XCTAssertNil(list.first)
        XCTAssertNil(list.last)
        XCTAssertEqual(list.size, 0)
    }
    
    func test_size() {
        var list = SimpleLinkedList<Int>()
        XCTAssertEqual(list.size, 0)
        list.push(1)
        XCTAssertEqual(list.size, 1)
    }
    
    func test_first() {
        var list = SimpleLinkedList<Int>()
        
        list.append(30)
        list.append(40)
        XCTAssertEqual(list.first, 30)
        
        list.push(20)
        list.push(10)
        XCTAssertEqual(list.first, 10)
    }

    func test_last() {
        var list = SimpleLinkedList<Int>()
        
        list.push(20)
        list.push(10)
        XCTAssertEqual(list.last, 20)
        list.append(30)
        list.append(40)
        XCTAssertEqual(list.last, 40)
    }
}
