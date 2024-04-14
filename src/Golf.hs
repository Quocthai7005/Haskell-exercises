module Golf (skip, chunkInThree, localMaxima, upVal, createListMatrix) where

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

originalListMatrix :: [(Int, Int)]
originalListMatrix = [(1, 0), (2, 0), (3, 0), (4, 0), (5, 0), (6, 0), (7, 0), (8, 0), (9, 0)]

createListMatrix :: (Foldable t) => t Int -> [(Int, Int)]
createListMatrix = foldl upVal originalListMatrix

{-
upVal :: [(Int, Int)] -> Int -> [(Int, Int)]
upVal ((1, a):xs) 1 = (1, a+1):xs
upVal (xa:(2, a):xs) 2 = xa:(2, a+1):xs
upVal (xa:(3, a):xs) 3 = xa:(3, a+1):xs
upVal (xa:(4, a):xs) 4 = xa:(4, a+1):xs
upVal (xa:(5, a):xs) 5 = xa:(5, a+1):xs
upVal (xa:(6, a):xs) 6 = xa:(6, a+1):xs
upVal (xa:(7, a):xs) 7 = xa:(7, a+1):xs
upVal (xa:(8, a):xs) 8 = xa:(8, a+1):xs
upVal (xa:(9, a):xs) 9 = xa:(9, a+1):xs
upVal xs _ = xs
-}

upVal :: [(Int, Int)] -> Int -> [(Int, Int)]
upVal [] _ = []  -- Base case: empty list, return empty list
upVal ((x, a):xs) n
    | x == n    = (x, a + 1) : xs  -- If first element matches n, increment second element
    | otherwise = (x, a) : upVal xs n  -- Otherwise, keep current tuple and recurse on rest of the list

maxVal :: [(Int, Int)] -> (Int, Int)
maxVal = foldl findMax (0, 0)

findMax :: Ord a => (a, a) -> (a, a) -> (a, a)
findMax (a, b) (x,y) = if b > y then (a, b) else (x, y)

