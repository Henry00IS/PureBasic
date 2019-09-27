;==============================================================================
; ** StringConverter.pb
;------------------------------------------------------------------------------
;  This module adds methods to easily convert between different string formats.
;  http://00laboratories.com/
;==============================================================================

DeclareModule StringConverter
  Declare.s ToAscii(String.s)       ; converts unicode to ascii.
  Declare.s ToUtf8(String.s)        ; converts unicode to utf8.
	Declare.s FromAsciiPtr(*String)   ; converts ascii string at pointer to unicode.
	Declare.s FromUtf8Ptr(*String)    ; converts utf8 string at pointer to unicode.
	Declare.s FromAscii(String.s)     ; converts ascii string to unicode.
	Declare.s FromUtf8(String.s)      ; converts utf8 string to unicode.
EndDeclareModule

Module StringConverter
  EnableExplicit

  ; converts unicode to ascii.
  Procedure.s ToAscii(String.s)
    ; every unicode space is always 2 bytes. we also need a null terminator.
    ; "" is Len() of 0 /2 is 0 + 1 is 2 bytes "."
    ; "H" is Len() of 1 /2 is 0 + 1 is 2 bytes "H."
    ; "He" is Len() of 2 /2 is 1 + 1 is 4 bytes "He."
    ; "Hel" is Len() of 3 /2 is 1 + 1 is 4 bytes "Hel."
    ; "Hell" is Len() of 4 /2 is 2 + 1 is 6 bytes "Hell."
    ; "Hello" is Len() of 5 /2 is 2 + 1 is 6 bytes "Hello."
    Protected Result.s = Space((Len(String) / 2) + 1)
    PokeS(@Result, String, #PB_Any, #PB_Ascii)
    ProcedureReturn Result
  EndProcedure
  
  ; converts unicode to utf8.
  Procedure.s ToUtf8(String.s)
    ; every unicode space is always 2 bytes. we also need a null terminator.
    ; we create a unicode string long enough to hold every utf8 byte.
    Protected *Utf8 = UTF8(String) ; convert the unicode string to utf8.
    Protected Result.s = Space((MemorySize(*Utf8) / 2) + 1)
    CopyMemory(*Utf8, @Result, MemorySize(*Utf8))
    FreeMemory(*Utf8)
    ProcedureReturn Result
  EndProcedure
  
  ; converts ascii string at pointer to unicode.
	Procedure.s FromAsciiPtr(*String)
		ProcedureReturn PeekS(*String, #PB_Any, #PB_Ascii)
	EndProcedure
	
	; converts utf8 string at pointer to unicode.
	Procedure.s FromUtf8Ptr(*String)
		ProcedureReturn PeekS(*String, #PB_Any, #PB_UTF8)
	EndProcedure

	; converts ascii string to unicode.
	Procedure.s FromAscii(String.s)
		ProcedureReturn PeekS(@String, #PB_Any, #PB_Ascii)
	EndProcedure
	
	; converts utf8 string to unicode.
	Procedure.s FromUtf8(String.s)
		ProcedureReturn PeekS(@String, #PB_Any, #PB_UTF8)
	EndProcedure
EndModule
; IDE Options = PureBasic 5.71 LTS (Windows - x86)
; CursorPosition = 63
; FirstLine = 22
; Folding = --
; EnableXP