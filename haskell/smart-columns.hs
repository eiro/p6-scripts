import Data.List.Split (splitOn)
import Data.List

pad n s | r > 0     = s ++ replicate r ' '
        | otherwise = s
        where r = n - length s

reformat sheet =
    let ns= map (maximum . map length)  $ transpose sheet
    in map (concat . intersperse " # ") $ map (zipWith pad ns) sheet

main = interact $ unlines . reformat . (map (splitOn "#") ) . lines
