# PureBasic Queue
This module adds a Queue to PureBasic using List macros.

- Uses PureBasic's List for all operations.
- Accepts any data type (Value, String, Structured, ...) list.
- No additional procedure call overhead due to inlining.

```
Queue::Create(TestQueue.s())
Queue::Enqueue(TestQueue(), "First Value")
Queue::Enqueue(TestQueue(), "Second Value")
Queue::Enqueue(TestQueue(), "Third Value")

While Not Queue::IsEmpty(TestQueue())
  Queue::Dequeue(TestQueue())
  Debug TestQueue()
Wend

Queue::Free(TestQueue())
```

## Procedures

```PureBasic
Queue::Clear(Queue)          ; Removes all values from the queue.
Queue::Create(Queue)         ; Declares a new dynamic queue list.
Queue::Dequeue(Queue)        ; Removes the value at the beginning of the queue. Queue() = Dequeued Value.
Queue::Enqueue(Queue, Value) ; Adds a value to the end of the queue. Queue() = Enqueued Value.
Queue::Free(Queue)           ; Frees the specified queue and releases all its associated memory.
Queue::IsEmpty(Queue)        ; Returns true if the queue is empty; else false.
Queue::Peek(Queue)           ; Selects the value at the beginning of the queue without removing it.
Queue::Size(Queue)           ; Returns the number of elements in the queue.
```

## Implementation Details
Internally uses an additional element at the end of the list so that a dequeued value can still be read.

Please only use the macros provided to create, manipulate and free the list as they take this element into account.
