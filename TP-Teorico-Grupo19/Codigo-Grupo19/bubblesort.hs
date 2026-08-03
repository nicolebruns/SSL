
import Data.Time
import Text.Printf

bubbleSort :: Ord a => [a] -> [a]
bubbleSort xs
  | res == xs   = xs
  | otherwise = bubbleSort res
  where res = bubble xs

bubble :: Ord a => [a] -> [a]
bubble [] = []
bubble [x] = [x]
bubble (x:y:xs)
  | x > y     = y : bubble (x : xs)
  | otherwise = x : bubble (y : xs)


-- LCG (Linear Congruential Generator) for generating pseudo-random numbers
-- This avoids dependencies on external packages like 'System.Random'
randomList :: Int -> Int -> [Int]
randomList size seed = take size (iterate next seed)
  where 
    next x = (1103515245 * x + 12345) `mod` 2147483648

main :: IO ()
main = do
    let size = 10000
    let unsortedList = randomList size 42
    
    putStrLn "Haskell Bubble Sort Performance Test"
    putStrLn $ "Generating " ++ show size ++ " random elements..."
    putStrLn "Sorting..."
    
    start <- getCurrentTime
    
    let sortedList = bubbleSort unsortedList
    -- Force evaluation of the list by calculating its sum
    let totalSum = sum sortedList
    
    end <- totalSum `seq` getCurrentTime
    
    let diff = realToFrac (diffUTCTime end start) :: Double
    printf "Sorted successfully! Time elapsed: %0.6f seconds (Sum check: %d)\n" diff totalSum
