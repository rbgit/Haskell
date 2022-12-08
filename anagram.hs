import Data.List
import Data.Char

-- Define a function to sort a string
sortString :: String -> String
sortString = sort

-- Define a function to check if two strings are anagrams
isAnagram :: String -> String -> Bool
isAnagram s1 s2 = sortString s1 == sortString s2

-- Define a function to find all anagrams of a given string in a list of strings
findAnagrams :: String -> [String] -> [String]
findAnagrams s strs = filter (isAnagram s) strs

-- Define the main function to test the program
main :: IO ()
main = do
  -- Read a string and a list of strings from the user
  putStrLn "Enter a string: "
  s <- getLine
  putStrLn "Enter a list of strings, separated by spaces: "
  strs <- getLine
  -- Split the list of strings into a list of individual strings
  let strsList = words strs
  -- Find the anagrams of the given string in the list of strings
  let anagrams = findAnagrams s strsList
  -- Print the list of anagrams
  putStrLn $ "The anagrams of " ++ s ++ " are: " ++ show anagrams
