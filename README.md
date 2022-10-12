# Data Structures

**Data Structures** is an open-source package of data structure implementations for the Swift programming language.

## Contents

The package currently provides the following implementations:

- [`Stack<Element>`][Stack], array-based data structure implementing `push` and `pop` operations at the top with last-in,first-out, or LIFO, policy.

[Stack]: Documentation/Stack.md

Swift **DataStructures** provides a standalone module for each thematic group of data structures it implements. For instance, if you only need a `Stack` type, you can pull in only that by importing `StackModule`. 

However, there is also a top-level `DataStructures` module that gives you every data structure with a single import statement:

``` swift
import DataStructures

var stack: Stack<Int> = [1, 2]
stack.push(3)
stack.push(4)
print(stack) 
// ----top----
// 4
// 3
// 2
// 1
// -----------
```
