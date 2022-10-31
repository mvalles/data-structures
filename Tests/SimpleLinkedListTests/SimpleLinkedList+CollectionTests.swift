import XCTest
@testable import SimpleLinkedListModule

final class SimpleLinkedListCollectionTests: XCTestCase {
    
    func test_startIndex() {
        var list = SimpleLinkedList<Int>()
        
        // startIndex on empty list is nill
        var index = list.startIndex
        XCTAssertNil(list[index])
        
        // SimpleLinkedList with one node
        list.push(10)
        index = list.startIndex
        XCTAssertEqual(list[index], 10)
        
        // SimpleLinkedList with two nodes
        list.append(20)
        index = list.startIndex
        XCTAssertEqual(list[index], 10)
    }
    
    func test_endIndex() {
        var list = SimpleLinkedList<Int>()
        
        // endIndex on empty list is nil
        var index = list.endIndex
        XCTAssertNil(list[index])
        
        // SimpleLinkedList with one node
        list.push(10)
        index = list.endIndex
        XCTAssertNil(list[index])
    }
    
    func test_index() {
        var list = SimpleLinkedList<Int>()
        
        // Index after startIndex in empty list is startIndex
        var index = list.index(after: list.startIndex)
        XCTAssertEqual(index, list.startIndex)
        
        // Index after endIndex is endIndex in empty list
        index = list.index(after: list.endIndex)
        XCTAssertEqual(index, list.endIndex)
        
        // SimpleLinkedList with one node
        list.push(10)
        index = list.index(after: list.startIndex)
        XCTAssertEqual(index, list.endIndex)
        index = list.index(after: list.endIndex)
        XCTAssertEqual(index, list.endIndex)
    }
    
    func test_indexWithOffset() {
        let list: SimpleLinkedList<Int> = [1, 2, 3, 4, 5]
        let index = list.index(list.startIndex, offsetBy: 2)
        let value = list[index]
        
        XCTAssertTrue(value == 3)
    }
    
    func test_traversingCollectionByPosition() {
        let list = SimpleLinkedList(Array(0...9))
        var value = 0
        for index in list.indices {
            XCTAssertEqual(list[index], value)
            value += 1
        }
    }
    
    func test_traversingCollectionByIterator() {
        let list = SimpleLinkedList(Array(0...9))
        var value = 0
        for number in list {
            XCTAssertEqual(number, value)
            value += 1
        }
    }
    
    func test_sliceCollectionbyRangedSubscript() {
        let list = SimpleLinkedList(Array(0...9))
        
        let firstFourIndex = list.firstIndex(of: 4)
        let firstFour = list[..<firstFourIndex!]
        XCTAssertEqual(firstFour.count, 4)
        
        var value = 0
        for val in firstFour {
            XCTAssertEqual(val!, value)
            value += 1
        }
    }
    
    func test_SliceCollectionByPrefix() {
        let list = SimpleLinkedList(Array(0...9))
        let firstFour = list.prefix(while: { $0 != 4 })
        XCTAssertEqual(firstFour.count, 4)
        var value = 0
        for val in firstFour {
            XCTAssertEqual(val!, value)
            value += 1
        }
    }
    
}
