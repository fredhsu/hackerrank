import           Control.Applicative
import           Control.Monad
import           System.IO
import           Text.Printf

day6 :: String -> String
day6 x = e ++ " " ++ o
    where tups = zip [0..(length x)] x
          e = foldr (\(x,y) acc -> if even x then y : acc else acc) [] tups
          o = foldr (\(x,y) acc -> if odd x then y : acc else acc) [] tups

main :: IO ()
main = do
    n_temp <- getLine
    let n = read n_temp :: Int
    s <- getMultipleLines n
    mapM_ (putStrLn . day6) s

getMultipleLines :: Int -> IO [String]

getMultipleLines n
    | n <= 0 = return []
    | otherwise = do
        x <- getLine
        xs <- getMultipleLines (n-1)
        let ret = x:xs
        return ret

