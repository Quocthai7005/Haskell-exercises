module CreditCardNumberValidator (toDigits, toDigitsRev) where
import Data.Char (digitToInt)

toDigits :: String -> [Int]
toDigits = foldr (\y -> (++) [digitToInt y]) []

toDigitsRev :: String -> [Int]
toDigitsRev [] = []
toDigitsRev (x:xs) = foldr (++) [digitToInt x] [toDigitsRev xs]