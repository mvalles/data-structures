//
//
//
extension SimpleLinkedList {
    public class Node<Value> {
        @usableFromInline
        internal var _value: Value
        
        @usableFromInline
        internal var _next: Node?
        
        @inlinable
        public init(value: Value, next: Node? = nil) {
            self._value = value
            self._next = next
        }
    }
}

extension SimpleLinkedList.Node: CustomStringConvertible {
    public var description: String {
        guard let _next = _next else {
            return "\(_value)"
        }
        return "\(_value) -> " + String(describing: _next) + " "
    }
}
