module Fibonacci (fibonacci) where

fibonacci :: Integer -> Integer
fibonacci final
    | final == 0 = 1
    | final > 0 = count 0 0 1 final
    | otherwise = error "Unsupported number"

count :: Integer -> Integer -> Integer -> Integer -> Integer
count runner prev cur final = 
    if prev + cur > final
        then runner
    else count (runner+1) cur (prev + cur) final

