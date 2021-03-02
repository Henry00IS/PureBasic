;==============================================================================
; ** FastPokeBenchmark.pb
;------------------------------------------------------------------------------
;  This benchmark will prove the performance increase.
;  http://00laboratories.com/
;==============================================================================

; PureBasic 5.73 LTS (x64):
; PokeB: 1.7020750046ms
; FPokeB: 1.4086999893ms
; PokeA: 1.7058800459ms
; FPokeA: 1.4365570545ms
; PokeC: 1.7119120359ms
; FPokeC: 1.453750968ms
; PokeF: 1.5906949043ms
; FPokeF: 1.4513419867ms
; PokeU: 1.6855739355ms
; FPokeU: 1.4147650003ms
; PokeI: 1.7047939301ms
; FPokeI: 1.4655410051ms
; PokeF: 1.6639460325ms
; FPokeF: 1.4608969688ms
; PokeQ: 1.6908900738ms
; FPokeQ: 1.4700200558ms
; PokeD: 1.6305680275ms
; FPokeD: 1.6540820599ms (slower! unused as such)

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

Macro FPokeB(MemoryBuffer, Number)
  Protected *FastPokeB#MacroExpandedCount.FastPoke = MemoryBuffer
  *FastPokeB#MacroExpandedCount\B = Number
EndMacro

Macro FPokeA(MemoryBuffer, Ascii)
  Protected *FastPokeA#MacroExpandedCount.FastPoke = MemoryBuffer
  *FastPokeA#MacroExpandedCount\A = Ascii
EndMacro

Macro FPokeC(MemoryBuffer, Character)
  Protected *FastPokeC#MacroExpandedCount.FastPoke = MemoryBuffer
  *FastPokeC#MacroExpandedCount\C = Character
EndMacro

Macro FPokeW(MemoryBuffer, Number)
  Protected *FastPokeW#MacroExpandedCount.FastPoke = MemoryBuffer
  *FastPokeW#MacroExpandedCount\W = Number
EndMacro

Macro FPokeU(MemoryBuffer, Unicode)
  Protected *FastPokeU#MacroExpandedCount.FastPoke = MemoryBuffer
  *FastPokeU#MacroExpandedCount\U = Unicode
EndMacro

Macro FPokeL(MemoryBuffer, Number)
  Protected *FastPokeL#MacroExpandedCount.FastPoke = MemoryBuffer
  *FastPokeL#MacroExpandedCount\L = Number
EndMacro

Macro FPokeI(MemoryBuffer, Number)
  Protected *FastPokeI#MacroExpandedCount.FastPoke = MemoryBuffer
  *FastPokeI#MacroExpandedCount\I = Number
EndMacro

Macro FPokeF(MemoryBuffer, Number)
  Protected *FastPokeF#MacroExpandedCount.FastPoke = MemoryBuffer
  *FastPokeF#MacroExpandedCount\F = Number
EndMacro

Macro FPokeQ(MemoryBuffer, Quad)
  Protected *FastPokeQ#MacroExpandedCount.FastPoke = MemoryBuffer
  *FastPokeQ#MacroExpandedCount\Q = Quad
EndMacro

Macro FPokeD(MemoryBuffer, Double)
  Protected *FastPokeD#MacroExpandedCount.FastPoke = MemoryBuffer
  *FastPokeD#MacroExpandedCount\D = Double
EndMacro

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
EndProcedure

Procedure Benchmark()
  
  CompilerIf #PB_Compiler_Debugger = 1
    PrintN("DEBUG MODE IS ENABLED")
    PrintN("During debug mode the fast poke commands are actually slower.")
    PrintN("They are never active / never compile during debug builds because of this.")
    PrintN("However, this benchmark will use them.")
    PrintN("-------------------------------------------")
  CompilerEndIf
  
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
    B1 = ElapsedMicroseconds() : For I = 0 To 10000000 : PokeF(@TestW, 123) : Next : E1 = ElapsedMicroseconds()
    B2 = ElapsedMicroseconds() : For I = 0 To 10000000 : FPokeF(@TestW, 123) : Next : E2 = ElapsedMicroseconds()
    AVG1 + (E1 - B1) : AVG2 + (E2 - B2)
  Next
  AVG1 / 1000.0 : AVG2 / 1000.0 : PrintN("PokeF: " + StrF(AVG1 / 1000) + "ms") : PrintN("FPokeF: " + StrF(AVG2 / 1000) + "ms") : AVG1 = 0 : AVG2 = 0
  
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
; CursorPosition = 44
; FirstLine = 24
; Folding = ---
; EnableXP
; DisableDebugger