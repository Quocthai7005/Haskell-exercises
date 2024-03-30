module Factorials (factorial) where

factorial :: Integer -> Integer
factorial starter
    | starter > 1 = starter * factorial (starter - 1)
    | starter == 1 = 1
    | otherwise = 1