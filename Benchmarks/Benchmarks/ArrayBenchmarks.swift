import CollectionsBenchmark

extension Benchmark {
  public mutating func addArrayBenchmarks() {
    self.addSimple(
      title: "Array<Int> append",
      input: [Int].self
    ) { input in
      var array: [Int] = []
      for i in input {
        array.append(i)
      }
      precondition(array.count == input.count)
      blackHole(array)
    }

//    self.addSimple(
//      title: "Array<Int> append, reserving capacity",
//      input: [Int].self
//    ) { input in
//      var array: [Int] = []
//      array.reserveCapacity(input.count)
//      for i in input {
//        array.append(i)
//      }
//      blackHole(array)
//    }

    self.addSimple(
      title: "Array<Int> prepend",
      input: [Int].self
    ) { input in
      var array: [Int] = []
      for i in input {
        array.insert(i, at: 0)
      }
      blackHole(array)
    }

//    self.addSimple(
//      title: "Array<Int> prepend, reserving capacity",
//      input: [Int].self
//    ) { input in
//      var array: [Int] = []
//      array.reserveCapacity(input.count)
//      for i in input {
//        array.insert(i, at: 0)
//      }
//      blackHole(array)
//    }

    self.add(
      title: "Array<Int> random insertions",
      input: Insertions.self
    ) { insertions in
      return { timer in
        let insertions = insertions.values
        var array: [Int] = []
        timer.measure {
          for i in insertions.indices {
            array.insert(i, at: insertions[i])
          }
        }
        blackHole(array)
      }
    }

//    self.add(
//      title: "Array<Int> random insertions, reserving capacity",
//      input: Insertions.self
//    ) { insertions in
//      return { timer in
//        let insertions = insertions.values
//        var array: [Int] = []
//        array.reserveCapacity(insertions.count)
//        timer.measure {
//          for i in insertions.indices {
//            array.insert(i, at: insertions[i])
//          }
//        }
//        blackHole(array)
//      }
//    }

    self.add(
      title: "Array<Int> removeLast",
      input: Int.self
    ) { size in
      return { timer in
        var array = Array(0 ..< size)
        timer.measure {
          for _ in 0 ..< size {
            array.removeLast()
          }
        }
        precondition(array.isEmpty)
        blackHole(array)
      }
    }

    self.add(
      title: "Array<Int> removeFirst",
      input: Int.self
    ) { size in
      return { timer in
        var array = Array(0 ..< size)
        timer.measure {
          for _ in 0 ..< size {
            array.removeFirst()
          }
        }
        precondition(array.isEmpty)
        blackHole(array)
      }
    }

    self.add(
      title: "Array<Int> random removals",
      input: Insertions.self
    ) { insertions in
      let removals = Array(insertions.values.reversed())
      return { timer in
        var array = Array(0 ..< removals.count)
        timer.measure {
          for i in removals {
            array.remove(at: i)
          }
        }
        blackHole(array)
      }
    }
  }
}
