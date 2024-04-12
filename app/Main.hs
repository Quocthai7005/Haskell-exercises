module Main (main) where
import Golf as G
import qualified Golf as G
import Golf (skipEvery, duplicateList)

main = do
  print $ duplicateList "12345678" 2
{-
main :: IO ()
main = do
    contents <- readFile "C:/Users/thainguyen/Resources/Haskell/logFile.txt"
    print $ buildMessageTree (map lineStringToLogMessage (lines contents))
-}

{- Run credit card validator
main :: IO ()
main = do
    print $ "type your credit card no: "
    numberInString <- getLine
    print $ validate numberInString
-}

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




