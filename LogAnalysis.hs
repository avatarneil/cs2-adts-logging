module Main where

import           Log

--parseMessage :: String -> LogMessage
--parseMessage a = testParse

--parse :: String -> [LogMessage]
--parse cs =

parseMessage :: String -> LogMessage
parseMessage cs = parseCompiler (parsemesshelp cs)

parsemesshelp :: String -> ( MessageType, TimeStamp, String )
parsemesshelp cs = parsemess (words cs)

parsemess :: [String] -> ( MessageType, TimeStamp, String )
parsemess cd  = (parseType cd, parseTimeStamp cd, parseString cd)

parseCompiler :: (MessageType, TimeStamp, String) -> LogMessage
parseCompiler (m,t,s) = LogMessage m t s

parseType :: [String] -> MessageType
parseType cd = if cd !! 0 == "I"
                      then Info
                      else if cd !! 0 == "W"
                      then Warning
                      else Error (read(cd !! 1))

parseTimeStamp :: [String] -> TimeStamp
parseTimeStamp cd = if elem (cd !! 2 !! 0 ) ['0','1','2','3','4','5','6','7','8','9']
                    then read (cd !! 2)
                    else read( cd !! 1 )

parseString :: [String] -> String
parseString cd = if elem (cd !! 2 !! 0 ) ['0','1','2','3','4','5','6','7','8','9']
                 then cd !! 3 --Find way to continue list
                 else cd !! 2 --Find way to continue list 

  cd !! 2

bangbang :: [String] -> String
bangbang cd = if cd !! 0 == "1"
              then cd !! 0
              else cd !! 0

main :: IO ()
main = undefined
