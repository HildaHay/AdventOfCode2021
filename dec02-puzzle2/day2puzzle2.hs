import System.Environment

main = do
    content <- readFile "input"
    let input_lines = lines $ content
    putStrLn (show (tproduct (process_line input_lines (0, 0, 0))))

process_line :: [String] -> (Int, Int, Int) -> (Int, Int, Int)
process_line (x:xs) (position, depth, aim) = process_line xs (update_values ((words x) !! 0) ((words x) !! 1) (position, depth, aim))
process_line [] (position, depth, aim)     = (position, depth, aim)

update_values :: String -> String -> (Int, Int, Int) -> (Int, Int, Int)
update_values "forward" val (position, depth, aim)  = (position + (read val :: Int), depth + (aim * (read val :: Int)), aim)
update_values "down" val (position, depth, aim)     = (position, depth, aim + (read val :: Int))
update_values "up" val (position, depth, aim)       = (position, depth, aim - (read val :: Int))
update_values _ val (position, depth, aim)          = (position, depth, aim)

tproduct :: (Int, Int, Int) -> Int
tproduct (a, b, c) = a * b