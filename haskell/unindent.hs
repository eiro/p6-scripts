--
-- remove the level of indentation found in the first line of the flow.
--
-- the "jade from vim" companion: 
--   :.!unindent|jade

import Data.Char

remargin (x:xs) =
    [content] ++ map (drop len) xs
    where
        len       = length $ takeWhile isSpace x
        content   = dropWhile isSpace x

main = interact $ unlines . remargin . lines
