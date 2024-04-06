{-# LANGUAGE InstanceSigs #-}
module LogParser (parseMessage, insertMessage, lineStringToLogMessage, buildMessageTree, MessageTree(..)) where

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

data MessageTree = Leaf | Node MessageTree LogMessage MessageTree

instance Show MessageTree where
    show :: MessageTree -> String
    show Leaf = "Leaf "
    show (Node left logMessage right) = "Node " ++ show logMessage ++ " (" ++ show left ++ ") (" ++ show right ++ ")"

insertMessage :: MessageTree -> LogMessage -> MessageTree
insertMessage mt m = case mt of
                Leaf -> Node Leaf m Leaf
                Node t1 _ _ -> insertMessage t1 m

lineStringToLogMessage :: String -> LogMessage
lineStringToLogMessage = parseMessage . words

buildMessageTree :: [LogMessage] -> MessageTree
buildMessageTree = foldl insertMessage Leaf