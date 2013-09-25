module Main where
import Data.Char

-------------brain train---------------
doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = (if x > 100
						then x
						else doubleMe x) + 1

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]   

numbers = [1,2,3,4,5,6]

getInt x xs = ord (xs !! x) - ord('0')
----------------------------------------

-------------minimal price-------------
--incidenc matrix
matrix :: [[Int]]
matrix = [[0,1,10,0],[1,0,4,1],[10,4,0,1],[0,1,1,0]]

path :: [Int]
path = [0,1,3,2]

--compute price for path
pathPrice path mtx = sum[mtx !! (path !! x) !! (path !! (x+1) ) | x <- [0.. (length(path)-2)]]

--for graph vertex v1, return all neighbor vertex that not in blackList
getNextVert x mtx blackList = [ y | y <-[0.. (length mtx)-1], mtx !! x !! y > 0, not (elem y blackList) ]

--Search paths from v1 to v2 on graph
--SearchPath Dont Work
searchPath v1 v2 mtx blackList = (if v1 == v2
									then blackList
									else (getNextVert v1 mtx (v1:blackList)) )
									--else searchPath (getNextVert v1 mtx (v1:blackList)) v2 mtx (v1:blackList) )   
---------------------------------------


-----------factorian-------------------
--compute factorial x
fac x = product [1..x]

--convert int string to int array
--xs - int string;
--return - int array
--example: getIntArray "1234" => [1,2,3,4]  
getIntArray xs = ( if length xs == 1 
					then (read xs :: Int) : [] 
					else ord(xs !! 0) - ord('0') : getIntArray (tail xs) )
--[x| x <- [1..50000], sum[fac y | y <- intArray(x) ] == x ]

--SearchFactorian
searchFactorion nums = [ x | x <- nums, sum[fac y | y <- getIntArray(show x) ] == x ]  
--------------------------------------

main = do
	--test string convertion
	print $ getIntArray "1223"
	--search factorian
	print $ searchFactorion [1..50000]
