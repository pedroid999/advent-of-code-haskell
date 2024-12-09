module Main where

import Day01Part1 (solveDay01part1)
import Day01Part2 (solveDay01part2)
import Day02Part1 (solveDay02Part1)
import Day02Part2 (solveDay02Part2)
import Day04Part1 (solveDay04Part1)

main :: IO ()
main = do
    resultDay01Part1 <- solveDay01part1 "resources/inputs/day01.txt"
    resultDay01Part2 <- solveDay01part2 "resources/inputs/day01.txt"
    resultDay02Part1 <- solveDay02Part1 "resources/inputs/day02.txt"
    resultDay02Part2 <- solveDay02Part2 "resources/inputs/day02.txt"
    resultDay04Part1 <- solveDay04Part1 "resources/inputs/day04.txt"
    putStrLn $ "Day 1 Part 1: " ++ show resultDay01Part1
    putStrLn $ "Day 1 Part 2: " ++ show resultDay01Part2
    putStrLn $ "Day 2 Part 1: " ++ show resultDay02Part1
    putStrLn $ "Day 2 Part 2: " ++ show resultDay02Part2
    putStrLn $ "Day 4 Part 1: " ++ show resultDay04Part1
