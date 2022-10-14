# SimpleLinkedList

## Declaration

```swift
public struct SimpleLinkedList<Value>
```

## Overview
This introduced a `SimpleLinkedList`as a collection of values arranged in a **linear** and **unidirectional** sequence. This has some advantages over contiguous storage options like `Array`:

-  Constant time insertions and removal from the front of the list
- No need to allocate initial space or resize when the when the array is filled

## Detailed Design
To keep the information stored, we edu a `Node<Value>`:
```swift
public class Node<Value> {
  public var value: Value
  public var next: Node?
  public init(value: Value, next: Node? = nil) {
    self.value = value
    self.next = next
  }
}
```

To link each `Node<Value>`with the next one, we use `SimpleLinkedList<Value>`:
```swift
public struct LinkedList<Value> {
  public var head: Node<Value>?
  public var tail: Node<Value>?
  public init() {}
  public var isEmpty: Bool {
head == nil }
}
extension LinkedList: CustomStringConvertible {
  public var description: String {
    guard let head = head else {
      return "Empty list"
    }
    return String(describing: head)
  }
}
```

- `head` and `tail` references the first and last element of the list.
- `isEmpty`is `true`when the list doesn't contain any element. 

### Initializers and Operations
```swift
// Initializers
public init() {}
public init<S: Sequence>(_ elements: S) where S.Element == Element
public init(arrayLiteral elements: Element...)

// Operations
public mutating func push(_ value: Value)
public mutating func append(_ value: Value) 
public func node(at index: Int) -> Node<Value>?
public mutating func pop() -> Value?
public mutating func removeLast() -> Value?
public mutating func remove(after node: Node<Value>) -> Value?

```
`SimpleLinkedList` also implements the `Collection`protocol.

