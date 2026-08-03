// In-place Bubble Sort implementation in F# using mutable arrays
open System
open System.Diagnostics

let bubblesortInPlace (arr: int array) =
    let swap i j =
        let temp = arr.[i]
        arr.[i] <- arr.[j]
        arr.[j] <- temp

    let n = arr.Length
    let mutable swapped = true
    let mutable i = 0
    while swapped && i < n - 1 do
        swapped <- false
        for j in 0 .. n - i - 2 do
            if arr.[j] > arr.[j+1] then
                swap j (j+1)
                swapped <- true
        i <- i + 1

// Performance Test
let size = 10_000
let rand = Random(42) // Seeded for reproducibility
let arrayToSort = Array.init size (fun _ -> rand.Next())

printfn "F# Bubble Sort (In-place) Performance Test"
printfn "Generating %d random elements..." size
printfn "Sorting..."

let sw = Stopwatch.StartNew()
bubblesortInPlace arrayToSort
sw.Stop()

printfn "Sorted successfully! Time elapsed: %f seconds" sw.Elapsed.TotalSeconds
