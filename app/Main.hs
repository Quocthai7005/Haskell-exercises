module Main (main) where
import CreditCardNumberValidator as CC

main :: IO ()
main = print $ CC.doubleEveryOther [1,2,3,4,5,6]

{- Runs reversing list function
main :: IO ()
main = print $ RL.foldlReverse [1,2,3,4,5]
main = print $ RL.foldrReverse [1,2,3,4,5]
-}

{- Runs uncurrying function
import ManualCurrying as Ma
main :: IO ()
main = print $ addOne 2
manualUncurriedFunction = Ma.manualCurry uncurriedAddition
addOne = manualUncurriedFunction 1
uncurriedAddition :: Num c => (c, c) -> c
uncurriedAddition nums =
  let
    a = fst nums
    b = snd nums
  in a + b
-}


{- Runs factorial method
import Factorials as Fac
main :: IO ()
main = print $ Fac.factorial 5

what is the difference between 'print' and 'putStrLn'
print a = putStrLn $ show a
with a derived from 'Show'
-}

{- Runs fibonacci counter method
import Fibonacci as Fib
main :: IO ()
main = print $ Fib.fibonacci 5
-}




