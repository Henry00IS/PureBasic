;==============================================================================
; ** FastPoke.pb
;------------------------------------------------------------------------------
;  This module optimizes most PokeX() commands in PureBasic.
;  http://00laboratories.com/
;==============================================================================

; Every PokeX() command in PureBasic is a procedure call and will have some
; overhead because of it. These macros will replace those procedure calls
; with a simple structure assignment, which will compile down to simple MOV
; instructions in assembly. Every PokeX() procedure will have its own variable.
;
; Simply including this file and compiling your program is enough to gain a
; performance improvement if you use these procedures a lot.
;
; See FastPokeBenchmark.pb for more details and timing information.

CompilerIf #PB_Compiler_Debugger = 0 ; the debugger must be off to be faster.
  
  Structure FastPoke
    StructureUnion
      B.b
      A.a
      C.c
      W.w
      U.u
      L.l
      I.i
      F.f
      Q.q
      D.d
    EndStructureUnion
  EndStructure
  
  Macro PokeB(MemoryBuffer, Number)
    Protected *FastPokeB#MacroExpandedCount.FastPoke = MemoryBuffer
    *FastPokeB#MacroExpandedCount\B = Number
  EndMacro
  
  Macro PokeA(MemoryBuffer, Ascii)
    Protected *FastPokeA#MacroExpandedCount.FastPoke = MemoryBuffer
    *FastPokeA#MacroExpandedCount\A = Ascii
  EndMacro
  
  Macro PokeC(MemoryBuffer, Character)
    Protected *FastPokeC#MacroExpandedCount.FastPoke = MemoryBuffer
    *FastPokeC#MacroExpandedCount\C = Character
  EndMacro
  
  Macro PokeW(MemoryBuffer, Number)
    Protected *FastPokeW#MacroExpandedCount.FastPoke = MemoryBuffer
    *FastPokeW#MacroExpandedCount\W = Number
  EndMacro
  
  Macro PokeU(MemoryBuffer, Unicode)
    Protected *FastPokeU#MacroExpandedCount.FastPoke = MemoryBuffer
    *FastPokeU#MacroExpandedCount\U = Unicode
  EndMacro
  
  Macro PokeL(MemoryBuffer, Number)
    Protected *FastPokeL#MacroExpandedCount.FastPoke = MemoryBuffer
    *FastPokeL#MacroExpandedCount\L = Number
  EndMacro
  
  Macro PokeI(MemoryBuffer, Number)
    Protected *FastPokeI#MacroExpandedCount.FastPoke = MemoryBuffer
    *FastPokeI#MacroExpandedCount\I = Number
  EndMacro
  
  Macro PokeF(MemoryBuffer, Number)
    Protected *FastPokeF#MacroExpandedCount.FastPoke = MemoryBuffer
    *FastPokeF#MacroExpandedCount\F = Number
  EndMacro
  
  Macro PokeQ(MemoryBuffer, Quad)
    Protected *FastPokeQ#MacroExpandedCount.FastPoke = MemoryBuffer
    *FastPokeQ#MacroExpandedCount\Q = Quad
  EndMacro
  
  ; this is slightly slower in the benchmarks (PureBasic 5.73 LTS x64).
  ;Macro PokeD(MemoryBuffer, Double)
  ;  Protected *FastPokeD#MacroExpandedCount.FastPoke = MemoryBuffer
  ;  *FastPokeD#MacroExpandedCount\D = Double
  ;EndMacro

CompilerEndIf
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 18
; Folding = --
; EnableXP