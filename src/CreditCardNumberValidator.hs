module CreditCardNumberValidator (toDigits, toDigitsRev, doubleEveryOther, sumDigit, intToDigitArray, validate) where
import Data.Char (digitToInt)

toDigits :: String -> [Int]
toDigits = foldr (\y -> (++) [digitToInt y]) []

toDigitsRev :: String -> [Int]
toDigitsRev [] = []
toDigitsRev (x:xs) = foldr (++) [digitToInt x] [toDigitsRev xs]

doubleEveryOther :: [Int] -> [Int]
doubleEveryOther xs = reverse $ zipWith ($) (cycle [id, (*2)]) (reverse xs)

sumDigit :: [Int] -> Int
sumDigit = foldr ((+) . sum . intToDigitArray) 0

intToDigitArray :: Int -> [Int]
intToDigitArray = toDigits . show

getRemainderOf10 :: Int -> Bool
getRemainderOf10 x = rem x 10 == 0

validate :: String -> String
validate = answer . getRemainderOf10 . sumDigit . doubleEveryOther . toDigits

answer :: Bool -> [Char]
answer x = if x then "You typed a correct credit card number." else "You typed an incorrect credit card number."

