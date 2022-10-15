
//
// MARK: - Add values: push, append and insert
extension SimpleLinkedList {
    /// Inserts the given element at the front of the List (head-first insertion)
    ///
    /// - Complexity: O(1)
    @inlinable
    public mutating func push(_ value: Value) {
        _head = SimpleLinkedListNode(value: value, next: _head)
        _size += 1
        if _tail == nil {
            _tail = _head
        }
    }
    
    /// Inserts the given element at the end of the List (tail-end insertion)
    ///
    /// - Complexity: O(1)
    @inlinable
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        _tail!._next = SimpleLinkedListNode(value: value)
        _tail = _tail!._next
        _size += 1
    }
    
    /// Find the element at the index position of the List from head.
    /// Empty list or out-of-bound index will result in `nil` return.
    /// - Parameters:
    ///     - at: 0-indexed position of the `Node` to find
    /// - Returns: The `Node` at ìndex` position`
    /// - Complexity: O(`index-2`)
    @usableFromInline
    internal func node(at index: Int) -> SimpleLinkedListNode<Value>? {
        guard index <= _size - 1 && !isEmpty else { return nil }
        
        if index == 0 {
            return _head
        } else if index == _size - 1 {
            return _tail
        } else {
            var currentNode = _head!._next
            var currentIndex = 1
            
            while currentIndex < index {
                currentNode = currentNode!._next
                currentIndex += 1
            }
            return currentNode
        }
    }
    
    /// Insert the element after an index position of the List from head.
    /// - Parameters:
    ///     - value: the `value` to insert
    ///     - after: 0-indexed position in the Linked List.  `after` must be a valid index of the Linked List or equal to its size-1 property.
    /// - Returns:`true` if the `value` is inserted of `false` if index out-of bounds.
    /// - Complexity: O(`index-2`) when calling node(at:). O(1) otherwise
    @discardableResult
    @inlinable
    public mutating func insert(_ value: Value, after index: Int) -> Bool {
        guard index <= _size - 1 || (isEmpty && index == 0) else { return false }
        
        if index == 0 && isEmpty {
            push(value)
            return true
        } else if index == _size - 1 {
            append(value)
            return true
        } else {
            if let currentNode = node(at: index) {
                let newNode = SimpleLinkedListNode(value: value, next: currentNode._next)
                currentNode._next = newNode
                _size += 1
                return true
            } else {
                return false
            }
        }
    }
    
}


