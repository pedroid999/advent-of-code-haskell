module Day02Part2 where

solveDay02Part2 :: FilePath -> IO Int
solveDay02Part2 path = do
    contents <- readFile path
    let reports = map (map read . words) (lines contents)
    return $ solveReports reports

solveReports :: [[Int]] -> Int
solveReports reports = length $ filter isSafeWithDampener reports

isSafe :: [Int] -> Bool
isSafe xs =
    all (\(x, y) -> abs (x - y) >= 1 && abs (x - y) <= 3) pairs
        && (all (uncurry (<)) pairs || all (uncurry (>)) pairs)
  where
    pairs = zip xs (tail xs)

isSafeWithDampener :: [Int] -> Bool
isSafeWithDampener xs = isSafe xs || any isSafe (removeOne xs)

removeOne :: [a] -> [[a]]
removeOne xs = [take i xs ++ drop (i + 1) xs | i <- [0 .. length xs - 1]]
