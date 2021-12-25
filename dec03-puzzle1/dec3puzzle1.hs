import System.Environment
import Data.Char

main = do
    content <- readFile "input"
    let input_lines = lines $ content
    putStrLn (show (tproduct (get_gamma_epsilon (process_line input_lines ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 0)))))

process_line :: [String] -> ([Int], Int) -> ([Int], Int)
process_line [] (b, c)      = (b, c)
process_line (a:ax) (b, c)  = do
  let (d, e) = process_line ax (b, c)
  (read_line (zip a d), e + 1)

read_line :: [(Char, Int)] -> [Int]
read_line []            = []
read_line (('1', x):xs) = [(x + 1)] ++ (read_line xs)
read_line (('0', x):xs) = [x] ++ (read_line xs)

get_gamma_epsilon :: ([Int], Int) -> (Int, Int, Int)
get_gamma_epsilon ([], _)     = (0, 0, 0)
get_gamma_epsilon ((x:xs), y) = if x > (div y 2)
  then do
    let (a, b, c) = get_gamma_epsilon (xs, y)
    (a + (2 ^ c), b, c + 1)
  else do
    let (a, b, c) = get_gamma_epsilon (xs, y)
    (a, b + (2 ^ c), c + 1)


tproduct :: (Int, Int, Int) -> Int
tproduct (a, b, c) = a * b