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
    
    // MARK: - push,append and insert methods
    func test_push() {
        var list = SimpleLinkedList<Int>()
        XCTAssertEqual(list.size, 0)
        list.push(1)
        XCTAssertEqual(list.size, 1)
        list.push(2)
        XCTAssertEqual(list.size, 2)
    }
    
    func test_append() {
        var list = SimpleLinkedList<Int>()
        XCTAssertEqual(list.size, 0)
        list.append(1)
        XCTAssertEqual(list.size, 1)
        list.append(2)
        XCTAssertEqual(list.size, 2)
    }
    
    func test_nodeat() {
        var list = SimpleLinkedList<Int>()
        XCTAssertNil(list.node(at: 0))   // Empty list
        XCTAssertNil(list.node(at: 10))  // Out-of-bound `index`
        list.append(10)
        XCTAssertEqual(list.node(at: 0)!._value, 10)
        list.append(20)
        XCTAssertEqual(list.node(at: 1)!._value, 20)
        list.append(30)
        list.append(40)
        list.append(50)
        XCTAssertEqual(list.node(at: 1)!._value, 20)
        XCTAssertEqual(list.node(at: 2)!._value, 30)
        XCTAssertEqual(list.node(at: 3)!._value, 40)
    }
    func test_insert() {
        var list = SimpleLinkedList<Int>()
        XCTAssertFalse(list.insert(10, after: 1))
        
        XCTAssertTrue(list.insert(10, after: 0))    // 10
        XCTAssertEqual(list.node(at: 0)!._value, 10)
        XCTAssertFalse(list.insert(10, after: 1))
        
        XCTAssertTrue(list.insert(20, after: 0))    // 10 -> 20
        XCTAssertTrue(list.insert(30, after: 1))    // 10 -> 20 -> 30
        
        XCTAssertEqual(list.node(at: 1)!._value, 20)
        XCTAssertEqual(list.node(at: 2)!._value, 30)
        
        XCTAssertTrue(list.insert(11, after: 0))    // 10 -> 11 -> 20 -> 30
        XCTAssertTrue(list.insert(21, after: 2))    // 10 -> 11 -> 20 -> 21 -> 30
        XCTAssertEqual(list.node(at: 1)!._value, 11)
        XCTAssertEqual(list.node(at: 3)!._value, 21)
    }
    
}
