module LogParser (parseMessage) where

data MessageType = Info | Warning | Error Int deriving (Show, Eq)
data LogMessage = LogMessage MessageType Int String | Unknown String deriving (Show, Eq)

unknownLog :: LogMessage
unknownLog = Unknown "not a log message"

parseMessage :: [String] -> LogMessage
parseMessage [] = unknownLog
parseMessage (t:xs) 
  | t == "I" = case xs of
                ts:msg -> LogMessage Info (read ts) (unwords msg)
                _      -> unknownLog
  | t == "W" = case xs of
                ts:msg -> LogMessage Warning (read ts) (unwords msg)
                _      -> unknownLog
  | t == "E" = case xs of
                s:ts:msg -> LogMessage (Error (read s)) (read ts) (unwords msg)
                _      -> unknownLog
  | otherwise = unknownLog