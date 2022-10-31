import XCTest
@testable import SimpleLinkedListModule

final class SimpleLinkedListValueSemanticsTests: XCTestCase {
    func test_listValueSemantic() {
        var list1 = SimpleLinkedList<Int>()
        list1.append(1)
        list1.append(2)
        XCTAssertTrue(isKnownUniquelyReferenced(&list1._head))
        
        var list2 = list1
        XCTAssertFalse(isKnownUniquelyReferenced(&list1._head))
        XCTAssertFalse(isKnownUniquelyReferenced(&list2._head))
        XCTAssertEqual(list1.count, 2)
        XCTAssertEqual(list2.count, 2)
        XCTAssertEqual(list1.first, 1)
        XCTAssertEqual(list2.first, 1)
        XCTAssertEqual(list1.last, 2)
        XCTAssertEqual(list2.last, 2)
        
        // Force copy-on-write
        list2.append(3)
        XCTAssertTrue(isKnownUniquelyReferenced(&list1._head))
        XCTAssertTrue(isKnownUniquelyReferenced(&list2._head))
        XCTAssertEqual(list1.count, 2)
        XCTAssertEqual(list2.count, 3)
        XCTAssertEqual(list1.first, 1)
        XCTAssertEqual(list2.first, 1)
        XCTAssertEqual(list1.last, 2)
        XCTAssertEqual(list2.last, 3)
    }
    
    func test_pushValueSemantics() {
        var list1 = SimpleLinkedList(Array(1...3))
        var list2 = list1
        XCTAssertFalse(isKnownUniquelyReferenced(&list1._head))
        XCTAssertFalse(isKnownUniquelyReferenced(&list2._head))
        
        list2.push(0)
        XCTAssertEqual(list2.first, 0)
        XCTAssertEqual(list2.count, 4)
        
        list1.push(100)
        XCTAssertEqual(list1.first, 100)
        XCTAssertEqual(list1.count, 4)
    }
    
    func test_popValueSemantics() {
        var list1 = SimpleLinkedList(Array(1...3))
        var list2 = list1
        XCTAssertFalse(isKnownUniquelyReferenced(&list1._head))
        XCTAssertFalse(isKnownUniquelyReferenced(&list2._head))
        
        list2.pop()
        XCTAssertEqual(list2.first, 2)
        XCTAssertEqual(list2.count, 2)
        XCTAssertEqual(list1.first, 1)
        XCTAssertEqual(list1.count, 3)
    }
    
    func test_appendValueSemantics() {
        var list1 = SimpleLinkedList(Array(1...3))
        var list2 = list1
        XCTAssertFalse(isKnownUniquelyReferenced(&list1._head))
        XCTAssertFalse(isKnownUniquelyReferenced(&list2._head))
        XCTAssertEqual(list1.count, 3)
        XCTAssertEqual(list2.count, 3)
        
        list2.append(4)
        XCTAssertTrue(isKnownUniquelyReferenced(&list1._head))
        XCTAssertTrue(isKnownUniquelyReferenced(&list2._head))
        XCTAssertEqual(list1.count, 3)
        XCTAssertEqual(list2.count, 4)
    }
    
    func test_removeLastValueSemantics() {
        var list1 = SimpleLinkedList(Array(1...3))
        var list2 = list1
        XCTAssertFalse(isKnownUniquelyReferenced(&list1._head))
        XCTAssertFalse(isKnownUniquelyReferenced(&list2._head))
        XCTAssertEqual(list1.count, 3)
        XCTAssertEqual(list2.count, 3)
        
        list2.removeLast()
        XCTAssertTrue(isKnownUniquelyReferenced(&list1._head))
        XCTAssertTrue(isKnownUniquelyReferenced(&list2._head))
        XCTAssertEqual(list1.count, 3)
        XCTAssertEqual(list2.count, 2)
    }

    func test_insertValueSemantics() {
        var list1 = SimpleLinkedList(Array(1...3))
        var list2 = list1
        XCTAssertFalse(isKnownUniquelyReferenced(&list1._head))
        XCTAssertFalse(isKnownUniquelyReferenced(&list2._head))
        XCTAssertEqual(list1.count, 3)
        XCTAssertEqual(list2.count, 3)
        
        list2.insert(20, after: 1)
        XCTAssertTrue(isKnownUniquelyReferenced(&list1._head))
        XCTAssertTrue(isKnownUniquelyReferenced(&list2._head))
        XCTAssertEqual(list1.count, 3)
        XCTAssertEqual(list2.count, 4)
    }
    
    func test_removeValueSemantics() {
        var list1 = SimpleLinkedList(Array(1...3))
        var list2 = list1
        XCTAssertFalse(isKnownUniquelyReferenced(&list1._head))
        XCTAssertFalse(isKnownUniquelyReferenced(&list2._head))
        XCTAssertEqual(list1.count, 3)
        XCTAssertEqual(list2.count, 3)
        
        list2.remove(after: 0)
        XCTAssertTrue(isKnownUniquelyReferenced(&list1._head))
        XCTAssertTrue(isKnownUniquelyReferenced(&list2._head))
        XCTAssertEqual(list1.count, 3)
        XCTAssertEqual(list2.count, 2)
    }
    
    func test_removeAllValueSemantics() {
        var list1 = SimpleLinkedList(Array(1...3))
        var list2 = list1
        XCTAssertFalse(isKnownUniquelyReferenced(&list1._head))
        XCTAssertFalse(isKnownUniquelyReferenced(&list2._head))
       
        list2.removeAll()
        XCTAssertEqual(list1.count, 3)
        XCTAssertTrue(list2.isEmpty)
    }
    
}
