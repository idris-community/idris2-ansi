module Text.ANSI

import public Text.ANSI.CSI
import public Text.ANSI.SGR

%default total

public export
record DecoratedString where
  constructor MkDString
  sgr : List SGR
  str : String

export
Show DecoratedString where
  show dstr = escapeSGR dstr.sgr ++ dstr.str ++ escapeSGR [Reset]

export
fromString : String -> DecoratedString
fromString = MkDString []

export
addSGR : SGR -> DecoratedString -> DecoratedString
addSGR sgr (MkDString sgrs str) = MkDString (sgr :: sgrs) str

export
colored : Color -> DecoratedString -> DecoratedString
colored c = addSGR $ SetForeground c

export
background : Color -> DecoratedString -> DecoratedString
background c = addSGR $ SetBackground c

export
bolden : DecoratedString -> DecoratedString
bolden = addSGR $ SetStyle Bold

export
italicize : DecoratedString -> DecoratedString
italicize = addSGR $ SetStyle Italic

export
underline : DecoratedString -> DecoratedString
underline = addSGR $ SetStyle SingleUnderline
