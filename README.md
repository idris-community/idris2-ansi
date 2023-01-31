# idris2-ansi: ANSI Escape Sequences in Idris

This is a small library providing the necessary
[ANSI escape sequences](https://en.wikipedia.org/wiki/ANSI_escape_code)
for colored and otherwise highlited terminal output, as well as moving
the cursor to arbitrary positions in the terminal.

The modules in library *ansi* where originally part of the
[contrib](https://github.com/idris-lang/Idris2/tree/main/libs/contrib) package of the
main Idris2 project.

In addition, a second library (*prettier-ansi*) is provided, for using
colored output with the Bernardy-style pretty printer from the
[prettier](https://github.com/Z-snails/prettier) library.
