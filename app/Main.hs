module Main where

import Day01Part1 (solveDay01part1)
import Day04Part1 (solveDay04Part1)

main :: IO ()
main = do
    resultDay01Part1 <- solveDay01part1 "resources/inputs/day01.txt"
    resultDay04Part1 <- solveDay04Part1 "resources/inputs/day04.txt"
    putStrLn $ "Day 1 Part 1: " ++ show resultDay01Part1
    putStrLn $ "Day 4 Part 1: " ++ show resultDay04Part1
