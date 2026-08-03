


-- Quicksort implementation in Haskell with Performance Testing
import Data.Time
import Text.Printf

quicksort :: Ord a => [a] -> [a]
quicksort []     = []
quicksort (x:xs) = quicksort smaller ++ [x] ++ quicksort larger
  where
    smaller = filter (<= x) xs
    larger  = filter (> x) xs





-- LCG (Linear Congruential Generator) for generating pseudo-random numbers
-- This avoids dependencies on external packages like 'System.Random'
randomList :: Int -> Int -> [Int]
randomList size seed = take size (iterate next seed)
  where 
    next x = (1103515245 * x + 12345) `mod` 2147483648

main :: IO ()
main = do
    let size = 100000
    let unsortedList = randomList size 42
    
    putStrLn "Haskell Quicksort Performance Test"
    putStrLn $ "Generating " ++ show size ++ " random elements..."
    putStrLn "Sorting..."
    
    start <- getCurrentTime
    
    let sortedList = quicksort unsortedList
    -- Force evaluation of the list by calculating its sum
    let totalSum = sum sortedList
    
    end <- totalSum `seq` getCurrentTime
    
    let diff = realToFrac (diffUTCTime end start) :: Double
    printf "Sorted successfully! Time elapsed: %0.6f seconds (Sum check: %d)\n" diff totalSum
