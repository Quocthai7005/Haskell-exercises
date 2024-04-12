module Golf (skipEvery, duplicateList, repeatList) where

skipEvery :: Int -> [a] -> [a]
skipEvery _ [] = []
skipEvery 0 _ = []
skipEvery n xs = 
    let rs = drop (n-1) xs
    in case rs of
        [] -> []
        r:rd -> r : skipEvery n rd

duplicateList :: [a] -> Int -> [[a]]
duplicateList xs n
                  | n > 0 = xs : duplicateList xs (n - 1)
                  | n == 0 = []
                  | otherwise = error ""

repeatList :: [a] -> [[a]]
repeatList xs = duplicateList xs (length xs)