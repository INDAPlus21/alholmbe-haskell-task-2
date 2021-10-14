module F1 where

import Data.Char
import Data.List

-- (0,1) (1,1) (1,2)
-- tail recursive fibonacci
fib n =
  let go n (a, b)
        | n == 0 = a
        | otherwise = go (n - 1) (b, a + b)
   in go n (0, 1)

-- inspired by https://www.youtube.com/watch?v=_JtPhF8MshA

--rovarsprak s = concat [if not(elem x "aeuio") then x:'o':x:[] else x:[] | x <- s]
rovarsprak :: String -> String
rovarsprak [] = []
rovarsprak (x : xs)
  | elem x "aeiouy" = x : (rovarsprak xs)
  | otherwise = x : 'o' : x : (rovarsprak xs)

-- alternativa lösningar
-- rovarsprak = reverse . foldl (\acc x -> if (elem x "aeuio") then x:acc else x:'o':x:acc) []

karpsravor :: String -> String
karpsravor [] = []
karpsravor [a] = [a]
karpsravor [a, b] = [a, b]
karpsravor (x : y : z : rest)
  | elem x "aeiouy" = x : (karpsravor (y : z : rest))
  | otherwise = x : (karpsravor rest)

medellangd :: String -> Double
medellangd s =
  let l = concatMap (\x -> words x) $ map (\x -> map (\y -> if not (isAlpha y) then ' ' else y) x) $ words s
   in (fromIntegral $ length $ concat l) / (fromIntegral $ length l)

skyffla :: [a] -> [a]
skyffla [] = []
skyffla [x] = [x]
skyffla xs = evens xs ++ (skyffla $ odds xs)

odds [] = []
odds [x] = []
odds (e1 : e2 : xs) = e2 : odds xs

evens [] = []
evens [x] = [x]
evens (e1 : e2 : xs) = e1 : evens xs
