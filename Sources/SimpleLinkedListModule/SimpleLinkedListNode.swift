//
//
//
extension SimpleLinkedList {
    @usableFromInline
    internal class SimpleLinkedListNode<Value> {
        @usableFromInline
        internal var _value: Value
        
        @usableFromInline
        internal var _next: SimpleLinkedListNode?
        
        @inlinable
        internal init(value: Value, next: SimpleLinkedListNode? = nil) {
            self._value = value
            self._next = next
        }
        
        @inlinable
        deinit {
            print("Deallocating value \(_value).")
        }
    }
}

extension SimpleLinkedList.SimpleLinkedListNode: CustomStringConvertible {
    @usableFromInline
    internal var description: String {
        guard let _next = _next else {
            return "\(_value)"
        }
        return "\(_value) -> " + String(describing: _next) + " "
    }
}
