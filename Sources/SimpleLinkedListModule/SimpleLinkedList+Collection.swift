
//
// MARK: - Add Collection protocol conformance
extension SimpleLinkedList: Collection {
    public struct Index: Comparable {
        fileprivate var node: _Node?
        fileprivate var nodePosition: Int
        
        static public func ==(lhs: Index, rhs: Index) -> Bool {
            return (lhs.nodePosition == rhs.nodePosition && lhs.node?._next === rhs.node?._next)
        }
        static public func <(lhs: Index, rhs: Index) -> Bool {
            return (lhs.nodePosition < rhs.nodePosition)
        }
    }
    
    public var startIndex: Index {
        Index(node: _head, nodePosition: 0);
    }
    
    public var endIndex: Index {
        guard _tail != nil else { return startIndex }
        return Index(node: nil, nodePosition: _size)
    }
    
    public func index(after i: Index) -> Index {
        guard i.node != nil else { return Index(node: nil, nodePosition: i.nodePosition)}
        return Index(node: i.node!._next, nodePosition: i.nodePosition+1)
    }
    
    public subscript(position: Index) -> Value? {
        position.node?._value
    }
}
