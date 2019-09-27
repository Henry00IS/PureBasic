# PureBasic String Converter
This module adds methods to easily convert between different string formats.

It uses PureBasic's Prototype Pseudotypes (p-ascii, p-utf8, p-bstr, p-unicode) for the conversion. This allows PureBasic to handle all of the string memory management and cleanup.

```PureBasic

Procedure.l StringConverter::ToAscii(String.s)
Procedure.l StringConverter::ToUnicode(String.s)
Procedure.l StringConverter::ToUtf8(String.s)
Procedure.l StringConverter::ToBstr(String.s)
Procedure.s StringConverter::FromAscii(*String)
Procedure.s StringConverter::FromUnicode(*String)
Procedure.s StringConverter::FromUtf8(*String)
Procedure.s StringConverter::FromBstr(*String)
```