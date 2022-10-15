///
/// A [Simple Linked List](https://en.wikipedia.org/wiki/Linked_list) data structure.
///
/// This introduced a ´SimpleLinkedList´ as a collection of values arranged in a linear and unidirectional sequence.
/// This has some advantages over contiguous storage options like ´Array´:
/// - Constant time insertions and removal from the front of the list
/// - No need to allocate initial space or resize when the array is filled

@frozen
public struct SimpleLinkedList<Value> {
    @usableFromInline
    internal typealias _Node = SimpleLinkedListNode<Value>
    
    @usableFromInline
    internal var _head: _Node?
    
    @usableFromInline
    internal var _tail: _Node?
    
    @usableFromInline
    internal var _size: Int = 0
    
    @inlinable
    public init() {}
    
}

// MARK: - Computed instance properties
extension SimpleLinkedList {
    /// Return first `Value` of the `SimpleLinkedList` or `nil` if the list is empty.
    ///
    /// - Complexity: O(1)
    @inlinable @inline(__always)
    public var first: Value? { _head?._value }
    
    /// Return last `Value` of the `SimpleLinkedList` or `nil` if the list is empty.
    ///
    /// - Complexity: O(1)
    @inlinable @inline(__always)
    public var last: Value? { _tail?._value }
    
    /// The number of elements in the `SimpleLinkedList`.
    ///
    /// - Complexity: O(1)
    @inlinable @inline(__always)
    public var size: Int { _size }
    
    /// A Boolean value indicating whether or not the heap is empty.
    ///
    /// - Complexity: O(1)
    @inlinable @inline(__always)
    public var isEmpty: Bool {
        _head == nil
    }
}

// MARK: - CustomDebugStringConvertible representation of Stack types for debugging

extension SimpleLinkedList: CustomStringConvertible {
    public var description: String {
        guard let _head = _head else {
            return "Empty list"
        }
        return String(describing: _head)
    }
}
