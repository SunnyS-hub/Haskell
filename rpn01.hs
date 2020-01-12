import Data.List
import System.IO

remPlus = map (filter (/='+')) ["4","6", "+", "7", "-"]
remMin = map (filter (/='-')) remPlus
grp = groupBy (\x y -> (x =="")==(y=="")) remMin

a = [a | a <- grp, a/=[""]]

listb = [[3],[2],[1]]
filL = [b | [b]<-listb]


step :: [Int] -> String -> [Int]
step stack str 
 | length stack == 0 = [read str :: Int]
 | str == "+" ||str == "-" || str == "*"= newStack
  where
   rstack = reverse stack
   operand = take 2 stack
   unused = stack \\ operand
   sOperation = case str of
    "+" -> sum operand
    "-" -> (operand !! 1) - (operand !! 0)
    "*" -> product operand
   newStack = sOperation : unused

step stack str 
 = noOpStack
  where 
   num = read str :: Int
   noOpStack = num : stack



rpn :: [String] -> Int
rpn string
 = last $ foldl step [] string


rpnRecc :: [String] -> [Int]
rpnRecc string 
 |length string == 0 = s
 |head string == "+" = s
 |otherwise = rpnRecc unused
  where 
   val = take 1 string
   valInt = [read v :: Int |v <-val]
   unused = string \\ val
   recc = valInt ++ rpnRecc unused
   s = step recc "+"
   a = [show as | as<-s]

--   rInt = [read rv :: Int | rv<-recc]
 


rpnRecc1 :: [String] -> [Int]
rpnRecc1 string 
 = s
  where
   stack = unwords string 
   s= step [] stack 




as = ["2","4","4"]
bq = intercalate " " as


trpn =  (foldl step [] ["3", "6", "+"])
   

--pn :: [String] -> Int
--pn string
-- = rpn $ foldl step [] string
pn :: [String] -> Int
pn string
 = rpn $ foldl fFun [] string
  where 
   fFun xs "*" = "*" : xs
   fFun xs "+" = "+" : xs
   fFun xs "-" = "-" : xs
   fFun xs numberString = (show (head (step [] numberString))) : xs


rpnRe :: [String] -> Int
rpnRe [] = error "empty string"

rpnRe expr = go [] expr !!0
  where 
    go acc [] = acc
    go acc (x:xs) = go (step acc x) xs


 --ERRORS (7 marks)

data RPNOut = RPNOut {
 success :: Int -> RPNOut,
 stuck :: [Int] -> [String] -> RPNOut,
 incomplete :: [Int] -> RPNOut 
} 
