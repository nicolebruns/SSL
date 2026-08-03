// In-place Quicksort implementation in F# using mutable arrays
open System
open System.Diagnostics

let quicksortInPlace (arr: int array) =
    let swap i j =
        let temp = arr.[i]
        arr.[i] <- arr.[j]
        arr.[j] <- temp

    let rec sort left right =
        if left < right then
            let pivot = arr.[right]
            let mutable i = left - 1
            
            for j in left .. right - 1 do
                if arr.[j] <= pivot then
                    i <- i + 1
                    swap i j
            
            swap (i + 1) right
            let pivotIdx = i + 1
            
            sort left (pivotIdx - 1)
            sort (pivotIdx + 1) right

    sort 0 (arr.Length - 1)







// Performance Test
let size = 100_000
let rand = Random(42) 
let arrayToSort = Array.init size (fun _ -> rand.Next())

printfn "F# Quicksort (In-place) Performance Test"
printfn "Generating %d random elements..." size
printfn "Sorting..."

let sw = Stopwatch.StartNew()
quicksortInPlace arrayToSort
sw.Stop()

printfn "Sorted successfully! Time elapsed: %f seconds" sw.Elapsed.TotalSeconds
