module ReversingList (foldlReverse1, foldlReverse, foldrReverse) where
import Prelude

foldlReverse1 :: [a] -> [a]
foldlReverse1 [] = []
foldlReverse1 (x:xs) = (foldlReverse1 xs) ++ [x]

foldlReverse :: [a] -> [a]
foldlReverse [] = []
foldlReverse (x:xs) = foldl (++) (foldlReverse xs) [[x]]


foldrReverse :: [a] -> [a]
foldrReverse [] = []
foldrReverse (x:xs) = foldr (++) [x] [foldrReverse xs]