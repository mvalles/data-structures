import XCTest
@testable import StackModule

final class StackTests: XCTestCase {
    // MARK: - Computed instance properties
    func test_isEmpty() {
        var stack = Stack<Int>()
        XCTAssertTrue(stack.isEmpty)
        
        stack.push(42)
        XCTAssertFalse(stack.isEmpty)
        
        stack.pop()
        XCTAssertTrue(stack.isEmpty)
    }
    
    func test_count() {
        var stack = Stack<Int>()
        XCTAssertEqual(stack.count, 0)
        
        stack.push(20)
        XCTAssertEqual(stack.count, 1)
        
        stack.push(40)
        XCTAssertEqual(stack.count, 2)
        
        stack.pop()
        XCTAssertEqual(stack.count, 1)
    }
    
    // MARK: - push,pop and peek methods
    func test_push() {
        var stack = Stack<Int>()
        XCTAssertEqual(stack.count, 0)
        
        stack.push(42)
        XCTAssertEqual(stack.count, 1)
    }
    
    func test_pop() {
        var stack = Stack<Int>()
        XCTAssertNil(stack.pop())
        
        stack.push(5)
        XCTAssertEqual(stack.pop(), 5)
       
        stack.push(12)
        stack.push(42)
        XCTAssertEqual(stack.pop(), 42)
        XCTAssertEqual(stack.pop(), 12)
        XCTAssertEqual(stack.count, 0)
        XCTAssertTrue(stack.isEmpty)
    }
    
    func test_peek() {
        var stack = Stack<Int>()
        XCTAssertNil(stack.peek())
        
        stack.push(42)
        stack.push(12)
        stack.push(21)
        stack.push(24)
        XCTAssertEqual(stack.count, 4)
        XCTAssertEqual(stack.peek(), 24)
        XCTAssertEqual(stack.peek(), 24)
        stack.pop()
        XCTAssertEqual(stack.peek(), 21)
        XCTAssertEqual(stack.peek(), 21)
        XCTAssertEqual(stack.count, 3)
    }
    
    // MARK: - Initializers

    func test_initializer_fromCollection() {
        var stack = Stack(Array(1...20))
        XCTAssertEqual(stack.peek(), 20)

        for number in stride(from: 20, through: 1, by: -1) {
            XCTAssertEqual(stack.pop(), number)
        }
        XCTAssertTrue(stack.isEmpty)
    }

    func test_initializer_fromSequence() {
        let stack = Stack((1...).prefix(20))
        XCTAssertEqual(stack.count, 20)
    }
    
    func test_initializer_fromArrayLiteral() {
        var stack: Stack = [1, 3, 5, 7, 9]
        XCTAssertEqual(stack.count, 5)
        
        for number in stride(from: 9, through: 1, by: -2) {
            XCTAssertEqual(stack.pop(), number)
        }
    }
}
