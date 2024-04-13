module Golf (skip, chunkInThree, localMaxima) where

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

chunkInThree :: Num a => [a] -> [[a]]
chunkInThree xs = case xs of 
    x:y:z:xz -> [x,y,z] : chunkInThree (y:z:xz)
    x:y:[] -> []
    x:[] -> []

filterMaximaTriple xs = filter (\(x:y:z:[]) -> y > z && y > x) (chunkInThree xs)

localMaxima xs = map (\(x:y:z:[]) -> y) (filterMaximaTriple xs)



