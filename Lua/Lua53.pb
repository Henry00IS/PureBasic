;==============================================================================
; ** Lua53.pb
;------------------------------------------------------------------------------
;  This module represents a Lua5.2&3 header to import Lua (scripting language).
;  http://00laboratories.com/
;==============================================================================
IncludeFile #PB_Compiler_File + "i" ;- PBHGEN

; 523 Lua 5.2.3 Header
; 530 Lua 5.3.0 Header
#LUA_VERSION_PUREBASIC  = 530

;--------------------------------------------------------------------------
Global DLL_LUA.i ; DLL Handle
;--------------------------------------------------------------------------
; * Lua Version Information
;--------------------------------------------------------------------------
CompilerIf #LUA_VERSION_PUREBASIC = 523
  #LUA_VERSION_MAJOR    = "5"
  #LUA_VERSION_MINOR    = "2"
  #LUA_VERSION_NUM      = 502
  #LUA_VERSION_RELEASE  = "1"
CompilerEndIf
CompilerIf #LUA_VERSION_PUREBASIC = 530
  #LUA_VERSION_MAJOR    = "5"
  #LUA_VERSION_MINOR    = "3"
  #LUA_VERSION_NUM      = 503
  #LUA_VERSION_RELEASE  = "0"
CompilerEndIf
#LUA_VERSION            = "Lua "+#LUA_VERSION_MAJOR+"."+#LUA_VERSION_MINOR
#LUA_RELEASE            = #LUA_VERSION+"."+#LUA_VERSION_RELEASE
#LUA_COPYRIGHT          = #LUA_RELEASE+"  Copyright (C) 1994-2015 Lua.org, PUC-Rio"
#LUA_AUTHORS            = "R. Ierusalimschy, L. H. de Figueiredo, W. Celes"
;--------------------------------------------------------------------------
; * PreCompiled Code
;--------------------------------------------------------------------------
CompilerIf #LUA_VERSION_PUREBASIC = 523
  #LUA_SIGNATURE        = Chr(033) + "Lua"
CompilerEndIf
CompilerIf #LUA_VERSION_PUREBASIC = 530
  #LUA_SIGNATURE        = Chr(027) + "Lua"
CompilerEndIf
;--------------------------------------------------------------------------
; * Lua Calling Options
;--------------------------------------------------------------------------
#LUA_MULTRET          = -1  ; Option To Return Multiple Values
;--------------------------------------------------------------------------
; * Lua Threading
;--------------------------------------------------------------------------
#LUA_OK               = 0   ; Thread Status Ok
#LUA_YIELD            = 1   ; Thread Status Yield
#LUA_ERRRUN           = 2   ; Thread Status Runtime Error
#LUA_ERRSYNTAX        = 3   ; Thread Status Syntax Error
#LUA_ERRMEM           = 4   ; Thread Status Memory Allocation Error
#LUA_ERRGCMM          = 5   ; Thread Status Garbage Collector?
#LUA_ERRERR           = 6   ; Thread Status Double Error Attempt to Print
;--------------------------------------------------------------------------
; * Lua Basic Types
;--------------------------------------------------------------------------
#LUA_TNONE            = -1  ; Nothing
#LUA_TNIL             = 0   ; Nil
#LUA_TBOOLEAN         = 1   ; Boolean
#LUA_TLIGHTUSERDATA   = 2   ; Light User Data
#LUA_TNUMBER          = 3   ; Number
#LUA_TSTRING          = 4   ; String
#LUA_TTABLE           = 5   ; Table
#LUA_TFUNCTION        = 6   ; Function
#LUA_TUSERDATA        = 7   ; Heavy User Data
#LUA_TTHREAD          = 8   ; Thread
#LUA_NUMTAGS          = 9   ; Total Types
;--------------------------------------------------------------------------
; * Lua Stack
;--------------------------------------------------------------------------
#LUA_MINSTACK         = 20  ; Minimum Stack Available for a C Function
;--------------------------------------------------------------------------
; * Lua Registry
;--------------------------------------------------------------------------
#LUA_RIDX_MAINTHREAD  = 1   ; Main Thread
#LUA_RIDX_GLOBALS     = 2   ; Global
#LUA_RIDX_LAST        = #LUA_RIDX_GLOBALS
;--------------------------------------------------------------------------
; * Lua Operators
;--------------------------------------------------------------------------
CompilerIf #LUA_VERSION_PUREBASIC = 523
#LUA_OPADD            = 0   ; +
#LUA_OPSUB            = 1   ; -
#LUA_OPMUL            = 2   ; *
#LUA_OPDIV            = 3   ; /
#LUA_OPMOD            = 4   ; %
#LUA_OPPOW            = 5   ; ^
#LUA_OPUNM            = 6   ; -v
CompilerEndIf
CompilerIf #LUA_VERSION_PUREBASIC = 530
#LUA_OPADD            = 0
#LUA_OPSUB            = 1
#LUA_OPMUL            = 2
#LUA_OPMOD            = 3
#LUA_OPPOW            = 4
#LUA_OPDIV            = 5
#LUA_OPIDIV           = 6
#LUA_OPBAND           = 7
#LUA_OPBOR            = 8
#LUA_OPBXOR           = 9
#LUA_OPSHL            = 10
#LUA_OPSHR            = 11
#LUA_OPUNM            = 12
#LUA_OPBNOT           = 13
CompilerEndIf
#LUA_OPEQ             = 0   ; ==
#LUA_OPLT             = 1   ; <
#LUA_OPLE             = 2   ; 
;--------------------------------------------------------------------------
; * Lua Garbage Collector
;--------------------------------------------------------------------------
#LUA_GCSTOP           = 0   ; Stop
#LUA_GCRESTART        = 1   ; Restart
#LUA_GCCOLLECT        = 2   ; Collect
#LUA_GCCOUNT          = 3   ; Amount of Memory Kilobytes Used by Lua
#LUA_GCCOUNTB         = 4   ; Remainder of Dividing Bytes of Memory by 1024
#LUA_GCSTEP           = 5   ; Step
#LUA_GCSETPAUSE       = 6   ; Set Pause
#LUA_GCSETSTEPMUL     = 7   ; Set Step Mul
#LUA_GCISRUNNING      = 9   ; Is Running
CompilerIf #LUA_VERSION_PUREBASIC = 523
  #LUA_GCSETMAJORINC    = 8   ; Set Major Increase
  #LUA_GCGEN            = 10  ; Gen
  #LUA_GCINC            = 11  ; Inc
CompilerEndIf
;--------------------------------------------------------------------------
; * Lua Pseudo Indices
;--------------------------------------------------------------------------
#LUA_REGISTRYINDEX    = (-10000)
#LUA_ENVIRONINDEX     = (-10001)
#LUA_GLOBALSINDEX     = (-10002)
;--------------------------------------------------------------------------
; * Lua Event Codes
;--------------------------------------------------------------------------
#LUA_HOOKCALL         = 0
#LUA_HOOKRET          = 1
#LUA_HOOKLINE         = 2
#LUA_HOOKCOUNT        = 3
#LUA_HOOKTAILRET      = 4
;--------------------------------------------------------------------------
; * Lua Event Masks
;--------------------------------------------------------------------------
#LUA_MASKCALL         = 1 << #LUA_HOOKCALL
#LUA_MASKRET          = 1 << #LUA_HOOKRET
#LUA_MASKLINE         = 1 << #LUA_HOOKLINE
#LUA_MASKCOUNT        = 1 << #LUA_HOOKCOUNT
;--------------------------------------------------------------------------
; * Lua Prototypes: State
;--------------------------------------------------------------------------
PrototypeC.l __proto_lua_newstate               (*f, *ud)
PrototypeC.l __proto_lua_close                  (lua_State.i)
PrototypeC.l __proto_lua_newthread              (lua_State.i)
PrototypeC.l __proto_lua_atpanic                (lua_State.i, *panicf)
CompilerIf #LUA_VERSION_PUREBASIC = 530
  PrototypeC.l __proto_lua_version              (lua_State.i)
CompilerEndIf
;--------------------------------------------------------------------------
; * Lua Prototypes: Basic Stack Manipulation
;--------------------------------------------------------------------------
PrototypeC.l __proto_lua_absindex               (lua_State.i, idx.l)
PrototypeC.l __proto_lua_gettop                 (lua_State.i)
PrototypeC.l __proto_lua_settop                 (lua_State.i, idx.l)
PrototypeC.l __proto_lua_pushvalue              (lua_State.i, idx.l)
CompilerIf #LUA_VERSION_PUREBASIC = 530
  PrototypeC.l __proto_lua_rotate               (lua_State.i, idx.l, n.l)
  Macro lua_remove  (L, idx) : lua_rotate(L, (idx), -1) : lua_pop(L, 1) : EndMacro
  Macro lua_insert  (L, idx) : lua_rotate(L, (idx), 1)                  : EndMacro
  Macro lua_replace (L, idx) : lua_copy(L, -1, (idx)) : lua_pop(L, 1)   : EndMacro
CompilerEndIf
CompilerIf #LUA_VERSION_PUREBASIC = 523
  PrototypeC.l __proto_lua_remove               (lua_State.i, idx.l)
  PrototypeC.l __proto_lua_insert               (lua_State.i, idx.l)
  PrototypeC.l __proto_lua_replace              (lua_State.i, idx.l)
CompilerEndIf
PrototypeC.l __proto_lua_copy                   (lua_State.i, fromidx.l, toidx.l)
PrototypeC.l __proto_lua_checkstack             (lua_State.i, sz.l)
PrototypeC.l __proto_lua_xmove                  (lua_State_from.i, lua_State_to.i, n.l)
;--------------------------------------------------------------------------
; * Lua Prototypes: Access Functions (Stack->C)
;--------------------------------------------------------------------------
PrototypeC.l __proto_lua_isnumber               (lua_State.i, idx.l)
PrototypeC.l __proto_lua_isstring               (lua_State.i, idx.l)
PrototypeC.l __proto_lua_iscfunction            (lua_State.i, idx.l)
CompilerIf #LUA_VERSION_PUREBASIC = 530
  PrototypeC.l __proto_lua_isinteger            (lua_State.i, idx.l)
CompilerEndIf
PrototypeC.l __proto_lua_isuserdata             (lua_State.i, idx.l)
PrototypeC.l __proto_lua_type                   (lua_State.i, idx.l)
PrototypeC.l __proto_lua_typename               (lua_State.i, tp.l)
PrototypeC.d __proto_lua_tonumberx              (lua_State.i, idx.l, *isnum)
PrototypeC.l __proto_lua_tointegerx             (lua_State.i, idx.l, *isnum)
PrototypeC.l __proto_lua_tounsignedx            (lua_State.i, idx.l, *isnum)
PrototypeC.l __proto_lua_toboolean              (lua_State.i, idx.l)
PrototypeC.l __proto_lua_tolstring              (lua_State.i, idx.l, *len)
PrototypeC.l __proto_lua_rawlen                 (lua_State.i, idx.l)
PrototypeC.l __proto_lua_tocfunction            (lua_State.i, idx.l)
PrototypeC.l __proto_lua_touserdata             (lua_State.i, idx.l)
PrototypeC.l __proto_lua_tothread               (lua_State.i, idx.l)
PrototypeC.l __proto_lua_topointer              (lua_State.i, idx.l)
;--------------------------------------------------------------------------
; * Lua Prototypes: Comparison And Arithmetic
;--------------------------------------------------------------------------
PrototypeC.l __proto_lua_arith                  (lua_State.i, op.l)
PrototypeC.l __proto_lua_rawequal               (lua_State.i, idx1.l, idx2.l)
PrototypeC.l __proto_lua_compare                (lua_State.i, idx1.l, idx2.l, op.l)
;--------------------------------------------------------------------------
; * Lua Prototypes: Push Functions (C->Stack)
;--------------------------------------------------------------------------
PrototypeC.l __proto_lua_pushnil                (lua_State.i)
PrototypeC.l __proto_lua_pushnumber             (lua_State.i, n.d)
PrototypeC.l __proto_lua_pushinteger            (lua_State.i, n.q)
PrototypeC.l __proto_lua_pushunsigned           (lua_State.i, n.q)
PrototypeC.l __proto_lua_pushlstring            (lua_State.i, string.p-ascii, size.i)
PrototypeC.l __proto_lua_pushstring             (lua_State.i, string.p-ascii)
PrototypeC.l __proto_lua_pushcclosure           (lua_State.i, *fn, n.l)
PrototypeC.l __proto_lua_pushboolean            (lua_State.i, b.l)
PrototypeC.l __proto_lua_pushlightuserdata      (lua_State.i, *p)
PrototypeC.l __proto_lua_pushthread             (lua_State.i)
;--------------------------------------------------------------------------
; * Lua Prototypes: Get Functions (Lua->Stack)
;--------------------------------------------------------------------------
PrototypeC.l __proto_lua_getglobal              (lua_State.i, *string_var) ; .p-ascii causes memory leak
PrototypeC.l __proto_lua_gettable               (lua_State.i, idx.l)
PrototypeC.l __proto_lua_getfield               (lua_State.i, idx.l, k.p-ascii)
CompilerIf #LUA_VERSION_PUREBASIC = 530
  PrototypeC.l __proto_lua_geti                 (lua_State.i, idx.l, n.q)
CompilerEndIf
PrototypeC.l __proto_lua_rawget                 (lua_State.i, idx.l)
PrototypeC.l __proto_lua_rawgeti                (lua_State.i, idx.l, n.l)
PrototypeC.l __proto_lua_rawgetp                (lua_State.i, idx.l, p.p-ascii)
PrototypeC.l __proto_lua_createtable            (lua_State.i, narr.l, nrec.l)
PrototypeC.l __proto_lua_newuserdata            (lua_State.i, sz.i)
PrototypeC.l __proto_lua_getmetatable           (lua_State.i, objindex.l)
PrototypeC.l __proto_lua_getuservalue           (lua_State.i, idx.l)
;--------------------------------------------------------------------------
; * Lua Prototypes: Set Functions (Lua->Stack)
;--------------------------------------------------------------------------
PrototypeC.l __proto_lua_setglobal              (lua_State.i, var.p-ascii)
PrototypeC.l __proto_lua_settable               (lua_State.i, idx.l)
PrototypeC.l __proto_lua_setfield               (lua_State.i, idx.l, k.p-ascii)
CompilerIf #LUA_VERSION_PUREBASIC = 530
  PrototypeC.l __proto_lua_seti                 (lua_State.i, idx.l, n.q)
CompilerEndIf
PrototypeC.l __proto_lua_rawset                 (lua_State.i, idx.l)
PrototypeC.l __proto_lua_rawseti                (lua_State.i, idx.l, n.l)
PrototypeC.l __proto_lua_rawsetp                (lua_State.i, idx.l, p.p-ascii)
PrototypeC.l __proto_lua_setmetatable           (lua_State.i, objindex.l)
PrototypeC.l __proto_lua_setuservalue           (lua_State.i, idx.l)
;--------------------------------------------------------------------------
; * Lua Prototypes: Load, Call
;--------------------------------------------------------------------------
PrototypeC.l __proto_lua_callk                  (lua_State.i, nargs.l, nresults.l, ctx.l, *k)
PrototypeC.l __proto_lua_getctx                 (lua_State.i, *ctx)
PrototypeC.l __proto_lua_pcallk                 (lua_State.i, nargs.l, nresults.l, *errfunc, ctx.l, *k)
PrototypeC.l __proto_lua_load                   (lua_State.i, reader.i, *dt, chunkname.p-ascii, mode.p-ascii)
PrototypeC.l __proto_lua_dump                   (lua_State.i, writer.i, *data_)
;--------------------------------------------------------------------------
; * Lua Prototypes: Coroutine Functions
;--------------------------------------------------------------------------
PrototypeC.l __proto_lua_yieldk                 (lua_State.i, nresults.l, ctx.l, *k)
PrototypeC.l __proto_lua_resume                 (lua_State.i, lua_State_from.i, narg.l)
PrototypeC.l __proto_lua_status                 (lua_State.i)
CompilerIf #LUA_VERSION_PUREBASIC = 530
  PrototypeC.l __proto_lua_isyieldable          (lua_State.i)
CompilerEndIf
;--------------------------------------------------------------------------
; * Lua Prototypes: Garbage Collection
;--------------------------------------------------------------------------
PrototypeC.l __proto_lua_gc                     (lua_State.i, what.l, data_.i)
;--------------------------------------------------------------------------
; * Lua Prototypes: Miscellaneous Functions
;--------------------------------------------------------------------------
PrototypeC.l __proto_lua_error                  (lua_State.i)
PrototypeC.l __proto_lua_next                   (lua_State.i, idx.l)
PrototypeC.l __proto_lua_concat                 (lua_State.i, n.l)
PrototypeC.l __proto_lua_len                    (lua_State.i, idx.l)
CompilerIf #LUA_VERSION_PUREBASIC = 530
  PrototypeC.l __proto_lua_stringtonumber       (lua_State.i, str.p-ascii)
CompilerEndIf
PrototypeC.l __proto_lua_getallocf              (lua_State.i, *ud)
PrototypeC.l __proto_lua_setallocf              (lua_State.i, *f, *ud)
;--------------------------------------------------------------------------
PrototypeC.l __proto_luaopen_base               (lua_State.i)
PrototypeC.l __proto_luaopen_coroutine          (lua_State.i)
PrototypeC.l __proto_luaopen_table              (lua_State.i)
PrototypeC.l __proto_luaopen_io                 (lua_State.i)
PrototypeC.l __proto_luaopen_os                 (lua_State.i)
PrototypeC.l __proto_luaopen_string             (lua_State.i)
PrototypeC.l __proto_luaopen_bit32              (lua_State.i)
PrototypeC.l __proto_luaopen_math               (lua_State.i)
PrototypeC.l __proto_luaopen_debug              (lua_State.i)
PrototypeC.l __proto_luaopen_package            (lua_State.i)
;--------------------------------------------------------------------------
; * Lua Prototypes: Macro Functions
;--------------------------------------------------------------------------
PrototypeC.l __proto_luaL_openlibs              (lua_State.i)
PrototypeC.l __proto_luaL_openlib               (lua_State.i, libname.p-ascii, *luaL_Reg, nup.l)
PrototypeC.l __proto_luaL_register              (lua_State.i, libname.p-ascii, *luaL_Reg)
PrototypeC.l __proto_luaL_getmetafield          (lua_State.i, obj.l, e.p-ascii)
PrototypeC.l __proto_luaL_callmeta              (lua_State.i, obj.l, e.p-ascii)
PrototypeC.l __proto_luaL_typerror              (lua_State.i, narg.l, tname.p-ascii)
PrototypeC.l __proto_luaL_argerror              (lua_State.i, numarg.l, extramsg.p-ascii)
PrototypeC.l __proto_luaL_checklstring          (lua_State.i, numarg.l, size.l)
PrototypeC.l __proto_luaL_optlstring            (lua_State.i, numarg.l, def.p-ascii, size.l)
PrototypeC.l __proto_luaL_checknumber           (lua_State.i, numarg.l)
PrototypeC.l __proto_luaL_optnumber             (lua_State.i, narg, LUA_NUMBER.d)
PrototypeC.l __proto_luaL_checkinteger          (lua_State.i, numarg.l)
PrototypeC.l __proto_luaL_optinteger            (lua_State.i, narg.l, LUA_INTEGER.l)
PrototypeC.l __proto_luaL_checkstack            (lua_State.i, sz.l, msg.p-ascii)
PrototypeC.l __proto_luaL_checktype             (lua_State.i, narg.l, t.l)
PrototypeC.l __proto_luaL_checkany              (lua_State.i, narg.l)
PrototypeC.l __proto_luaL_newmetatable          (lua_State.i, tname.p-ascii)
PrototypeC.l __proto_luaL_checkudata            (lua_State.i, ud.l, tname.p-ascii)
PrototypeC.l __proto_luaL_where                 (lua_State.i, lvl.l)
PrototypeC.l __proto_luaL_checkoption           (lua_State.i, narg.l, def.p-ascii, *string_array)
PrototypeC.l __proto_luaL_ref                   (lua_State.i, t.l)
PrototypeC.l __proto_luaL_unref                 (lua_State.i, t.l, ref.l)
PrototypeC.l __proto_luaL_loadfilex             (lua_State.i, filename.p-ascii, *mode)
PrototypeC.l __proto_luaL_loadbuffer            (lua_State.i, buff.l, size.l, name.p-ascii)
PrototypeC.l __proto_luaL_loadstring            (lua_State.i, string.p-ascii)
;luaL_loadfile         (lua_State.i, filename.p-ascii)
PrototypeC.l __proto_luaL_gsub                  (lua_State.i, s.p-ascii, p.p-ascii, r.p-ascii)
PrototypeC.l __proto_luaL_newstate              ()
PrototypeC.l __proto_luaL_findtable             (lua_State.i, Index.l, fname.p-ascii)
PrototypeC.l __proto_luaL_buffinit              (lua_State.i, *luaL_Buffer)
PrototypeC.l __proto_luaL_prepbuffer            (*luaL_Buffer)
PrototypeC.l __proto_luaL_addlstring            (*luaL_Buffer, s.p-ascii, size.l)
PrototypeC.l __proto_luaL_addstring             (*luaL_Buffer, s.p-ascii)
PrototypeC.l __proto_luaL_addvalue              (*luaL_Buffer)
PrototypeC.l __proto_luaL_pushresult            (*luaL_Buffer)
;--------------------------------------------------------------------------
; * Initialize and Import Lua Library
;--------------------------------------------------------------------------
Procedure Lua_Initialize()
  Debug "Lua Initializing"
  CompilerIf #PB_Compiler_Processor = #PB_Processor_x64
    DLL_LUA = OpenLibrary(#PB_Any, "x64/lua53.dll") ; select your dll here!
  CompilerElse
    DLL_LUA = OpenLibrary(#PB_Any, "x86/lua53.dll") ; select your dll here!
  CompilerEndIf
  ;--------------------------------------------------------------------------
  ; * Lua Library: State
  ;--------------------------------------------------------------------------
  Global lua_newstate.__proto_lua_newstate                   = GetFunction(DLL_LUA, "lua_newstate")
  Global lua_close.__proto_lua_close                         = GetFunction(DLL_LUA, "lua_close")
  Global lua_newthread.__proto_lua_newthread                 = GetFunction(DLL_LUA, "lua_newthread")
  Global lua_atpanic.__proto_lua_atpanic                     = GetFunction(DLL_LUA, "lua_atpanic")
  CompilerIf #LUA_VERSION_PUREBASIC = 530
    Global lua_version.__proto_lua_atpanic                   = GetFunction(DLL_LUA, "lua_version")
  CompilerEndIf
  ;--------------------------------------------------------------------------
  ; * Lua Library: Basic Stack Manipulation
  ;--------------------------------------------------------------------------
  Global lua_absindex.__proto_lua_absindex                   = GetFunction(DLL_LUA, "lua_absindex")
  Global lua_gettop.__proto_lua_gettop                       = GetFunction(DLL_LUA, "lua_gettop")
  Global lua_settop.__proto_lua_settop                       = GetFunction(DLL_LUA, "lua_settop")
  Global lua_pushvalue.__proto_lua_pushvalue                 = GetFunction(DLL_LUA, "lua_pushvalue")
  CompilerIf #LUA_VERSION_PUREBASIC = 530
    Global lua_rotate.__proto_lua_rotate                     = GetFunction(DLL_LUA, "lua_rotate")
  CompilerEndIf
  CompilerIf #LUA_VERSION_PUREBASIC = 523
    Global lua_remove.__proto_lua_remove                     = GetFunction(DLL_LUA, "lua_remove")
    Global lua_insert.__proto_lua_insert                     = GetFunction(DLL_LUA, "lua_insert")
    Global lua_replace.__proto_lua_replace                   = GetFunction(DLL_LUA, "lua_replace")
  CompilerEndIf
  Global lua_copy.__proto_lua_copy                           = GetFunction(DLL_LUA, "lua_copy")
  Global lua_checkstack.__proto_lua_checkstack               = GetFunction(DLL_LUA, "lua_checkstack")
  Global lua_xmove.__proto_lua_xmove                         = GetFunction(DLL_LUA, "lua_xmove")
  ;--------------------------------------------------------------------------
  ; * Lua Library: Access Functions (Stack->C)
  ;--------------------------------------------------------------------------
  Global lua_isnumber.__proto_lua_isnumber                   = GetFunction(DLL_LUA, "lua_isnumber")
  Global lua_isstring.__proto_lua_isstring                   = GetFunction(DLL_LUA, "lua_isstring")
  Global lua_iscfunction.__proto_lua_iscfunction             = GetFunction(DLL_LUA, "lua_iscfunction")
  CompilerIf #LUA_VERSION_PUREBASIC = 530
    Global lua_isinteger.__proto_lua_isinteger               = GetFunction(DLL_LUA, "lua_isinteger")
  CompilerEndIf
  Global lua_isuserdata.__proto_lua_isuserdata               = GetFunction(DLL_LUA, "lua_isuserdata")
  Global lua_type.__proto_lua_type                           = GetFunction(DLL_LUA, "lua_type")
  Global lua_typename.__proto_lua_typename                   = GetFunction(DLL_LUA, "lua_typename")
  Global lua_tonumberx.__proto_lua_tonumberx                 = GetFunction(DLL_LUA, "lua_tonumberx")
  Global lua_tointegerx.__proto_lua_tointegerx               = GetFunction(DLL_LUA, "lua_tointegerx")
  Global lua_tounsignedx.__proto_lua_tounsignedx             = GetFunction(DLL_LUA, "lua_tounsignedx")
  Global lua_toboolean.__proto_lua_toboolean                 = GetFunction(DLL_LUA, "lua_toboolean")
  Global lua_tolstring.__proto_lua_tolstring                 = GetFunction(DLL_LUA, "lua_tolstring")
  Global lua_rawlen.__proto_lua_rawlen                       = GetFunction(DLL_LUA, "lua_rawlen")
  Global lua_tocfunction.__proto_lua_tocfunction             = GetFunction(DLL_LUA, "lua_tocfunction")
  Global lua_touserdata.__proto_lua_touserdata               = GetFunction(DLL_LUA, "lua_touserdata")
  Global lua_tothread.__proto_lua_tothread                   = GetFunction(DLL_LUA, "lua_tothread")
  Global lua_topointer.__proto_lua_topointer                 = GetFunction(DLL_LUA, "lua_topointer")
  ;--------------------------------------------------------------------------
  ; * Lua Library: Comparison And Arithmetic
  ;--------------------------------------------------------------------------
  Global lua_arith.__proto_lua_arith                         = GetFunction(DLL_LUA, "lua_arith")
  Global lua_rawequal.__proto_lua_rawequal                   = GetFunction(DLL_LUA, "lua_rawequal")
  Global lua_compare.__proto_lua_compare                     = GetFunction(DLL_LUA, "lua_compare")
  ;--------------------------------------------------------------------------
  ; * Lua Library: Push Functions (C->Stack)
  ;--------------------------------------------------------------------------
  Global lua_pushnil.__proto_lua_pushnil                     = GetFunction(DLL_LUA, "lua_pushnil")
  Global lua_pushnumber.__proto_lua_pushnumber               = GetFunction(DLL_LUA, "lua_pushnumber")
  Global lua_pushinteger.__proto_lua_pushinteger             = GetFunction(DLL_LUA, "lua_pushinteger")
  Global lua_pushunsigned.__proto_lua_pushunsigned           = GetFunction(DLL_LUA, "lua_pushunsigned")
  Global lua_pushlstring.__proto_lua_pushlstring             = GetFunction(DLL_LUA, "lua_pushlstring")
  Global lua_pushstring.__proto_lua_pushstring               = GetFunction(DLL_LUA, "lua_pushstring")
  Global lua_pushcclosure.__proto_lua_pushcclosure           = GetFunction(DLL_LUA, "lua_pushcclosure")
  Global lua_pushboolean.__proto_lua_pushboolean             = GetFunction(DLL_LUA, "lua_pushboolean")
  Global lua_pushlightuserdata.__proto_lua_pushlightuserdata = GetFunction(DLL_LUA, "lua_pushlightuserdata")
  Global lua_pushthread.__proto_lua_pushthread               = GetFunction(DLL_LUA, "lua_pushthread")
  ;--------------------------------------------------------------------------
  ; * Lua Library: Get Functions (Lua->Stack)
  ;--------------------------------------------------------------------------
  Global lua_getglobal.__proto_lua_getglobal                 = GetFunction(DLL_LUA, "lua_getglobal")
  Global lua_gettable.__proto_lua_gettable                   = GetFunction(DLL_LUA, "lua_gettable")
  Global lua_getfield.__proto_lua_getfield                   = GetFunction(DLL_LUA, "lua_getfield")
  CompilerIf #LUA_VERSION_PUREBASIC = 530
    Global lua_geti.__proto_lua_geti                         = GetFunction(DLL_LUA, "lua_geti")
  CompilerEndIf
  Global lua_rawget.__proto_lua_rawget                       = GetFunction(DLL_LUA, "lua_rawget")
  Global lua_rawgeti.__proto_lua_rawgeti                     = GetFunction(DLL_LUA, "lua_rawgeti")
  Global lua_rawgetp.__proto_lua_rawgetp                     = GetFunction(DLL_LUA, "lua_rawgetp")
  Global lua_createtable.__proto_lua_createtable             = GetFunction(DLL_LUA, "lua_createtable")
  Global lua_newuserdata.__proto_lua_newuserdata             = GetFunction(DLL_LUA, "lua_newuserdata")
  Global lua_getmetatable.__proto_lua_getmetatable           = GetFunction(DLL_LUA, "lua_getmetatable")
  Global lua_getuservalue.__proto_lua_getuservalue           = GetFunction(DLL_LUA, "lua_getuservalue")
  ;--------------------------------------------------------------------------
  ; * Lua Library: Set Functions (Lua->Stack)
  ;--------------------------------------------------------------------------
  Global lua_setglobal.__proto_lua_setglobal                 = GetFunction(DLL_LUA, "lua_setglobal")
  Global lua_settable.__proto_lua_settable                   = GetFunction(DLL_LUA, "lua_settable")
  Global lua_setfield.__proto_lua_setfield                   = GetFunction(DLL_LUA, "lua_setfield")
  CompilerIf #LUA_VERSION_PUREBASIC = 530
    Global lua_seti.__proto_lua_seti                         = GetFunction(DLL_LUA, "lua_seti")
  CompilerEndIf
  Global lua_rawset.__proto_lua_rawset                       = GetFunction(DLL_LUA, "lua_rawset")
  Global lua_rawseti.__proto_lua_rawseti                     = GetFunction(DLL_LUA, "lua_rawseti")
  Global lua_rawsetp.__proto_lua_rawsetp                     = GetFunction(DLL_LUA, "lua_rawsetp")
  Global lua_setmetatable.__proto_lua_setmetatable           = GetFunction(DLL_LUA, "lua_setmetatable")
  Global lua_setuservalue.__proto_lua_setuservalue           = GetFunction(DLL_LUA, "lua_setuservalue")
  ;--------------------------------------------------------------------------
  ; * Lua Library: Load, Call
  ;--------------------------------------------------------------------------
  Global lua_callk.__proto_lua_callk                         = GetFunction(DLL_LUA, "lua_callk")
  Global lua_getctx.__proto_lua_getctx                       = GetFunction(DLL_LUA, "lua_getctx")
  Global lua_pcallk.__proto_lua_pcallk                       = GetFunction(DLL_LUA, "lua_pcallk")
  Global lua_load.__proto_lua_load                           = GetFunction(DLL_LUA, "lua_load")
  Global lua_dump.__proto_lua_dump                           = GetFunction(DLL_LUA, "lua_dump")
  ;--------------------------------------------------------------------------
  ; * Lua Library: Coroutine Functions
  ;--------------------------------------------------------------------------
  Global lua_yieldk.__proto_lua_yieldk                       = GetFunction(DLL_LUA, "lua_yieldk")
  Global lua_resume.__proto_lua_resume                       = GetFunction(DLL_LUA, "lua_resume")
  Global lua_status.__proto_lua_status                       = GetFunction(DLL_LUA, "lua_status")
  CompilerIf #LUA_VERSION_PUREBASIC = 530
    Global lua_isyieldable.__proto_lua_isyieldable           = GetFunction(DLL_LUA, "lua_isyieldable")
  CompilerEndIf
  ;--------------------------------------------------------------------------
  ; * Lua Library: Garbage Collection
  ;--------------------------------------------------------------------------
  Global lua_gc.__proto_lua_gc                               = GetFunction(DLL_LUA, "lua_gc")
  ;--------------------------------------------------------------------------
  ; * Lua Library: Miscellaneous Functions
  ;--------------------------------------------------------------------------
  Global lua_error.__proto_lua_error                         = GetFunction(DLL_LUA, "lua_error")
  Global lua_next.__proto_lua_next                           = GetFunction(DLL_LUA, "lua_next")
  Global lua_concat.__proto_lua_concat                       = GetFunction(DLL_LUA, "lua_concat")
  Global lua_len.__proto_lua_len                             = GetFunction(DLL_LUA, "lua_len")
  CompilerIf #LUA_VERSION_PUREBASIC = 530
    Global lua_stringtonumber.__proto_lua_stringtonumber     = GetFunction(DLL_LUA, "lua_stringtonumber")
  CompilerEndIf
  Global lua_getallocf.__proto_lua_getallocf                 = GetFunction(DLL_LUA, "lua_getallocf")
  Global lua_setallocf.__proto_lua_setallocf                 = GetFunction(DLL_LUA, "lua_setallocf")
  ;--------------------------------------------------------------------------
  Global luaopen_base.__proto_luaopen_base                   = GetFunction(DLL_LUA, "luaopen_base")
  Global luaopen_coroutine.__proto_luaopen_coroutine         = GetFunction(DLL_LUA, "luaopen_coroutine")
  Global luaopen_table.__proto_luaopen_table                 = GetFunction(DLL_LUA, "luaopen_table")
  Global luaopen_io.__proto_luaopen_io                       = GetFunction(DLL_LUA, "luaopen_io")
  Global luaopen_os.__proto_luaopen_os                       = GetFunction(DLL_LUA, "luaopen_os")
  Global luaopen_string.__proto_luaopen_string               = GetFunction(DLL_LUA, "luaopen_string")
  Global luaopen_bit32.__proto_luaopen_bit32                 = GetFunction(DLL_LUA, "luaopen_bit32")
  Global luaopen_math.__proto_luaopen_math                   = GetFunction(DLL_LUA, "luaopen_math")
  Global luaopen_debug.__proto_luaopen_debug                 = GetFunction(DLL_LUA, "luaopen_debug")
  Global luaopen_package.__proto_luaopen_package             = GetFunction(DLL_LUA, "luaopen_package")
  ;--------------------------------------------------------------------------
  ; * Lua Library: Macro Functions
  ;--------------------------------------------------------------------------
  Global luaL_openlibs.__proto_luaL_openlibs                 = GetFunction(DLL_LUA, "luaL_openlibs")
  Global luaL_openlib.__proto_luaL_openlib                   = GetFunction(DLL_LUA, "luaL_openlib")
  Global luaL_register.__proto_luaL_register                 = GetFunction(DLL_LUA, "luaL_register")
  Global luaL_getmetafield.__proto_luaL_getmetafield         = GetFunction(DLL_LUA, "luaL_getmetafield")
  Global luaL_callmeta.__proto_luaL_callmeta                 = GetFunction(DLL_LUA, "luaL_callmeta")
  Global luaL_typerror.__proto_luaL_typerror                 = GetFunction(DLL_LUA, "luaL_typerror")
  Global luaL_argerror.__proto_luaL_argerror                 = GetFunction(DLL_LUA, "luaL_argerror")
  Global luaL_checklstring.__proto_luaL_checklstring         = GetFunction(DLL_LUA, "luaL_checklstring")
  Global luaL_optlstring.__proto_luaL_optlstring             = GetFunction(DLL_LUA, "luaL_optlstring")
  Global luaL_checknumber.__proto_luaL_checknumber           = GetFunction(DLL_LUA, "luaL_checknumber")
  Global luaL_optnumber.__proto_luaL_optnumber               = GetFunction(DLL_LUA, "luaL_optnumber")
  Global luaL_checkinteger.__proto_luaL_checkinteger         = GetFunction(DLL_LUA, "luaL_checkinteger")
  Global luaL_optinteger.__proto_luaL_optinteger             = GetFunction(DLL_LUA, "luaL_optinteger")
  Global luaL_checkstack.__proto_luaL_checkstack             = GetFunction(DLL_LUA, "luaL_checkstack")
  Global luaL_checktype.__proto_luaL_checktype               = GetFunction(DLL_LUA, "luaL_checktype")
  Global luaL_checkany.__proto_luaL_checkany                 = GetFunction(DLL_LUA, "luaL_checkany")
  Global luaL_newmetatable.__proto_luaL_newmetatable         = GetFunction(DLL_LUA, "luaL_newmetatable")
  Global luaL_checkudata.__proto_luaL_checkudata             = GetFunction(DLL_LUA, "luaL_checkudata")
  Global luaL_where.__proto_luaL_where                       = GetFunction(DLL_LUA, "luaL_where")
  Global luaL_checkoption.__proto_luaL_checkoption           = GetFunction(DLL_LUA, "luaL_checkoption")
  Global luaL_ref.__proto_luaL_ref                           = GetFunction(DLL_LUA, "luaL_ref")
  Global luaL_unref.__proto_luaL_unref                       = GetFunction(DLL_LUA, "luaL_unref")
  Global luaL_loadfilex.__proto_luaL_loadfilex               = GetFunction(DLL_LUA, "luaL_loadfilex")
  Global luaL_loadbuffer.__proto_luaL_loadbuffer             = GetFunction(DLL_LUA, "luaL_loadbuffer")
  Global luaL_loadstring.__proto_luaL_loadstring             = GetFunction(DLL_LUA, "luaL_loadstring")
  Global luaL_gsub.__proto_luaL_gsub                         = GetFunction(DLL_LUA, "luaL_gsub")
  Global luaL_newstate.__proto_luaL_newstate                 = GetFunction(DLL_LUA, "luaL_newstate")
  Global luaL_findtable.__proto_luaL_findtable               = GetFunction(DLL_LUA, "luaL_findtable")
  Global luaL_buffinit.__proto_luaL_buffinit                 = GetFunction(DLL_LUA, "luaL_buffinit")
  Global luaL_prepbuffer.__proto_luaL_prepbuffer             = GetFunction(DLL_LUA, "luaL_prepbuffer")
  Global luaL_addlstring.__proto_luaL_addlstring             = GetFunction(DLL_LUA, "luaL_addlstring")
  Global luaL_addstring.__proto_luaL_addstring               = GetFunction(DLL_LUA, "luaL_addstring")
  Global luaL_addvalue.__proto_luaL_addvalue                 = GetFunction(DLL_LUA, "luaL_addvalue")
  Global luaL_pushresult.__proto_luaL_pushresult             = GetFunction(DLL_LUA, "luaL_pushresult")
EndProcedure
;--------------------------------------------------------------------------
; * Dispose Lua Library
;--------------------------------------------------------------------------
Procedure Lua_Dispose()
  Debug "Lua Closing"
  CloseLibrary(DLL_LUA)
EndProcedure
;--------------------------------------------------------------------------
; * IDX To String
;--------------------------------------------------------------------------
Procedure.s lua_tostring(Lua_State, idx)
  Protected *Temp_String = lua_tolstring(Lua_State, idx, #Null)
  If *Temp_String : Protected Result_String$ = PeekS(*Temp_String, -1, #PB_Ascii) : Else : Result_String$ = "" : EndIf
  ProcedureReturn Result_String$
EndProcedure

Macro lua_call(L, n, r)
  lua_callk((L), (n), (r), 0, #Null)
EndMacro

Macro lua_pcall(L, n, r, f)
  lua_pcallk((L), (n), (r), (f), 0, #Null)
EndMacro

Macro lua_yield(L, n)
  lua_yieldk((L), (n), 0, #Null)
EndMacro

Procedure.d lua_tonumber(L, i)
  Protected Value.d = lua_tonumberx((L), (i), #Null)
  CompilerIf #PB_Compiler_OS = #PB_OS_Windows And #PB_Compiler_Processor = #PB_Processor_x64
    EnableASM
    MOVQ Value, XMM0
    DisableASM
  CompilerEndIf
  ProcedureReturn Value
EndProcedure

Macro lua_tointeger(L, i)
  lua_tointegerx((L), (i), #Null)
EndMacro

Macro lua_tounsigned(L, i)
  lua_tounsignedx((L), (i), #Null)
EndMacro

Macro lua_pop(L, n)
  lua_settop((L), -(n)-1)
EndMacro

Macro lua_newtable(L)
  lua_createtable((L), 0, 0)
EndMacro

Macro lua_register(L, n, f)
  lua_pushcfunction((L), (f))
  lua_setglobal((L), n)
EndMacro

Macro lua_pushcfunction(L, f)
  lua_pushcclosure((L), (f), 0)
EndMacro

Macro lua_isfunction(L, n)
  (lua_type((L), (n)) = #LUA_TFUNCTION)
EndMacro

Macro lua_istable(L, n)
  (lua_type((L), (n)) = #LUA_TTABLE)
EndMacro

Macro lua_islightuserdata(L, n)
  (lua_type((L), (n)) = #LUA_TLIGHTUSERDATA)
EndMacro

Macro lua_isnil(L, n)
  (lua_type((L), (n)) = #LUA_TNIL)
EndMacro

Macro lua_isboolean(L, n)
  (lua_type((L), (n)) = #LUA_TBOOLEAN)
EndMacro

Macro lua_isthread(L, n)
  (lua_type((L), (n)) = #LUA_TTHREAD)
EndMacro

Macro lua_isnone(L, n)
  (lua_type((L), (n)) = #LUA_TNONE)
EndMacro

Macro lua_isnoneornil(L, n)
  (lua_type((L), (n)) 
EndMacro

Macro luaL_dofile(Lua_State, Filename)
    luaL_loadfile(Lua_State, Filename)
    lua_pcall(Lua_State, 0, #LUA_MULTRET, 0)
EndMacro

Macro luaL_dostring(Lua_State, String)
    luaL_loadstring(Lua_State, String)
    lua_pcall(Lua_State, 0, #LUA_MULTRET, 0)
EndMacro

Macro luaL_loadfile(L, f)
  luaL_loadfilex((L),f,#Null)
EndMacro

Procedure lua_getglobal_fixed(L, String$) ; Because of a memory leak with .p-ascii
  Protected *String_Buffer = AllocateMemory(StringByteLength(String$, #PB_Ascii)+1)
  If *String_Buffer
    PokeS(*String_Buffer, String$, -1, #PB_Ascii)
  EndIf
  lua_getglobal(L, *String_Buffer)
  FreeMemory(*String_Buffer)
EndProcedure
; IDE Options = PureBasic 5.71 LTS (Windows - x86)
; CursorPosition = 6
; Folding = ---------
; EnableXP