import           Control.Applicative
import           Control.Monad
import           Data.List
import           System.IO
import           Text.Printf

main :: IO ()
main = do
    n_temp <- getLine
    let n = read n_temp :: Int
    print $ findOnes n

findOnes n = findOnes' (printf "%b" n) 0
findOnes' [] max = max
findOnes' n max =
    let (x,y) = span (== '1') n
        (x2, y2) = span (== '0') y in
        if length x > max then findOnes' y2 (length x)
            else findOnes' y2 max
