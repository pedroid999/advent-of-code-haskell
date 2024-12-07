module Day01Part1 where

import Data.List (sort)

solveDay01part1 :: FilePath -> IO Int
solveDay01part1 path =
    readFile path >>= \content ->
        let locationLines = lines content
            locationPairs = [(read x :: Int, read y :: Int) | locationLine <- locationLines, let [x, y] = words locationLine]
            (xLocations, yLocations) = unzip locationPairs
            xSortedLocations = sort xLocations
            ySortedLocations = sort yLocations
            solution = sum $ zipWith (\xLocation yLocation -> abs (xLocation - yLocation)) xSortedLocations ySortedLocations
         in return solution
