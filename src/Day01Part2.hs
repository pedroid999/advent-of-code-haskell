module Day01Part2 where

import Data.List (sort)

solveDay01part2 :: FilePath -> IO Int
solveDay01part2 path =
    readFile path >>= \content ->
        let locationLines = lines content
            locationPairs = [(read x :: Int, read y :: Int) | locationLine <- locationLines, let [x, y] = words locationLine]
            (xLocations, yLocations) = unzip locationPairs
            solution = sum (map (\x -> (x * length (filter (== x) yLocations))) xLocations)
         in return solution
