///
/// Stacks are as easy to implement as they are useful in many programming disciplines. Many applications use Stcks for instance to:
/// - Implement navigation
/// - Search and conquer algorithms using backtracking
/// - The stack pattern is also used to keep track of the ‘most recently used’ feature
///  - to mention just a few
///
///  In a stack, the element deleted from the set is the one most recently inserted: the stack implements a last- in, first-out, or LIFO, policy.
///
/// The main goal of building a stack is to enforce how you access your data
/// - The INSERT operation on a stack is often called PUSH, and
/// - The DELETE operation, which does not take an element argument, is often called POP
/// For this reason, we are no going to adopt the collection protocols for the Stack keeping Stack the simplest and the most usefull.

@frozen
public struct Stack<Element> {
    @usableFromInline
    internal var _storage: ContiguousArray<Element>
    
    /// Creates an empty stack.
    @inlinable
    public init() {
        _storage = []
    }
}
// MARK: - Computed instance properties
extension Stack {
    /// A Boolean value indicating whether or not the stack is empty.
    ///
    /// - Complexity: O(1)
    @inlinable @inline(__always)
    public var isEmpty: Bool {
        _storage.isEmpty
    }
    
    /// The number of elements in the heap.
    ///
    /// - Complexity: O(1)
    @inlinable @inline(__always)
    public var count: Int {
        _storage.count
    }
}

// MARK: - push,pop and peek methods
extension Stack {
    /// Add an element to the top of the stack.
    ///
    /// - Complexity: O(1)
    @inlinable
    public mutating func push(_ element: Element) {
        _storage.append(element)
    }
    
    /// Remove the top element of the stack
    ///
    /// - Complexity: O(1)
    @discardableResult
    @inlinable
    public mutating func pop() -> Element? {
        _storage.popLast()
    }
    
    ///
    /// Look at the top element of the stack without mutating its contents.
    ///
    /// - Complexity: O(1)
    @inlinable
    public func peek() -> Element? {
        _storage.last
    }
    
}

// TODO: - Add an iterator
//extension Stack: Sequence {
//  public func makeIterator() -> AnyIterator<T> {
//    var curr = self
//    return AnyIterator {
//      return curr.pop()
//    }
//  }
//}

// MARK: - Initilize Stack from Sequence

extension Stack {
    /// Initializes a stack from a sequence.
    ///
    @inlinable
    public init<S: Sequence>(_ elements: S) where S.Element == Element {
        _storage = ContiguousArray(elements)
    }
}

// MARK: - ExpressibleByArrayLiteral makes stack initializable from an array literal

extension Stack: ExpressibleByArrayLiteral {
    /// Creates a new stack from the contents of an array literal.
    ///
    /// **Do not call this initializer directly.** It is used by the compiler when
    /// you use an array literal. Instead, create a new stack using an array
    /// literal as its value by enclosing a comma-separated list of values in
    /// square brackets. You can use an array literal anywhere a stack is expected
    /// by the type context.
    ///
    /// - Parameter elements: A variadic list of elements of the new stack.
    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
}

// MARK: - CustomDebugStringConvertible representation of Stack types for debugging

extension Stack: CustomDebugStringConvertible {
    public var debugDescription: String {
        """
        ----top----
        \(_storage.map { "\($0)" }.reversed().joined(separator:"\n"))
        -----------
        """
    }
}
