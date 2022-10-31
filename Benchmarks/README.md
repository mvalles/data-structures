# Benchmarks

This package allows the execution of benchmarks to obtain performance data of different operations using the defined data structures as well as to make comparisons between them.

Currently the following benchmarks can be executed:
- Stack: push, pop and init from buffer and range
- SimpleLinkedList: push, append, insert for insertions and pop, removeLast and remove for deletions. 

## Execute benchmarks

- Execute all benchmarks
```console
swift run -c release data-structures-benchmark run --cycles 10 results
swift run -c release data-structures-benchmark render results chart.png
open chart.png
```

- Execute using library
```console
swift run -c release data-structures-benchmark library run --library ./Libraries/Library.json --max-size 16M --cycles 20 results.json
swift run -c release data-structures-benchmark library render results.json --library ./Libraries/Library.json  --output results.html

```
