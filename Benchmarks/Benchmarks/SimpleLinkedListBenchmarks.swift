
import CollectionsBenchmark
import DataStructures

extension Benchmark {
    public mutating func addSimpleLinkedListBenchmarks() {
        self.addSimple(
            title: "SimpleLinkedList<Int> init from range",
            input: Int.self
        ) { size in
            blackHole(SimpleLinkedList(0..<size))
        }
        
        self.addSimple(
            title: "SimpleLinkedList<Int> init from buffer",
            input: [Int].self
        ) { input in
            blackHole(SimpleLinkedList(input))
        }

        self.addSimple(
            title: "SimpleLinkedList<Int> push",
            input: [Int].self
        ) { input in
            var list = SimpleLinkedList<Int>()
            for i in input {
                list.push(i)
            }
            precondition(list.size == input.count)
            blackHole(list)
        }
        
        self.addSimple(
            title: "SimpleLinkedList<Int> append",
            input: [Int].self
        ) { input in
            var list = SimpleLinkedList<Int>()
            for i in input {
                list.append(i)
            }
            precondition(list.size == input.count)
            blackHole(list)
        }

        self.add(
            title: "SimpleLinkedList<Int> random insertions",
            input: [Int].self
        ) { input in
            return { timer in
                let array = Array(0 ..< input.count)
                    .enumerated()
                    .map { (index, element) in
                        return index > 1 ? Int.random(in: 0 ..< index) : 0
                    }
                var list = SimpleLinkedList<Int>()
                timer.measure {
                    for i in array.indices {
                        list.insert(i, after: array[i])
                    }
                }
                precondition(list.size == input.count)
                blackHole(list)
            }
        }

        self.add(
            title: "SimpleLinkedList<Int> pop",
            input: [Int].self
        ) { input in
            return { timer in
                var list = SimpleLinkedList(input)
                timer.measure {
                    while let number = list.pop() {
                        blackHole(number)
                    }
                }
                precondition(list.isEmpty)
                blackHole(list)
            }
        }

        self.add(
            title: "SimpleLinkedList<Int> removeLast",
            input: [Int].self
        ) { input in
            return { timer in
                var list = SimpleLinkedList(input)
                timer.measure {
                    while let number = list.removeLast() {
                        blackHole(number)
                    }
                }
                precondition(list.isEmpty)
                blackHole(list)
            }
        }
        
        self.add(
            title: "SimpleLinkedList<Int> random deletions",
            input: [Int].self
        ) { input in
            return { timer in
                var list = SimpleLinkedList(input)
                timer.measure {
                    while list.size > 1 {
                        list.remove(after: Int.random(in: 0 ... list.size - 2))
                    }
                    list.pop()
                }
                precondition(list.isEmpty)
                blackHole(list)
            }
        }
        
        self.add(
          title: "SimpleLinkedList<Int> sequential iteration",
          input: Int.self
        ) { size in
          let list = SimpleLinkedList(0 ..< size)
          return { timer in
            for i in list {
              blackHole(i)
            }
          }
        }
    }
}
