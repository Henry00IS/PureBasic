;==============================================================================
; ** Queue.pb
;------------------------------------------------------------------------------
;  This module represents a Queue for PureBasic.
;  http://00laboratories.com/
;==============================================================================

; The queue has been implemented using only one-line list macros.
; • Uses PureBasic's List for all operations.
; • Accepts any data type (Value, String, Structured, ...) list.
; • No additional procedure call overhead due to inlining.
;
; Internally uses an additional element at the end of the list so that a
; dequeued value can still be read. Please only use the macros provided to
; create, manipulate and free the list as they take this element into account.

DeclareModule Queue
  ; ---------------------------------------------------------------------------
  ; * Removes all values from the queue.
  ; ---------------------------------------------------------------------------
  Macro Clear(Queue) :ClearList(Queue):AddElement(Queue): EndMacro
  ; ---------------------------------------------------------------------------
  ; * Declares a new dynamic queue list.
  ; ---------------------------------------------------------------------------
  Macro Create(Queue) :NewList Queue:AddElement(Queue): EndMacro
  ; ---------------------------------------------------------------------------
  ; * Removes the value at the beginning of the queue. Queue() = Dequeued Value
  ; ---------------------------------------------------------------------------
  Macro Dequeue(Queue) :If Bool(ListSize(Queue) <> 1):SwapElements(Queue, LastElement(Queue), FirstElement(Queue)):DeleteElement(Queue):LastElement(Queue):EndIf: EndMacro
  ; ---------------------------------------------------------------------------
  ; * Adds a value to the end of the queue. Queue() = Enqueued Value
  ; ---------------------------------------------------------------------------
  Macro Enqueue(Queue, Value) :LastElement(Queue):InsertElement(Queue):Queue = Value: EndMacro
  ; ---------------------------------------------------------------------------
  ; * Frees the specified queue and releases all its associated memory.
  ; ---------------------------------------------------------------------------
  Macro Free(Queue) :FreeList(Queue): EndMacro
  ; ---------------------------------------------------------------------------
  ; * Returns true if the queue is empty; else false.
  ; ---------------------------------------------------------------------------
  Macro IsEmpty(Queue) :Bool(ListSize(Queue) = 1): EndMacro
  ; ---------------------------------------------------------------------------
  ; * Selects the value at the beginning of the queue without removing it.
  ; ---------------------------------------------------------------------------
  Macro Peek(Queue) :FirstElement(Queue): EndMacro
  ; ---------------------------------------------------------------------------
  ; * Returns the number of elements in the queue.
  ; ---------------------------------------------------------------------------
  Macro Size(Queue) :ListSize(Queue) - 1: EndMacro
EndDeclareModule

Module Queue

EndModule
; IDE Options = PureBasic 5.71 LTS (Windows - x64)
; CursorPosition = 8
; Folding = --
; EnableXP