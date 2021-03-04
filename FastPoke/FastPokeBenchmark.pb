;==============================================================================
; ** FastPokeBenchmark.pb
;------------------------------------------------------------------------------
;  This benchmark will prove the performance increase.
;  http://00laboratories.com/
;==============================================================================
DisableDebugger

; PureBasic 5.73 LTS (x64):
; PokeB: 1.681286931ms
; FPokeB: 1.408649087ms
; PokeA: 1.6890699863ms
; FPokeA: 1.4598430395ms
; PokeC: 1.6728429794ms
; FPokeC: 1.4465870857ms
; PokeW: 1.713842988ms
; FPokeW: 1.438740015ms
; PokeU: 1.7266880274ms
; FPokeU: 1.4443279505ms
; PokeI: 1.7178840637ms
; FPokeI: 1.4886960983ms
; PokeF: 1.6498479843ms
; FPokeF: 1.4606429338ms
; PokeQ: 1.6921709776ms
; FPokeQ: 1.4533859491ms
; PokeD: 1.6613630056ms
; FPokeD: 1.6624130011ms (often slower!)

Procedure.q ElapsedMicroseconds()
  Static Supported.a = #True
  Static Frequency.q = 0
  Static BeginTime.q = 0
  
  ; Initialize HPC, get frequency information.
  If Frequency = 0 And Supported = #True
    ; This function fails on hardware without HPC support.
    If Not QueryPerformanceFrequency_(@Frequency)
      Supported = #False
      BeginTime = ElapsedMilliseconds()
    Else
      QueryPerformanceCounter_(@BeginTime)
    EndIf
  EndIf
  
  Protected Counter.q
  If Supported
    QueryPerformanceCounter_(@Counter)
    Counter - BeginTime
    Counter * 1000000
    Counter / Frequency
    ProcedureReturn Counter
  Else
    Counter = ElapsedMilliseconds()
    Counter - BeginTime
    Counter * 1000
    ProcedureReturn Counter
  EndIf
EndProcedure

;------------------------------------------------------------------------------

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

Macro FPokeB(MemoryBuffer, Number)
  OOLaboratories_FastPoke::FastPoke(OOLaboratories_FastPoke::Macr0ExpandedCount, B, MemoryBuffer, Number)
EndMacro

Macro FPokeA(MemoryBuffer, Number)
  OOLaboratories_FastPoke::FastPoke(OOLaboratories_FastPoke::Macr0ExpandedCount, A, MemoryBuffer, Number)
EndMacro

Macro FPokeC(MemoryBuffer, Number)
  OOLaboratories_FastPoke::FastPoke(OOLaboratories_FastPoke::Macr0ExpandedCount, C, MemoryBuffer, Number)
EndMacro

Macro FPokeW(MemoryBuffer, Number)
  OOLaboratories_FastPoke::FastPoke(OOLaboratories_FastPoke::Macr0ExpandedCount, W, MemoryBuffer, Number)
EndMacro

Macro FPokeU(MemoryBuffer, Number)
  OOLaboratories_FastPoke::FastPoke(OOLaboratories_FastPoke::Macr0ExpandedCount, U, MemoryBuffer, Number)
EndMacro

Macro FPokeL(MemoryBuffer, Number)
  OOLaboratories_FastPoke::FastPoke(OOLaboratories_FastPoke::Macr0ExpandedCount, L, MemoryBuffer, Number)
EndMacro

Macro FPokeI(MemoryBuffer, Number)
  OOLaboratories_FastPoke::FastPoke(OOLaboratories_FastPoke::Macr0ExpandedCount, I, MemoryBuffer, Number)
EndMacro

Macro FPokeF(MemoryBuffer, Number)
  OOLaboratories_FastPoke::FastPoke(OOLaboratories_FastPoke::Macr0ExpandedCount, F, MemoryBuffer, Number)
EndMacro

Macro FPokeQ(MemoryBuffer, Number)
  OOLaboratories_FastPoke::FastPoke(OOLaboratories_FastPoke::Macr0ExpandedCount, Q, MemoryBuffer, Number)
EndMacro

Macro FPokeD(MemoryBuffer, Number)
  OOLaboratories_FastPoke::FastPoke(OOLaboratories_FastPoke::Macr0ExpandedCount, D, MemoryBuffer, Number)
EndMacro
;------------------------------------------------------------------------------

Procedure Test()
  Protected TestB.b
  Protected TestA.a
  Protected TestC.c
  Protected TestW.w
  Protected TestU.u
  Protected TestL.l
  Protected TestI.i
  Protected TestF.f
  Protected TestQ.q
  Protected TestD.d
  
  FPokeB(@TestB, 123) : If TestB = 123 : PrintN("FPokeB OK") : Else : PrintN("FpokeB ERROR") : EndIf
  FPokeA(@TestA, 123) : If TestA = 123 : PrintN("FPokeA OK") : Else : PrintN("FpokeA ERROR") : EndIf
  FPokeC(@TestC, 123) : If TestC = 123 : PrintN("FPokeC OK") : Else : PrintN("FpokeC ERROR") : EndIf
  FPokeW(@TestW, 123) : If TestW = 123 : PrintN("FPokeW OK") : Else : PrintN("FpokeW ERROR") : EndIf
  FPokeU(@TestU, 123) : If TestU = 123 : PrintN("FPokeU OK") : Else : PrintN("FpokeU ERROR") : EndIf
  FPokeL(@TestL, 123) : If TestL = 123 : PrintN("FPokeL OK") : Else : PrintN("FpokeL ERROR") : EndIf
  FPokeI(@TestI, 123) : If TestI = 123 : PrintN("FPokeI OK") : Else : PrintN("FpokeI ERROR") : EndIf
  FPokeF(@TestF, 123) : If TestF = 123 : PrintN("FPokeF OK") : Else : PrintN("FpokeF ERROR") : EndIf
  FPokeQ(@TestQ, 123) : If TestQ = 123 : PrintN("FPokeQ OK") : Else : PrintN("FpokeQ ERROR") : EndIf
  FPokeD(@TestD, 123) : If TestD = 123 : PrintN("FPokeD OK") : Else : PrintN("FpokeD ERROR") : EndIf
  PrintN("-------------------------------------------")
  FPokeB(@TestB, 125) : If TestB = 125 : PrintN("FPokeB OK") : Else : PrintN("FpokeB ERROR") : EndIf
  FPokeA(@TestA, 175) : If TestA = 175 : PrintN("FPokeA OK") : Else : PrintN("FpokeA ERROR") : EndIf
  FPokeC(@TestC, 175) : If TestC = 175 : PrintN("FPokeC OK") : Else : PrintN("FpokeC ERROR") : EndIf
  FPokeW(@TestW, 175) : If TestW = 175 : PrintN("FPokeW OK") : Else : PrintN("FpokeW ERROR") : EndIf
  FPokeU(@TestU, 175) : If TestU = 175 : PrintN("FPokeU OK") : Else : PrintN("FpokeU ERROR") : EndIf
  FPokeL(@TestL, 175) : If TestL = 175 : PrintN("FPokeL OK") : Else : PrintN("FpokeL ERROR") : EndIf
  FPokeI(@TestI, 175) : If TestI = 175 : PrintN("FPokeI OK") : Else : PrintN("FpokeI ERROR") : EndIf
  FPokeF(@TestF, 175) : If TestF = 175 : PrintN("FPokeF OK") : Else : PrintN("FpokeF ERROR") : EndIf
  FPokeQ(@TestQ, 175) : If TestQ = 175 : PrintN("FPokeQ OK") : Else : PrintN("FpokeQ ERROR") : EndIf
  FPokeD(@TestD, 175) : If TestD = 175 : PrintN("FPokeD OK") : Else : PrintN("FpokeD ERROR") : EndIf
  PrintN("-------------------------------------------")
  FPokeB(@TestB, 112) : If TestB = 112 : PrintN("FPokeB OK") : Else : PrintN("FpokeB ERROR") : EndIf
  FPokeA(@TestA, 112) : If TestA = 112 : PrintN("FPokeA OK") : Else : PrintN("FpokeA ERROR") : EndIf
  FPokeC(@TestC, 112) : If TestC = 112 : PrintN("FPokeC OK") : Else : PrintN("FpokeC ERROR") : EndIf
  FPokeW(@TestW, 112) : If TestW = 112 : PrintN("FPokeW OK") : Else : PrintN("FpokeW ERROR") : EndIf
  FPokeU(@TestU, 112) : If TestU = 112 : PrintN("FPokeU OK") : Else : PrintN("FpokeU ERROR") : EndIf
  FPokeL(@TestL, 112) : If TestL = 112 : PrintN("FPokeL OK") : Else : PrintN("FpokeL ERROR") : EndIf
  FPokeI(@TestI, 112) : If TestI = 112 : PrintN("FPokeI OK") : Else : PrintN("FpokeI ERROR") : EndIf
  FPokeF(@TestF, 112) : If TestF = 112 : PrintN("FPokeF OK") : Else : PrintN("FpokeF ERROR") : EndIf
  FPokeQ(@TestQ, 112) : If TestQ = 112 : PrintN("FPokeQ OK") : Else : PrintN("FpokeQ ERROR") : EndIf
  FPokeD(@TestD, 112) : If TestD = 112 : PrintN("FPokeD OK") : Else : PrintN("FpokeD ERROR") : EndIf
  PrintN("-------------------------------------------")
EndProcedure

Procedure Benchmark()
  Protected TestB.b
  Protected TestA.a
  Protected TestC.c
  Protected TestW.w
  Protected TestU.u
  Protected TestL.l
  Protected TestI.i
  Protected TestF.f
  Protected TestQ.q
  Protected TestD.d
  
  Protected I.l, J.l
  Protected B1.l, B2.l, AVG1.f
  Protected E1.l, E2.l, AVG2.f
  
  For J = 1 To 100
    B1 = ElapsedMicroseconds() : For I = 0 To 10000000 : PokeB(@TestB, 123) : Next : E1 = ElapsedMicroseconds()
    B2 = ElapsedMicroseconds() : For I = 0 To 10000000 : FPokeB(@TestB, 123) : Next : E2 = ElapsedMicroseconds()
    AVG1 + (E1 - B1) : AVG2 + (E2 - B2)
  Next
  AVG1 / 1000.0 : AVG2 / 1000.0 : PrintN("PokeB: " + StrF(AVG1 / 1000) + "ms") : PrintN("FPokeB: " + StrF(AVG2 / 1000) + "ms") : AVG1 = 0 : AVG2 = 0
  
  For J = 1 To 100
    B1 = ElapsedMicroseconds() : For I = 0 To 10000000 : PokeA(@TestA, 123) : Next : E1 = ElapsedMicroseconds()
    B2 = ElapsedMicroseconds() : For I = 0 To 10000000 : FPokeA(@TestA, 123) : Next : E2 = ElapsedMicroseconds()
    AVG1 + (E1 - B1) : AVG2 + (E2 - B2)
  Next
  AVG1 / 1000.0 : AVG2 / 1000.0 : PrintN("PokeA: " + StrF(AVG1 / 1000) + "ms") : PrintN("FPokeA: " + StrF(AVG2 / 1000) + "ms") : AVG1 = 0 : AVG2 = 0
  
  For J = 1 To 100
    B1 = ElapsedMicroseconds() : For I = 0 To 10000000 : PokeC(@TestC, 123) : Next : E1 = ElapsedMicroseconds()
    B2 = ElapsedMicroseconds() : For I = 0 To 10000000 : FPokeC(@TestC, 123) : Next : E2 = ElapsedMicroseconds()
    AVG1 + (E1 - B1) : AVG2 + (E2 - B2)
  Next
  AVG1 / 1000.0 : AVG2 / 1000.0 : PrintN("PokeC: " + StrF(AVG1 / 1000) + "ms") : PrintN("FPokeC: " + StrF(AVG2 / 1000) + "ms") : AVG1 = 0 : AVG2 = 0
  
  For J = 1 To 100
    B1 = ElapsedMicroseconds() : For I = 0 To 10000000 : PokeW(@TestW, 123) : Next : E1 = ElapsedMicroseconds()
    B2 = ElapsedMicroseconds() : For I = 0 To 10000000 : FPokeW(@TestW, 123) : Next : E2 = ElapsedMicroseconds()
    AVG1 + (E1 - B1) : AVG2 + (E2 - B2)
  Next
  AVG1 / 1000.0 : AVG2 / 1000.0 : PrintN("PokeW: " + StrF(AVG1 / 1000) + "ms") : PrintN("FPokeW: " + StrF(AVG2 / 1000) + "ms") : AVG1 = 0 : AVG2 = 0
  
  For J = 1 To 100
    B1 = ElapsedMicroseconds() : For I = 0 To 10000000 : PokeU(@TestU, 123) : Next : E1 = ElapsedMicroseconds()
    B2 = ElapsedMicroseconds() : For I = 0 To 10000000 : FPokeU(@TestU, 123) : Next : E2 = ElapsedMicroseconds()
    AVG1 + (E1 - B1) : AVG2 + (E2 - B2)
  Next
  AVG1 / 1000.0 : AVG2 / 1000.0 : PrintN("PokeU: " + StrF(AVG1 / 1000) + "ms") : PrintN("FPokeU: " + StrF(AVG2 / 1000) + "ms") : AVG1 = 0 : AVG2 = 0
  
  For J = 1 To 100
    B1 = ElapsedMicroseconds() : For I = 0 To 10000000 : PokeI(@TestI, 123) : Next : E1 = ElapsedMicroseconds()
    B2 = ElapsedMicroseconds() : For I = 0 To 10000000 : FPokeI(@TestI, 123) : Next : E2 = ElapsedMicroseconds()
    AVG1 + (E1 - B1) : AVG2 + (E2 - B2)
  Next
  AVG1 / 1000.0 : AVG2 / 1000.0 : PrintN("PokeI: " + StrF(AVG1 / 1000) + "ms") : PrintN("FPokeI: " + StrF(AVG2 / 1000) + "ms") : AVG1 = 0 : AVG2 = 0
  
  For J = 1 To 100
    B1 = ElapsedMicroseconds() : For I = 0 To 10000000 : PokeF(@TestF, 123) : Next : E1 = ElapsedMicroseconds()
    B2 = ElapsedMicroseconds() : For I = 0 To 10000000 : FPokeF(@TestF, 123) : Next : E2 = ElapsedMicroseconds()
    AVG1 + (E1 - B1) : AVG2 + (E2 - B2)
  Next
  AVG1 / 1000.0 : AVG2 / 1000.0 : PrintN("PokeF: " + StrF(AVG1 / 1000) + "ms") : PrintN("FPokeF: " + StrF(AVG2 / 1000) + "ms") : AVG1 = 0 : AVG2 = 0
  
  For J = 1 To 100
    B1 = ElapsedMicroseconds() : For I = 0 To 10000000 : PokeQ(@TestQ, 123) : Next : E1 = ElapsedMicroseconds()
    B2 = ElapsedMicroseconds() : For I = 0 To 10000000 : FPokeQ(@TestQ, 123) : Next : E2 = ElapsedMicroseconds()
    AVG1 + (E1 - B1) : AVG2 + (E2 - B2)
  Next
  AVG1 / 1000.0 : AVG2 / 1000.0 : PrintN("PokeQ: " + StrF(AVG1 / 1000) + "ms") : PrintN("FPokeQ: " + StrF(AVG2 / 1000) + "ms") : AVG1 = 0 : AVG2 = 0
  
  For J = 1 To 100
    B1 = ElapsedMicroseconds() : For I = 0 To 10000000 : PokeD(@TestD, 123) : Next : E1 = ElapsedMicroseconds()
    B2 = ElapsedMicroseconds() : For I = 0 To 10000000 : FPokeD(@TestD, 123) : Next : E2 = ElapsedMicroseconds()
    AVG1 + (E1 - B1) : AVG2 + (E2 - B2)
  Next
  AVG1 / 1000.0 : AVG2 / 1000.0 : PrintN("PokeD: " + StrF(AVG1 / 1000) + "ms") : PrintN("FPokeD: " + StrF(AVG2 / 1000) + "ms") : AVG1 = 0 : AVG2 = 0
  
  While Inkey() = ""
    Delay(100)
  Wend
  CloseConsole()
EndProcedure

OpenConsole("FastPoke Benchmark")
Test()
Benchmark()
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 26
; FirstLine = 3
; Folding = ---
; EnableXP
; Executable = XX.exe
; DisableDebugger