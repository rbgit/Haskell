    -- This function returns True if the given string is a palindrome, False otherwise
isPalindrome :: String -> Bool
isPalindrome str = str == reverse str

-- Main function
main :: IO ()
main = do
    -- Get input from the user
    putStrLn "Enter a string: "
    str <- getLine

    -- Check if the string is a palindrome and print the result
    if isPalindrome str
        then putStrLn "The string is a palindrome."
        else putStrLn "The string is not a palindrome."
