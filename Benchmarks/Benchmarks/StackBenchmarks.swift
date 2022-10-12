
import CollectionsBenchmark
import DataStructures

extension Benchmark {
    public mutating func addStackBenchmarks() {
        self.addSimple(
            title: "Stack<Int> init from range",
            input: Int.self
        ) { size in
            blackHole(Stack(0..<size))
        }
        
        self.addSimple(
            title: "Stack<Int> init from buffer",
            input: [Int].self
        ) { input in
            blackHole(Stack(input))
        }
        
        self.addSimple(
            title: "Stack<Int> push",
            input: [Int].self
        ) { input in
            var stack = Stack<Int>()
            for i in input {
                stack.push(i)
            }
            precondition(stack.count == input.count)
            blackHole(stack)
        }
        
        self.addSimple(
            title: "Stack<Int> pop",
            input: [Int].self
        ) { input in
            var stack = Stack(input)
            while let number = stack.pop() {
                blackHole(number)
            }
            precondition(stack.isEmpty)
            blackHole(stack)
        }
    }
}
