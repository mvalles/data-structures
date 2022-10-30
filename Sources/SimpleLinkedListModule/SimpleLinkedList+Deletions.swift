
//
// MARK: - Add values: pop, removeLast, remove(after:) and removeAll
extension SimpleLinkedList {
    /// Remove a `value` at the front of the List
    ///
    /// - Returns: The `value` or nil if list `isEmpty`
    /// - Complexity: O(1)
    @discardableResult
    @inlinable
    public mutating func pop() -> Value? {
        guard !isEmpty else { return nil }
        defer {
            _head = _head?._next
            _size -= 1
            if isEmpty {
                _tail = nil
                _size = 0
            }
        }
        return _head?._value
    }
    
    /// Remove  a `value` at the end of the List or `nil` if `isEmpty`
    ///
    /// - Returns: The `value` or nil if list `isEmpty`
    /// - Complexity: O(n-2)
    @discardableResult
    @inlinable
    public mutating func removeLast() -> Value? {
        copyNodes()
        guard !isEmpty else { return nil }
        guard _size != 1 else { return pop() }
        defer {
            let previousNode = node(at: _size - 2)
            previousNode?._next = _tail?._next
            _tail = previousNode
            _size -= 1
        }
        return _tail?._value
    }

    /// Remove the element after an index position of the List from head.
    /// - Parameters:
    ///     - after: 0-indexed position in the Linked List.  `after` must be a valid index of the Linked List or equal to its size-1 property.
    /// - Returns:`true` if the `value` is removed or `false` if index out-of bounds.
    /// - Complexity: O(`index-2`) when calling node(at:). O(1) otherwise
    @discardableResult
    @inlinable
    public mutating func remove(after: Int) -> Value? {
        copyNodes()
        guard after >= 0 && after <= _size - 2 && _size > 1 else { return nil }
        
        let previousNode = node(at: after)
        let value = previousNode!._next!._value
        if previousNode!._next === _tail {
            _tail = previousNode
        }
        previousNode!._next = previousNode!._next!._next
        _size -= 1
        return value
    }
    
    /// Delete all elements of SimpleLinkedList
    @inlinable
    public mutating func removeAll() {
        _head = nil
        _tail = nil
        _size = 0
    }
}


