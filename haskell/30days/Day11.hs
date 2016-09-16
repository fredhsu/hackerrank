import           Control.Applicative
import           Control.Monad
import           Data.Array
import           Data.List
import           System.IO

main :: IO ()
main = do
    s <- getMultipleLines 6
    -- let a = listArray ((1,1),(6,6)) testInput
    let a = listArray ((1,1), (6,6)) $ map (\x -> read x::Integer) $ words $ unwords s
    let m = maximum $ map (sum . getHrGlass a) [(x,y) | x <- [1..4], y <- [1..4]]
    print m

getHrGlass :: Array (Integer, Integer) Integer -> (Integer, Integer) -> [Integer]
getHrGlass arr (x,y)
    | x > 4 || x < 1 = []
    | y > 4 || y < 1 = []
    | otherwise = [arr ! (x,y), arr ! (x, y+1), arr ! (x, y+2),
                   arr ! (x+1,y+1),
                   arr ! (x+2, y), arr ! (x+2, y+1), arr ! (x+2, y+2)]


getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do
        x <- getLine
        xs <- getMultipleLines (n-1)
        let ret = x : xs
        return ret
