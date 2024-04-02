module TheTowerOfHanoi (hanoi) where

type Peg = String
type Move = (Peg, Peg)

hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 _ _ _ = []
hanoi n a b s = hanoi (n-1) a s b ++ [(a, b)] ++ hanoi (n-1)  s b a

