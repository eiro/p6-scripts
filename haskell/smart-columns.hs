import Data.List.Split (splitOn)
import Data.List
import System.Environment

pad n s | r > 0     = s ++ replicate r ' '
        | otherwise = s
        where r = n - length s

main = do
    args <- getArgs
    let sep     = (args ++ ["#"]) !! 0
        between = " " ++ sep ++ " "
        reformat sheet =
            let ns= map (maximum . map length)    $ transpose sheet
            in map (concat . intersperse between) $ map (zipWith pad ns) sheet
    print sep
    interact $ unlines . reformat . (map $ splitOn sep) . lines
