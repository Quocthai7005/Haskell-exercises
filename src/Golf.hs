module Golf (skip) where

skipEvery :: Int -> [a] -> [a]
skipEvery _ [] = []
skipEvery 0 _ = []
skipEvery n xs = 
    let rs = drop (n-1) xs
    in case rs of
        [] -> []
        r:rd -> r : skipEvery n rd

skipBy :: Int -> [a] -> [[a]]
skipBy n xs 
    | n >= length xs = []
    | n < length xs = (skipEvery (n) xs) : (skipBy (n+1) xs)
    | length xs == 0 = []

skip :: [a] -> [[a]]
skip = skipBy 1

