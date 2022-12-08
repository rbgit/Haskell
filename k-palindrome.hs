-- This function returns True if the given string is a k-palindrome, False otherwise
isKPalindrome :: String -> Int -> Bool
isKPalindrome str k = (length str - dp str k) <= k
    where
        dp :: String -> Int -> Int
        dp str k = minimum (map (\i -> min (dp' str i k) (dp' (reverse str) i k)) [0..length str])
        dp' :: String -> Int -> Int -> Int
        dp' str i k = minimum [table !! (i - 1) !! j + 1 | j <- [max 0 (i - k) .. i - 1]]
        table :: [[Int]]
        table = [[levenshtein a b | b <- str] | a <- str]
        levenshtein a b = minimum [table !! i !! (j - 1) + 1, table !! (i - 1) !! j + 1, table !! (i - 1) !! (j - 1) + cost]
            where
                cost = if a == b then 0 else 1

-- Main function
main :: IO ()
main = do
    -- Get input from the user
    putStrLn "Enter a string: "
    str <- getLine

    putStrLn "Enter a value for k: "
    kStr <- getLine
    let k = read kStr :: Int

    -- Check if the string is a k-palindrome and print the result
    if isKPalindrome str k
        then putStrLn "The string is a k-palindrome."
        else putStrLn "The string is not a k-palindrome."
