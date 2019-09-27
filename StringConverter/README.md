# PureBasic String Converter
This module adds methods to easily convert between different string formats.

Through clever string usage PureBasic handles all of the string memory management and cleanup.

## Procedures

```PureBasic
Procedure.s StringConverter::ToAscii(String.s)     ; converts unicode to ascii.
Procedure.s StringConverter::ToUtf8(String.s)      ; converts unicode to utf8.
Procedure.s StringConverter::FromAsciiPtr(*String) ; converts ascii string at pointer to unicode.
Procedure.s StringConverter::FromUtf8Ptr(*String)  ; converts utf8 string at pointer to unicode.
Procedure.s StringConverter::FromAscii(String.s)   ; converts ascii string to unicode.
Procedure.s StringConverter::FromUtf8(String.s)    ; converts utf8 string to unicode.
```

## Implementation Details
PureBasic moved on to having Unicode executables. MessageBoxW instead of MessageBoxA. This means every string is now by default: Unicode. If you pass "Hello World" to a program it's actually "H.e.l.l.o. .W.o.r.l.d." where dots are zero. If you wish to pass in an Ascii string you can use PokeS to write an ascii string into a memory buffer. You can use Ascii(Str) that returns a memory buffer with the Ascii string inside. You have to clean this up yourself.

Instead of dealing with memory manually I decided to (in case of Unicode to Ascii) create a regular Unicode string. I count the amount of real characters so "Hello" would be 5. I know that a Unicode space character " " is 2 bytes long. I divide the amount of characters 5 by 2 to get 2 (rounded down) and add one for the null terminator. So it creates a unicode string with 3 spaces which is 6 bytes. Now I write the Ascii representation of 5 bytes + null terminator directly into the memory of the 6 byte string using PokeS that converts unicode to ascii. Now you have a string "Hello." that you can pass to an API expecting an Ascii string. And because to PureBasic it's a regular 3 length string it will automatically handle garbage collection and memory management.

Here is an example with Unicode to Ascii:

```
every unicode space is always 2 bytes. we also need a null terminator.
"" is Len() of 0 /2 is 0 + 1 is 2 bytes "."
"H" is Len() of 1 /2 is 0 + 1 is 2 bytes "H."
"He" is Len() of 2 /2 is 1 + 1 is 4 bytes "He."
"Hel" is Len() of 3 /2 is 1 + 1 is 4 bytes "Hel."
"Hell" is Len() of 4 /2 is 2 + 1 is 6 bytes "Hell."
"Hello" is Len() of 5 /2 is 2 + 1 is 6 bytes "Hello."
```
