import XCTest
@testable import SimpleLinkedListModule

final class SimpleLinkedListDeletionsTests: XCTestCase {
    // MARK: - pop, removeLast, remove(at:) and removeAll
    func test_pop() {
        var list = SimpleLinkedList<Int>()
        // empty list ( head = tail = nil )
        XCTAssertNil(list.pop())
        
        // one element list ( head = tail = value<10> )
        list.push(10)
        XCTAssertEqual(list.pop(), 10)
        XCTAssertTrue(list.isEmpty)
        XCTAssertNil(list._tail)
        XCTAssertEqual(list._size, 0)
        
        // two elements list ( head = value<10>, tail = value<20> )
        list.push(10)
        list.push(20)
        XCTAssertEqual(list.pop(), 20)
        XCTAssertFalse(list.isEmpty)
        XCTAssertNotNil(list._tail)
        XCTAssertEqual(list._size, 1)
        
        // three elements list
        list.push(20)
        list.push(30)
        XCTAssertEqual(list.pop(), 30)
        XCTAssertFalse(list.isEmpty)
        XCTAssertNotNil(list._tail)
        XCTAssertEqual(list._size, 2)
    }
    
    func test_removeLast() {
        var list = SimpleLinkedList<Int>()
        // empty list ( head = tail = nil )
        XCTAssertNil(list.removeLast())
        
        // one element list ( head = tail = value<10> )
        list.push(10)
        XCTAssertEqual(list.removeLast(), 10)
        XCTAssertTrue(list.isEmpty)
        XCTAssertNil(list._tail)
        XCTAssertEqual(list._size, 0)

        // two elements list ( head = value<10>, tail = value<20> )
        list.push(20)
        list.push(10)
        XCTAssertEqual(list.removeLast(), 20)
        XCTAssertFalse(list.isEmpty)
        XCTAssertNotNil(list._tail)
        XCTAssertEqual(list._size, 1)

        // three elements list
        list.append(20)
        list.append(30)
        XCTAssertEqual(list.removeLast(), 30)
        XCTAssertFalse(list.isEmpty)
        XCTAssertNotNil(list._tail)
        XCTAssertEqual(list._size, 2)
    }
    
    func test_removeAfter() {
        var list = SimpleLinkedList<Int>()
        XCTAssertNil(list.remove(after: -1))
        // empty list ( head = tail = nil )
        XCTAssertNil(list.remove(after: 0))
        
        // one element list ( head = tail = value<10> )
        list.push(10)
        XCTAssertNil(list.remove(after: 0))
        XCTAssertNil(list.remove(after: 1))
        
        // two elements list ( head = value<10>, tail = value<20> )
        list.append(20)
        XCTAssertNil(list.remove(after: 1))
        XCTAssertEqual(list.remove(after: 0), 20)
        
        // three elements list
        list.append(20)
        list.append(30)
        XCTAssertEqual(list.remove(after: 1), 30)
        list.append(30)
        XCTAssertEqual(list.remove(after: 0), 20)
    }
    
    func test_removeAll() {
        var list = SimpleLinkedList<Int>()
        
        for value in (1...10) {
            list.push(value)
        }
        XCTAssertEqual(list.size, 10)
        list.removeAll()
        XCTAssertEqual(list.size, 0)
        XCTAssertTrue(list.isEmpty)
    }
}
