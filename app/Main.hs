module Main (main) where

import Lib

main :: IO ()
main = someFunc3 someFunc2

{- Runs factorial method
import Factorials as Fac
main :: IO ()
main = print $ Fac.factorial 5

what is the difference between 'print' and 'putStrLn'
print a = putStrLn $ show a
with a derived from 'Show'
-}
