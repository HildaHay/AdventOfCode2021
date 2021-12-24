import System.Environment

main = do
    content <- readFile "input"
    let input_lines = lines $ content
    putStrLn (show (tproduct (process_line input_lines (0, 0))))

process_line :: [String] -> (Int, Int) -> (Int, Int)
process_line (x:xs) (position, depth) = process_line xs (update_values ((words x) !! 0) ((words x) !! 1) position depth)
process_line [] (position, depth)   = (position, depth)

update_values :: String -> String -> Int -> Int -> (Int, Int)
update_values "forward" val position depth = (position + (read val :: Int), depth)
update_values "down" val position depth    = (position, depth + (read val :: Int))
update_values "up" val position depth      = (position, depth - (read val :: Int))
update_values _ val position depth         = (position, depth)

tproduct :: (Int, Int) -> Int
tproduct (a, b) = a * b