import Data.List.Split (splitOn)
import Data.List

pad n s | r > 0     = s ++ replicate r ' '
        | otherwise = s
        where r = n - length s

pad_cells sheet =
    let ns= map (maximum . map length) $ transpose sheet
    in map (zipWith pad ns) sheet

reformat = map (concat . intersperse " # ") . pad_cells
main = interact $ unlines . reformat . (map (splitOn "#") ) . lines
