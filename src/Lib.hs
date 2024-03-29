module Lib
    ( someFunc, someFunc2, someFunc3
    ) where

someFunc :: IO ()
someFunc = putStrLn "xxxx"

someFunc2 :: IO String
someFunc2 = do
    putStrLn "12345"
    return "123456"

someFunc3 :: IO String -> IO ()
someFunc3 iox = do
    a <- iox
    putStrLn a
    

