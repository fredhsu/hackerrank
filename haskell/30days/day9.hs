import           Control.Applicative
import           Control.Monad
import           Data.Map            (Map)
import qualified Data.Map            as Map
import           System.IO

main :: IO ()
main = do
    n_temp <- getLine
    let n = read n_temp :: Int
    print $ factorial n

factorial n
    | n <= 1 = 1
    | otherwise = n * factorial (n - 1)
