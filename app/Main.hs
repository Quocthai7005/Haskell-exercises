module Main (main) where


main :: IO ()
main = putStrLn "test"

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




