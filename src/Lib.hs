module Lib
    ( someFunc, someFunc2, someFunc3, someFunc4
    ) where

someFunc :: IO ()
someFunc = putStrLn "xxxx"

someFunc2 :: IO String
someFunc2 = do
    putStrLn "12345"
    return "12d3456"

someFunc3 :: IO String -> IO ()
someFunc3 iox = do someFunc4 <$> iox
    

someFunc4 :: String -> ()
someFunc4 _ = ()