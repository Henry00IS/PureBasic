# PureBasic Fast Poke
This module optimizes most PokeX() commands in PureBasic.

Through clever macros, simply including this file and compiling your program is enough to gain a performance improvement.

## Implementation Details
Every PokeX() command in PureBasic is a procedure call and will have some overhead because of it. These macros will replace those procedure calls with a simple structure assignment, which will compile down to simple MOV instructions in assembly. Every PokeX() procedure will have its own variable.

Simply including this file and compiling your program is enough to gain a performance improvement if you use these procedures a lot.

See FastPokeBenchmark.pb for more details and timing information.