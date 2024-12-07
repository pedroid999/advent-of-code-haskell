module Day04Part1 where

import Data.Array

-- Constants
xmas :: String
xmas = "XMAS"

offsets :: [(Int, Int)]
offsets = [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)]

solveDay04Part1 :: FilePath -> IO Int
solveDay04Part1 path = do
    contents <- readFile path
    let input = lines contents
        matrix = listToArray2D input
    return (solveInput matrix)

-- Convert list to 2D Array
listToArray2D :: [String] -> Array (Int, Int) Char
listToArray2D xs =
    array
        ((0, 0), (rows - 1, cols - 1))
        [((i, j), (xs !! i) !! j) | i <- [0 .. rows - 1], j <- [0 .. cols - 1]]
  where
    rows = length xs
    cols = length (head xs)

-- Main solving function
solveInput :: Array (Int, Int) Char -> Int
solveInput matrix = sum [starCmp matrix (i, j) | i <- [0 .. rows], j <- [0 .. cols]]
  where
    (rows, cols) = snd $ bounds matrix

-- Check all directions for XMAS pattern
starCmp :: Array (Int, Int) Char -> (Int, Int) -> Int
starCmp matrix pos = length $ filter id [starRayCmp matrix pos offset 0 | offset <- offsets]

-- Check single direction for XMAS pattern
starRayCmp :: Array (Int, Int) Char -> (Int, Int) -> (Int, Int) -> Int -> Bool
starRayCmp matrix (posF, posC) (offsetF, offsetC) xmasPos
    | not (inBounds matrix (posF, posC)) = False
    | matrix ! (posF, posC) /= xmas !! xmasPos = False
    | xmasPos == length xmas - 1 = True
    | otherwise = starRayCmp matrix (posF + offsetF, posC + offsetC) (offsetF, offsetC) (xmasPos + 1)

-- Helper function to check if position is within bounds
inBounds :: Array (Int, Int) Char -> (Int, Int) -> Bool
inBounds matrix (row, col) =
    row >= minRow && row <= maxRow && col >= minCol && col <= maxCol
  where
    ((minRow, minCol), (maxRow, maxCol)) = bounds matrix
