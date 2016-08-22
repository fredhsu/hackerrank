import Control.Applicative
import Control.Monad
import System.IO
import Text.Printf


main :: IO ()
main = do
    n_temp <- getLine
    let n = read n_temp :: Int
    mapM_ (\x -> printf "%d x %d = %d\n" n x (n * x)) [1..10]

getMultipleLines :: Int -> IO [String]

getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = (x:xs)    
        return ret          

