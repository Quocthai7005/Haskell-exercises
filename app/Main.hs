module Main (main) where

import Lib

main :: IO ()
main = do 
    a <- someFunc2
    putStrLn a
