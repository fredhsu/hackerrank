import           Control.Applicative
import           Control.Monad
import           Data.Map            (Map)
import qualified Data.Map            as Map
import           System.IO

main :: IO ()
main = do
    n_temp <- getLine
    let n = read n_temp :: Int
    s <- getMultipleLines n
    let al = map words s
    let hash = foldl (\map (x:y:_) -> Map.insert x y map) Map.empty al
    -- This one as a little tricky because there is a case where you get more queries than inputs
    -- interact is a useful function that takes a String -> String function, takes STDIN, applies
    -- the function, then prints the output
    interact $ unlines . map (lookupKey hash) . lines

lookupKey h k = let r = Map.lookup k h in
    case r of Nothing -> "Not found"
              Just y -> k ++ "=" ++ y


getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do
        x <- getLine
        xs <- getMultipleLines (n-1)
        let ret = x:xs
        return ret
