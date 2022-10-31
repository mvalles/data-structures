#  Stack
Array-based data structure implementing `push` and `pop` operations on the top implementing a last-in, first-out, or LIFO, policy.

## Declaration

```swift
public struct Stack<Element>
```
## Overview
Array-backeck [stacks](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)) must provide (`O(1)`) for all of its operations.  


### Initialization
There are a couple of options for initializing a `Stack`. To create an empty `Stack`, call `init()`:

```swift
var stack = Stack<Int>()
```

You can also create a `Stack` from an existing sequence in linear time:

```swift
var stack = Stack((1...).prefix(20))
```
or using a `Collection`:
```swift
var stack = Stack(Array(1...20)) 
```

Finally a `Stack` can be created from an array literal:

```swift
var stack: Stack<Double> = [0.1, 0.6, 1.0, 0.15, 0.42]
```

### Queries
`ìsEmpty` property check if the `Stack`is empty
```swift
var stack = Stack<Int>()
stack.isEmpty // true
stack.push(6)
stack.isEmpty // false
```

Use `count to get the number of elements in the `Stack`:
```swift
var stack = Stack<Int>()
stack.push(6)
stack.push(5)
let size = stack.count // size = 2
```

To take a look at the top of the `Stack` without mutating its contents, call `peek()`: 
`peek()` return `nil` if the `Stack` is empty

```swift
var stack = Stack<Int>()
var topValue = stack.peek() // topValue = nil
stack.push(6)
topValue = stack.peek() // topValue = 6
let size = stack.count  // size = 1
```

### Insertion

To insert an element to the top of the`Stack`, call `push(_:)`:

```swift
var stack = Stack<Int>()
stack.push(6)
```

### Deletion

To delete an element at the top of the`Stack`, call `pop()`:

```swift
var stack = Stack<Int>()
stack.push(6)
stack.pop()
stack.isEmpty // true
```

### Iteration
<TODO> Sequence protocol conformance

### Performance
| Operation     | Complexity     |
|-----------    |:----------:    |
| push          |    O(1)        |
| pop           |    O(1)        |
| peek          |    O(1)        |

## Implementation Details
An `Stack` stores its members in a regular `ContiguousArray` value (exposed by the `_storage` property).

All operations performed on the stack are done at the end of the array so its performance is O(1)

Enjoy! 😀
