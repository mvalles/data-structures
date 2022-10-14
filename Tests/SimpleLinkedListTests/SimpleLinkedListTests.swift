import XCTest
@testable import SimpleLinkedListModule

final class SimpleLinkedListTests: XCTestCase {
    // MARK: - Computed instance properties
    func test_isEmpty() {
        let list = SimpleLinkedList<Int>()
        XCTAssertTrue(list.isEmpty)
        XCTAssertNil(list.first)
        XCTAssertEqual(list.size, 0)
    }
}
