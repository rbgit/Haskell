 -- Haskell Cheatsheet
 -- Basic Haskell Functions
import Data.List
import Data.Char
import Data.Function
import System.IO
import System.Info

-- Compute double.
doubleMe a = a * a

-- Getting next number
getNext = succ 8

-- Lists.
-- Generate Lists.
nullList = []
aList = [1..10]
listX = [3,4,2]
listY = [4,2,1]
ifNullA = null aList
ifNull = null nullList
evenList = [2,4..50]
oddList = [51,53..100]
concatList = evenList ++ oddList

-- Compute Length of List.
getLength = length aList

-- Get biggest or smallest element in the list
getMax = maximum evenList
getMin = minimum oddList

-- Sum and Products of Lists. 
sumList = sum aList
productList = product aList

-- Add an item to list. This can only be done at the Head. 
bList = 7 : aList

-- Test if an element in the list.
is7InList = 7 `elem`  bList

-- Reverse list.
reverseA = reverse aList

-- Get first or last item in a list. 
firstItem = head aList
lastItem = last aList

-- Get everything but first or last item in a list. 
leaveFirstItem = tail aList 
leaveLastItem = init aList 


---- Get or drop *first* few items. 
-- `take` picks first x elements in a list.
get3Items = take 3 aList

-- `drop` leaves first x elements in a list. 
drop3Items = drop 3 aList


-- Get a specific item from a list using index.
get4thItem = aList !! 3 

-- Compare if two lists are either bigger or smaller.  
findMax2Lists = max bList aList
findMin2Lists = min bList aList

-- Infinite Lists. Lazy.
infiniteList = [1,2..]
get10 = take 10 infiniteList
many7s = take 30 (repeat 7)
repeatFew = take 9 (cycle ['a','b','c'])

-- Sorting.
sortList = sort [3,6,88,0,123,4,6,7]

-- Sum Of Lists.
listOne = [x | x <- [1,3..100], x < 75 ]  
listTwo = [x | x <- [0,2..100], x < 75 ]  
sumOneAndTwo = zipWith (+) listOne listTwo
subtractTwofromOne = zipWith (-) listOne listTwo
prodOneAndTwo = zipWith (*) listOne listTwo

-- Filter lists. 
biggerThan10  =  filter (>10) listOne
smallerThan33  =  filter (<33) listOne
evensUpTo20 = takeWhile (<=20) [2,4..]

-- foldl and foldr. need to do more reading. didnt understand.


---- List comprehensions.
doubleList = [x * 2 | x <- [1..5]]
doubleListA = [x * 2| x <- aList]
prodOf3 = [x * 3| x <- [1..100], x * 3 <= 100]
divBy9and13 = [x | x <- [1..10000], x `mod` 9 == 0, x `mod` 13 == 0]
powerOf3 = [3^x | x <- [1..10]]
multiTables = [[x * y | x <- [1..10]] | y <- [1..10]]

---- Tuples

randTuple = (1, "Random Tuple")
bobSmith = ("Bob Smith", 45)
bobsName = fst bobSmith
bobsAge = snd bobSmith

names = ["Terry Smith","Rob Madison","Elliot Turner"]
age = [33,21,37]
namesAndAges = zip names age


---- Functions
-- Add two numbers 
-- Type Declaration
addTwo :: Int -> Int -> Int
addTwo x y = x + y

-- Recursion using Factorial
factorial :: Int -> Int
factorial 0 = 1
factorial x = x * factorial (x - 1)


-- Gaurds ( like Switch statements)
isOdd :: Int -> Bool
isOdd n
      | n `mod` 2 == 0 = False
      | otherwise = True

isEven :: Int -> Bool
isEven n
       | n `mod` 2 == 0 = True
       | otherwise = False

-- Higher order functions
oddOrEven :: Int -> String
oddOrEven x
          | isOdd x = "This is Odd"
          | isEven x = "This is Even"


-- More Functions
getListItems :: [Int] -> String
getListItems [] = "Empty List" 
getListItems (x:[]) = "First item in the list is " ++ show x
getListItems (x:xs) = "First item in list is " ++ show x ++ " and rest are " ++ show xs

-- Map 
times4 :: Int -> Int
times4 x = x*4 

inputList = [1..10]
prodList = map times4 inputList

-- More recursion
areStringsEq :: [Char] -> [Char] -> Bool

areStringsEq [] [] = True
areStringsEq (x:xs) (y:ys) = x == y && areStringsEq xs ys
areStringsEq _ _ = False


-- Passing a function as an argument to another function. Mind Blown. Phowww. 
doMult :: (Int -> Int) -> Int
doMult func = func 3

-- Lambda functions - functions that don't have any names. 
db1To10 = map (\x -> x * 2) [1..10]

-- Using System.Info module
sysInfo = do 
    print os
    print arch
    print compilerName
    print compilerVersion

-- Find largest number under 100,000 that is divisible by 3829
largestNum :: (Integral a) => a
largestNum = head (filter p [100000,99999..])
  where p x = x `mod` 3829 == 0

-- Find sum of all odd squares that are smaller than 10,000
sumOddSq :: (Integral a) => a
sumOddSq = sum(takeWhile (<10000) (filter odd (map (^2) [1..])))

{-- Create Bucketized Anagrams 
Input = ['god','earth','dog','fats','heart','fast','allergy','something','meshing to','largely']
Output = [['god', 'dog'], ['earth', 'heart'], ['fats', 'fast'], ['allergy', 'largely'], ['something', 'meshing to']]
anagram :: [String] -> [String]
anagram [] = []
anagram (x:xs)
        | filter ((==). sort. sort x) xs = x:[] 
        | otherwise = anagram xs  

-}
