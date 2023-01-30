module Text.PrettyPrint.Bernardy.ANSI

import public Text.PrettyPrint.Bernardy
import public Text.ANSI
import Text.PrettyPrint.Bernardy.Core.ANSI

%default total

||| Decorate a `Doc` with the given ANSI codes *without*
||| changing its stats like width or height.
export
decorate : {opts : _} -> List SGR -> Doc opts -> Doc opts
decorate sgrs doc = doc >>= \l => pure (decorateLayout sgrs l)
