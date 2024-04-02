module CreditCardNumberValidator (toDigits, toDigitsRev, doubleEveryOther) where
import Data.Char (digitToInt)

toDigits :: String -> [Int]
toDigits = foldr (\y -> (++) [digitToInt y]) []

toDigitsRev :: String -> [Int]
toDigitsRev [] = []
toDigitsRev (x:xs) = foldr (++) [digitToInt x] [toDigitsRev xs]

doubleEveryOther :: [Int] -> [Int]
doubleEveryOther xs = reverse $ zipWith ($) (cycle [id, (*2)]) (reverse xs)
