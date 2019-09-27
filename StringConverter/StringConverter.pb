;==============================================================================
; ** StringConverter.pb
;------------------------------------------------------------------------------
;  This module adds methods to easily convert between different string formats.
;  http://00laboratories.com/
;==============================================================================

DeclareModule StringConverter
	Declare.l ToAscii(String.s)
	Declare.l ToUnicode(String.s)
	Declare.l ToUtf8(String.s)
	Declare.l ToBstr(String.s)
	Declare.s FromAscii(*String)
	Declare.s FromUnicode(*String)
	Declare.s FromUtf8(*String)
	Declare.s FromBstr(*String)
EndDeclareModule

Module StringConverter
	Procedure.s __Implementation_ReturnStr(String$) : ProcedureReturn String$ : EndProcedure
	
	Prototype.l __Prototype_StrToAscii(Str.p-ascii)
	Global StrToAscii.__Prototype_StrToAscii = @__Implementation_ReturnStr()

	Procedure.l ToAscii(String$)
		ProcedureReturn StrToAscii(String$)
	EndProcedure
	
	Prototype.l __Prototype_StrToUnicode(Str.p-unicode)
	Global StrToUnicode.__Prototype_StrToUnicode = @__Implementation_ReturnStr()

	Procedure.l ToUnicode(String$)
		ProcedureReturn StrToUnicode(String$)
	EndProcedure
	
	Prototype.l __Prototype_StrToUtf8(Str.p-utf8)
	Global StrToUtf8.__Prototype_StrToUtf8 = @__Implementation_ReturnStr()

	Procedure.l ToUtf8(String$)
		ProcedureReturn StrToUtf8(String$)
	EndProcedure
	
	Prototype.l __Prototype_StrToBstr(Str.p-bstr)
	Global StrToBstr.__Prototype_StrToBstr = @__Implementation_ReturnStr()

	Procedure.l ToBstr(String$)
		ProcedureReturn StrToBstr(String$)
	EndProcedure
	
	Procedure.s FromAscii(*String)
		ProcedureReturn PeekS(*String, #PB_Any, #PB_Ascii)
	EndProcedure
	
	Procedure.s FromUnicode(*String)
		ProcedureReturn PeekS(*String, #PB_Any, #PB_Unicode)
	EndProcedure
	
	Procedure.s FromUtf8(*String)
		ProcedureReturn PeekS(*String, #PB_Any, #PB_UTF8)
	EndProcedure
		
	Procedure.s FromBstr(*String)
		ProcedureReturn PeekS(*String)
	EndProcedure
EndModule
; IDE Options = PureBasic 5.71 LTS (Windows - x86)
; CursorPosition = 7
; Folding = --
; EnableXP