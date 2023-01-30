module Text.PrettyPrint.Bernardy.Core.ANSI

import Text.PrettyPrint.Bernardy.Core
import Text.ANSI

%default total

reset : String
reset = escapeSGR [Reset]

||| Decorate a `Layout` with the given ANSI codes *without*
||| changing its stats like width or height.
export
decorateLayout : List SGR -> Layout -> Layout
decorateLayout xs (MkLayout content stats) =
  MkLayout (([< escapeSGR xs] ++ content) :< reset) stats
