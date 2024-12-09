module Day02Part1 where

solveDay02Part1 :: FilePath -> IO Int
solveDay02Part1 path = do
    contents <- readFile path
    let reportsLines = lines contents
        reports = map lineToInts reportsLines
    return (solveReports reports)

lineToInts :: String -> [Int]
lineToInts line = map read (words line)

solveReports :: [[Int]] -> Int
solveReports reports =
    length $ filter id [solveReport report True 0 | report <- reports]

solveReport :: [Int] -> Bool -> Int -> Bool
solveReport report isAsc reportPos
    | reportPos == 0 =
        let isAscParam = (report !! reportPos) < (report !! (reportPos + 1))
            safe = checkSafe isAscParam (report !! reportPos) (report !! (reportPos + 1))
         in if safe then solveReport report isAscParam (reportPos + 1) else False
    | reportPos == (length report) - 2 =
        let safe = checkSafe isAsc (report !! reportPos) (report !! (reportPos + 1))
         in if safe then True else False
    | not (checkSafe isAsc (report !! reportPos) (report !! (reportPos + 1))) = False
    | otherwise = solveReport report isAsc (reportPos + 1)

checkSafe :: Bool -> Int -> Int -> Bool
checkSafe isAsc x y
    | not isAsc && x - y >= 1 && x - y <= 3 = True
    | isAsc && y - x >= 1 && y - x <= 3 = True
    | otherwise = False
