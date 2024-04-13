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
    | n < length xs = skipEvery n xs : skipBy (n+1) xs
    | otherwise = []

skip :: [a] -> [[a]]
skip = skipBy 1

chunkInThree :: Num a => [a] -> [[a]]
chunkInThree xs = case xs of 
    x:y:z:xz -> [x,y,z] : chunkInThree (y:z:xz)
    _ -> []

filterMaximaTriple :: (Ord a, Num a) => [a] -> [[a]]
filterMaximaTriple xs = filter checkMaxima (chunkInThree xs)

checkMaxima :: Ord a => [a] -> Bool
checkMaxima [x,y,z] = y > z && y > x
checkMaxima _ = False

getMaxima :: [a] -> a
getMaxima [_,y,_] = y
getMaxima _ = error "Not supported"

localMaxima :: [Int] -> [Int]
localMaxima xs = map getMaxima (filterMaximaTriple xs)



