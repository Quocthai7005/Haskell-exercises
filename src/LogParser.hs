{-# LANGUAGE InstanceSigs #-}
module LogParser (parseMessage, insertMessage, lineStringToLogMessage, buildMessageTree, MessageTree(..)) where

data MessageType = Info | Warning | Error Int deriving (Show, Eq)
data LogMessage = LogMessage MessageType Int String | Unknown String deriving (Show)

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

instance Ord LogMessage where
    (Unknown m1) `compare` (Unknown m2) = m1 `compare` m2
    (Unknown m1) `compare` (LogMessage _ _ m2) = m1 `compare` m2
    (LogMessage _ _ m1) `compare` (Unknown m2) = m1 `compare` m2
    (LogMessage _ s1 _) `compare` (LogMessage _ s2 _) = s1 `compare` s2

instance Eq LogMessage where
    (Unknown m1) == (Unknown m2) = m1 == m2
    (Unknown m1) == (LogMessage _ _ m2) = m1 == m2
    (LogMessage _ _ m1) == (Unknown m2) = m1 == m2
    (LogMessage _ s1 _) == (LogMessage _ s2 _) = s1 == s2

insertMessage :: MessageTree -> LogMessage -> MessageTree
insertMessage mt m = case m of 
                        Unknown _ -> mt
                        LogMessage {} -> case mt of
                                    Leaf -> Node Leaf m Leaf
                                    Node t1 mx t2 -> if m < mx then Node (insertMessage t1 m) mx t2 else Node t1 mx (insertMessage t2 m)

lineStringToLogMessage :: String -> LogMessage
lineStringToLogMessage = parseMessage . words

buildMessageTree :: [LogMessage] -> MessageTree
buildMessageTree = foldl insertMessage Leaf