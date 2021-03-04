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
  
  ; unique structure and module name to prevent potential naming conflicts
  ; during builds. not accessed inside the module to reduce the build size.
  ; externally only the name "OOLaboratories_FastPoke" can be seen.

  Structure OOLaboratories_FastPoke
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
  
  DeclareModule OOLaboratories_FastPoke
    
    Macro Macr0ExpandedCount
      MacroExpandedCount
    EndMacro
    
    Macro FastPoke(UniqueID, Type, MemoryBuffer, Number)
      CompilerIf #PB_Compiler_Procedure = ""
        Define *OOLaboratories_FastPoke_#UniqueID.OOLaboratories_FastPoke = MemoryBuffer
      CompilerElse
        Protected *OOLaboratories_FastPoke_#UniqueID.OOLaboratories_FastPoke = MemoryBuffer
      CompilerEndIf
      *OOLaboratories_FastPoke_#UniqueID\Type = Number
    EndMacro
    
  EndDeclareModule : Module OOLaboratories_FastPoke : EndModule
  
  Macro PokeB(MemoryBuffer, Number)
    OOLaboratories_FastPoke::FastPoke(OOLaboratories_FastPoke::Macr0ExpandedCount, B, MemoryBuffer, Number)
  EndMacro
  
  Macro PokeA(MemoryBuffer, Number)
    OOLaboratories_FastPoke::FastPoke(OOLaboratories_FastPoke::Macr0ExpandedCount, A, MemoryBuffer, Number)
  EndMacro
  
  Macro PokeC(MemoryBuffer, Number)
    OOLaboratories_FastPoke::FastPoke(OOLaboratories_FastPoke::Macr0ExpandedCount, C, MemoryBuffer, Number)
  EndMacro
  
  Macro PokeW(MemoryBuffer, Number)
    OOLaboratories_FastPoke::FastPoke(OOLaboratories_FastPoke::Macr0ExpandedCount, W, MemoryBuffer, Number)
  EndMacro
  
  Macro PokeU(MemoryBuffer, Number)
    OOLaboratories_FastPoke::FastPoke(OOLaboratories_FastPoke::Macr0ExpandedCount, U, MemoryBuffer, Number)
  EndMacro
  
  Macro PokeL(MemoryBuffer, Number)
    OOLaboratories_FastPoke::FastPoke(OOLaboratories_FastPoke::Macr0ExpandedCount, L, MemoryBuffer, Number)
  EndMacro
  
  Macro PokeI(MemoryBuffer, Number)
    OOLaboratories_FastPoke::FastPoke(OOLaboratories_FastPoke::Macr0ExpandedCount, I, MemoryBuffer, Number)
  EndMacro
  
  Macro PokeF(MemoryBuffer, Number)
    OOLaboratories_FastPoke::FastPoke(OOLaboratories_FastPoke::Macr0ExpandedCount, F, MemoryBuffer, Number)
  EndMacro
  
  Macro PokeQ(MemoryBuffer, Number)
    OOLaboratories_FastPoke::FastPoke(OOLaboratories_FastPoke::Macr0ExpandedCount, Q, MemoryBuffer, Number)
  EndMacro
  
  ; this is often slightly slower in the benchmarks (PureBasic 5.73 LTS x64).
  ; Macro FPokeD(MemoryBuffer, Number)
  ;   OOLaboratories_FastPoke::FastPoke(OOLaboratories_FastPoke::Macr0ExpandedCount, D, MemoryBuffer, Number)
  ; EndMacro
  
CompilerEndIf
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 87
; FirstLine = 45
; Folding = ---
; EnableXP