module Text.PrettyPrint.Bernardy.Core.ANSI

import Data.DPair
import Text.PrettyPrint.Bernardy.Core
import Text.ANSI

%default total

reset : String
reset = escapeSGR [Reset]

decorateImpl :
     String
  -> (ss : SnocList String)
  -> {auto 0 prf : NonEmptySnoc ss}
  -> Subset (SnocList String) NonEmptySnoc
decorateImpl s [<x]      = Element [<s ++ x ++ reset] %search
decorateImpl s (sx :< x) = Element (go [] sx :< (x ++ reset)) %search
  where
    go : List String -> SnocList String -> SnocList String
    go strs [< x]     = [< s ++ x] <>< strs
    go strs (sx :< x) = go (x :: strs) sx
    go strs [<]       = [<] <>< strs

||| Decorate a `Layout` with the given ANSI codes *without*
||| changing its stats like width or height.
export
decorateLayout : List SGR -> Layout -> Layout
decorateLayout [] l = l
decorateLayout xs (MkLayout content stats) =
  layout (decorateImpl (escapeSGR xs) content) stats
