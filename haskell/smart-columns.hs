import Data.List.Split (splitOn)
import Data.List
import System.Environment

pad n s = take n $ s ++ repeat ' '

main = do
    args <- getArgs
    let sep     = (args ++ ["#"]) !! 0
        between = " " ++ sep ++ " "
        reformat sheet =
            let ns= map (maximum . map length)    $ transpose sheet
            in map (concat . intersperse between . zipWith pad ns) sheet
    interact $ unlines . reformat . map (splitOn sep) . lines
