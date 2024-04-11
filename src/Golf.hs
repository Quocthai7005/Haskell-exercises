module Golf (skipEvery) where

skipEvery :: Int -> [a] -> [a]
skipEvery _ [] = []
skipEvery 0 _ = []
skipEvery n xs = 
    let rs = drop (n-1) xs
    in case rs of
        [] -> []
        r:rd -> r : skipEvery n rd