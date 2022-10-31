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

// MARK: - Initilize SimpleLinkedList from Sequence

extension SimpleLinkedList {
    /// Initializes a SimpleLinkedList from a sequence.
    ///
    @inlinable
    public init<S: Sequence>(_ elements: S) where S.Element == Value {
        for element in elements {
            append(element)
        }
    }
}

// MARK: - ExpressibleByArrayLiteral makes SimpleLinkedList initializable from an array literal
extension SimpleLinkedList: ExpressibleByArrayLiteral {
    /// Creates a new SimpleLinkedList from the contents of an array literal.
    ///
    /// **Do not call this initializer directly.** It is used by the compiler when
    /// you use an array literal. Instead, create a new SimpleLinkedList using an array
    /// literal as its value by enclosing a comma-separated list of values in
    /// square brackets. You can use an array literal anywhere a SimpleLinkedList is expected
    /// by the type context.
    ///
    /// - Parameter elements: A variadic list of elements of the new SimpleLinkedList.
    public init(arrayLiteral elements: Value...) {
        self.init(elements)
    }
}

// MARK: - Value Semantics
extension SimpleLinkedList {
    @inlinable
    internal mutating func copyNodes() {
        guard !isKnownUniquelyReferenced(&_head) else {
            return
        }
        guard var oldNode = _head else {
            return
        }
        _head = SimpleLinkedListNode(value: oldNode._value)
        var newNode = _head
        while let nextOldNode = oldNode._next {
            newNode!._next = SimpleLinkedListNode(value: nextOldNode._value)
            newNode = newNode!._next
            oldNode = nextOldNode
        }
        _tail = newNode
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
