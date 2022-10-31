# SimpleLinkedList

## Declaration

```swift
public struct SimpleLinkedList<Value>
```

## Overview
This introduced a [`SimpleLinkedList`](https://en.wikipedia.org/wiki/Linked_list) as a collection of values 
arranged in a **linear** and **unidirectional** sequence. This has some advantages over contiguous storage options like `Array`:

- Constant time insertions and removal from the front of the list
- No need to allocate initial space or resize when the array is filled

### Initialization
There are a couple of options for initializing a `SimpleLinkedList`. To create an empty `SimpleLinkedList`, call `init()`:

```swift
var list = SimpleLinkedList<Int>()
```

You can also create a `SimpleLinkedList` from an existing sequence in linear time:

```swift
var list = SimpleLinkedList((1...).prefix(20))
```
or using a `Collection`:
```swift
var list = SimpleLinkedList(Array(1...20)) 
```

Finally a `SimpleLinkedList` can be created from an array literal:

```swift
var list: SimpleLinkedList<Double> = [0.1, 0.6, 1.0, 0.15, 0.42]
```

### Queries
`ìsEmpty` property check if the `SimpleLinkedList`is empty
```swift
var list = SimpleLinkedList<Int>()
list.isEmpty // true
list.push(6)
list.isEmpty // false
```

Use `size` to get the number of elements in the `SimpleLinkedList`:
```swift
var list = SimpleLinkedList<Int>()
list.push(6)
list.push(5)
let size = list.size // size = 2
```

To get the `first` value of the `SimpleLinkedList` without mutating its contents, use `first`. 
`first` return `nil` if the `SimpleLinkedList` is empty

```swift
var list = SimpleLinkedList<Int>()
var firstValue = list.first // firstValue = nil
list.push(6)
firstValue = list.first // firstValue = 6
let size = list.size  // size = 1
```

To get the `last` value of the `SimpleLinkedList` without mutating its contents, use `last`. 
`last` return `nil` if the `SimpleLinkedList` is empty

```swift
var list = SimpleLinkedList<Int>()
var lastValue = list.last // lastValue = nil
list.push(6)
lastValue = list.last // lastValue = 6
let size = list.size  // size = 1
```

### Insertion

To insert an element to the front of the `SimpleLinkedList`, call `push(_:)`:

```swift
var list = SimpleLinkedList<Int>()
list.push(6) // 6
list.push(5) // 5 -> 6
```

To insert an element at the end of the `SimpleLinkedList`, call `append(_:)`:
```swift
var list = SimpleLinkedList<Int>()
list.append(6) // 6
list.append(7) // 6 -> 7
```

To insert the element after an index position of the `SimpleLinkedList` from head, call `insert(_:, :after)`: 
```swift
var list = SimpleLinkedList<Int>()
list.insert(10, after: 0) // 10 (in empty list, first insertion is index 0)
list.insert(20, after: 0) // 10 - > 20
```

### Deletion

To delete an element at the front of the`SimpleLinkedList`, call `pop()`:
```swift
var list = SimpleLinkedList<Int>()
list.push(6) // 6
list.push(5) // 5 -> 6
list.pop()   // 6
list.pop()
list.isEmpty // true
```

To delete an element at the end of the`SimpleLinkedList`, call `removeLast()`:
```swift
var list = SimpleLinkedList<Int>()
list.push(6) // 6
list.push(5) // 5 -> 6
list.removelast() // 5
list.removeLast()
list.isEmpty // true
```

To remove the element after an index position of the List from head, call `remove(:after)`:
```swift
var list = SimpleLinkedList<Int>()
list.push(6) // 6
list.push(5) // 5 -> 6
list.remove(after: 0) // 5
```

To delete all the elements of the list, call `removeAll()`:
```swift
var list = SimpleLinkedList<Int>()
list.push(6) // 6
list.push(5) // 5 -> 6
list.removeAll()
list.isEmpty // true
```

### Iteration
`SimpleLinkedList` Collection protocol conformance.

### Performance
| Operation     | Complexity     |
|-----------    |:----------:    |
| push          |    O(1)        |
| append        |    O(1)        |
| insert        |    O(log n)    |
| pop           |    O(1)        |
| removeLast    |    O(log n)    |
| remove        |    O(log n)    |

In all of the above, `n` is the number of elements in the `SimpleLinkedList`.

## Implementation Details
An `SimpleLinkedList` stores its members in separate objects connected by links. 
Each element is a node and each node has a reference or pointer to the next node.
We keep track of where the list begins and ends with the `head` and `tail` references.

Enjoy! 😀
