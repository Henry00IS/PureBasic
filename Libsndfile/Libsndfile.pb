;==============================================================================
; ** Libsndfile.pb
;------------------------------------------------------------------------------
;  This module represents a libsndfile header to im/export sound file formats.
;  http://00laboratories.com/
;==============================================================================
IncludeFile #PB_Compiler_File + "i" ;- PBHGEN

;--------------------------------------------------------------------------
Global DLL_LSF.i ; DLL Handle
;--------------------------------------------------------------------------
; * Major formats
;--------------------------------------------------------------------------
#SF_FORMAT_WAV            = $010000        ; Microsoft WAV format (little endian default). 
#SF_FORMAT_AIFF            = $020000        ; Apple/SGI AIFF format (big endian). 
#SF_FORMAT_AU              = $030000        ; Sun/NeXT AU format (big endian). 
#SF_FORMAT_RAW            = $040000        ; RAW PCM data. 
#SF_FORMAT_PAF            = $050000        ; Ensoniq PARIS file format. 
#SF_FORMAT_SVX            = $060000        ; Amiga IFF / SVX8 / SV16 format. 
#SF_FORMAT_NIST            = $070000        ; Sphere NIST format. 
#SF_FORMAT_VOC            = $080000        ; VOC files. 
#SF_FORMAT_IRCAM      = $0A0000        ; Berkeley/IRCAM/CARL 
#SF_FORMAT_W64            = $0B0000        ; Sonic Foundry's 64 bit RIFF/WAV 
#SF_FORMAT_MAT4            = $0C0000        ; Matlab (tm) V4.2 / GNU Octave 2.0 
#SF_FORMAT_MAT5            = $0D0000        ; Matlab (tm) V5.0 / GNU Octave 2.1 
#SF_FORMAT_PVF            = $0E0000        ; Portable Voice Format 
#SF_FORMAT_XI              = $0F0000        ; Fasttracker 2 Extended Instrument 
#SF_FORMAT_HTK            = $100000        ; HMM Tool Kit format 
#SF_FORMAT_SDS            = $110000        ; Midi Sample Dump Standard 
#SF_FORMAT_AVR            = $120000        ; Audio Visual Research 
#SF_FORMAT_WAVEX        = $130000        ; MS WAVE with WAVEFORMATEX 
#SF_FORMAT_SD2            = $160000        ; Sound Designer 2 
#SF_FORMAT_FLAC            = $170000        ; FLAC lossless file format 
#SF_FORMAT_CAF            = $180000        ; Core Audio File format 
#SF_FORMAT_WVE            = $190000        ; Psion WVE format 
#SF_FORMAT_OGG            = $200000        ; Xiph OGG container 
#SF_FORMAT_MPC2K        = $210000        ; Akai MPC 2000 sampler 
#SF_FORMAT_RF64            = $220000        ; RF64 WAV file 
;--------------------------------------------------------------------------
; * Subtypes from here on
;--------------------------------------------------------------------------
#SF_FORMAT_PCM_S8        = $0001          ; Signed 8 bit data 
#SF_FORMAT_PCM_16        = $0002          ; Signed 16 bit data 
#SF_FORMAT_PCM_24        = $0003          ; Signed 24 bit data 
#SF_FORMAT_PCM_32        = $0004          ; Signed 32 bit data 
#SF_FORMAT_PCM_U8        = $0005          ; Unsigned 8 bit data (WAV and RAW only) 
;--------------------------------------------------------------------------
#SF_FORMAT_FLOAT        = $0006          ; 32 bit float data 
#SF_FORMAT_DOUBLE        = $0007          ; 64 bit float data 
;--------------------------------------------------------------------------
#SF_FORMAT_ULAW            = $0010          ; U-Law encoded. 
#SF_FORMAT_ALAW            = $0011          ; A-Law encoded. 
#SF_FORMAT_IMA_ADPCM= $0012          ; IMA ADPCM. 
#SF_FORMAT_MS_ADPCM    = $0013          ; Microsoft ADPCM. 
;--------------------------------------------------------------------------
#SF_FORMAT_GSM610        = $0020          ; GSM 6.10 encoding. 
#SF_FORMAT_VOX_ADPCM= $0021          ; OKI / Dialogix ADPCM 
;--------------------------------------------------------------------------
#SF_FORMAT_G721_32    = $0030          ; 32kbs G721 ADPCM encoding. 
#SF_FORMAT_G723_24    = $0031          ; 24kbs G723 ADPCM encoding. 
#SF_FORMAT_G723_40    = $0032          ; 40kbs G723 ADPCM encoding. 
;--------------------------------------------------------------------------
#SF_FORMAT_DWVW_12    = $0040         ; 12 bit Delta Width Variable Word encoding. 
#SF_FORMAT_DWVW_16    = $0041         ; 16 bit Delta Width Variable Word encoding. 
#SF_FORMAT_DWVW_24    = $0042         ; 24 bit Delta Width Variable Word encoding. 
#SF_FORMAT_DWVW_N        = $0043         ; N bit Delta Width Variable Word encoding. 
;--------------------------------------------------------------------------
#SF_FORMAT_DPCM_8        = $0050          ; 8 bit differential PCM (XI only) 
#SF_FORMAT_DPCM_16    = $0051          ; 16 bit differential PCM (XI only) 
;--------------------------------------------------------------------------
#SF_FORMAT_VORBIS        = $0060          ; Xiph Vorbis encoding. 
;--------------------------------------------------------------------------
; * Endian-ness options
;--------------------------------------------------------------------------
#SF_ENDIAN_FILE            = $00000000    ; Default file endian-ness. 
#SF_ENDIAN_LITTLE        = $10000000    ; Force little endian-ness. 
#SF_ENDIAN_BIG            = $20000000    ; Force big endian-ness. 
#SF_ENDIAN_CPU            = $30000000    ; Force CPU endian-ness. 
;--------------------------------------------------------------------------
#SF_FORMAT_SUBMASK    = $0000FFFF
#SF_FORMAT_TYPEMASK    = $0FFF0000
#SF_FORMAT_ENDMASK    = $30000000
;--------------------------------------------------------------------------
#SFC_GET_LIB_VERSION                    = $1000
#SFC_GET_LOG_INFO                        = $1001
#SFC_GET_CURRENT_SF_INFO              = $1002
;--------------------------------------------------------------------------
#SFC_GET_NORM_DOUBLE                    = $1010
#SFC_GET_NORM_FLOAT                      = $1011
#SFC_SET_NORM_DOUBLE                    = $1012
#SFC_SET_NORM_FLOAT                      = $1013
#SFC_SET_SCALE_FLOAT_INT_READ      = $1014
#SFC_SET_SCALE_INT_FLOAT_WRITE    = $1015
;--------------------------------------------------------------------------
#SFC_GET_SIMPLE_FORMAT_COUNT        = $1020
#SFC_GET_SIMPLE_FORMAT                = $1021
;--------------------------------------------------------------------------
#SFC_GET_FORMAT_INFO                    = $1028
;--------------------------------------------------------------------------
#SFC_GET_FORMAT_MAJOR_COUNT          = $1030
#SFC_GET_FORMAT_MAJOR                  = $1031
#SFC_GET_FORMAT_SUBTYPE_COUNT      = $1032
#SFC_GET_FORMAT_SUBTYPE                = $1033
;--------------------------------------------------------------------------
#SFC_CALC_SIGNAL_MAX                    = $1040
#SFC_CALC_NORM_SIGNAL_MAX            = $1041
#SFC_CALC_MAX_ALL_CHANNELS          = $1042
#SFC_CALC_NORM_MAX_ALL_CHANNELS    = $1043
#SFC_GET_SIGNAL_MAX                      = $1044
#SFC_GET_MAX_ALL_CHANNELS            = $1045
;--------------------------------------------------------------------------
#SFC_SET_ADD_PEAK_CHUNK                = $1050
#SFC_SET_ADD_HEADER_PAD_CHUNK      = $1051
;--------------------------------------------------------------------------
#SFC_UPDATE_HEADER_NOW                = $1060
#SFC_SET_UPDATE_HEADER_AUTO          = $1061
;--------------------------------------------------------------------------
#SFC_FILE_TRUNCATE                      = $1080
;--------------------------------------------------------------------------
#SFC_SET_RAW_START_OFFSET            = $1090
;--------------------------------------------------------------------------
#SFC_SET_DITHER_ON_WRITE              = $10A0
#SFC_SET_DITHER_ON_READ                = $10A1
;--------------------------------------------------------------------------
#SFC_GET_DITHER_INFO_COUNT          = $10A2
#SFC_GET_DITHER_INFO                    = $10A3
;--------------------------------------------------------------------------
#SFC_GET_EMBED_FILE_INFO              = $10B0
;--------------------------------------------------------------------------
#SFC_SET_CLIPPING                        = $10C0
#SFC_GET_CLIPPING                        = $10C1
;--------------------------------------------------------------------------
#SFC_GET_INSTRUMENT                      = $10D0
#SFC_SET_INSTRUMENT                      = $10D1
;--------------------------------------------------------------------------
#SFC_GET_LOOP_INFO                      = $10E0
;--------------------------------------------------------------------------
#SFC_GET_BROADCAST_INFO                = $10F0
#SFC_SET_BROADCAST_INFO                = $10F1
;--------------------------------------------------------------------------
#SFC_GET_CHANNEL_MAP_INFO            = $1100
#SFC_SET_CHANNEL_MAP_INFO            = $1101
;--------------------------------------------------------------------------
#SFC_RAW_DATA_NEEDS_ENDSWAP          = $1110
;--------------------------------------------------------------------------
; * Support for Wavex Ambisonics Format
;--------------------------------------------------------------------------
#SFC_WAVEX_SET_AMBISONIC              = $1200
#SFC_WAVEX_GET_AMBISONIC              = $1201
;--------------------------------------------------------------------------
#SFC_SET_VBR_ENCODING_QUALITY      = $1300
;--------------------------------------------------------------------------
; * Following commands for testing only
;--------------------------------------------------------------------------
#SFC_TEST_IEEE_FLOAT_REPLACE        = $6001
;--------------------------------------------------------------------------
#SF_STR_TITLE                              = $01
#SF_STR_COPYRIGHT                        = $02
#SF_STR_SOFTWARE                          = $03
#SF_STR_ARTIST                            = $04
#SF_STR_COMMENT                            = $05
#SF_STR_DATE                                = $06
#SF_STR_ALBUM                              = $07
#SF_STR_LICENSE                            = $08
#SF_STR_TRACKNUMBER                      = $09
#SF_STR_GENRE                              = $10
;--------------------------------------------------------------------------
#SF_STR_FIRST                   =    #SF_STR_TITLE
#SF_STR_LAST                        = #SF_STR_GENRE
;--------------------------------------------------------------------------
; * True and false
;--------------------------------------------------------------------------
#SF_FALSE                          = 0
#SF_TRUE                            = 1
;--------------------------------------------------------------------------
; * Modes for opening files
;--------------------------------------------------------------------------
#SFM_READ                          = $10
#SFM_WRITE                        = $20
#SFM_RDWR                         = $30
;--------------------------------------------------------------------------
#SF_AMBISONIC_NONE                  = $40
#SF_AMBISONIC_B_FORMAT            = $41
;--------------------------------------------------------------------------
#SF_ERR_NO_ERROR                        = 0
#SF_ERR_UNRECOGNISED_FORMAT        = 1
#SF_ERR_SYSTEM                          = 2
#SF_ERR_MALFORMED_FILE              = 3
#SF_ERR_UNSUPPORTED_ENCODING      = 4
;--------------------------------------------------------------------------
Enumeration
  #SF_CHANNEL_MAP_INVALID
  #SF_CHANNEL_MAP_MONO
  #SF_CHANNEL_MAP_LEFT                            ; Apple calls this 'Left'
  #SF_CHANNEL_MAP_RIGHT                            ; Apple calls this 'Right'
  #SF_CHANNEL_MAP_CENTER                          ; Apple calls this 'Center'
  #SF_CHANNEL_MAP_FRONT_LEFT
  #SF_CHANNEL_MAP_FRONT_RIGHT
  #SF_CHANNEL_MAP_FRONT_CENTER
  #SF_CHANNEL_MAP_REAR_CENTER                    ; Apple calls this 'Center Surround' Msft calls this 'Back Center'
  #SF_CHANNEL_MAP_REAR_LEFT                      ; Apple calls this 'Left Surround' Msft calls this 'Back Left'
  #SF_CHANNEL_MAP_REAR_RIGHT                    ; Apple calls this 'Right Surround' Msft calls this 'Back Right'
  #SF_CHANNEL_MAP_LFE                                ; Apple calls this 'LFEScreen' Msft calls this 'Low Frequency' 
  #SF_CHANNEL_MAP_FRONT_LEFT_OF_CENTER    ; Apple calls this 'Left Center'
  #SF_CHANNEL_MAP_FRONT_RIGHT_OF_CENTER    ; Apple calls this 'Right Center
  #SF_CHANNEL_MAP_SIDE_LEFT                      ; Apple calls this 'Left Surround Direct'
  #SF_CHANNEL_MAP_SIDE_RIGHT                    ; Apple calls this 'Right Surround Direct'
  #SF_CHANNEL_MAP_TOP_CENTER                    ; Apple calls this 'Top Center Surround'
  #SF_CHANNEL_MAP_TOP_FRONT_LEFT              ; Apple calls this 'Vertical Height Left'
  #SF_CHANNEL_MAP_TOP_FRONT_RIGHT              ; Apple calls this 'Vertical Height Right'
  #SF_CHANNEL_MAP_TOP_FRONT_CENTER          ; Apple calls this 'Vertical Height Center'
  #SF_CHANNEL_MAP_TOP_REAR_LEFT                ; Apple and MS call this 'Top Back Left'
  #SF_CHANNEL_MAP_TOP_REAR_RIGHT              ; Apple and MS call this 'Top Back Right'
  #SF_CHANNEL_MAP_TOP_REAR_CENTER              ; Apple and MS call this 'Top Back Center'
  
  #SF_CHANNEL_MAP_AMBISONIC_B_W
  #SF_CHANNEL_MAP_AMBISONIC_B_X
  #SF_CHANNEL_MAP_AMBISONIC_B_Y
  #SF_CHANNEL_MAP_AMBISONIC_B_Z
  
  #SF_CHANNEL_MAP_MAX
EndEnumeration
;--------------------------------------------------------------------------
Structure SF_INFO
  frames.q
  samplerate.l
  channels.l
  format.l
  sections.l
  seekable.l
  
  ; it writes 4 bytes too many, no idea what it holds. header says nothing.
  garbage1.a
  garbage2.a
  garbage3.a
  garbage4.a
EndStructure
;--------------------------------------------------------------------------
Structure SF_FORMAT_INFO
  format.l
  name$
  extension$
EndStructure
;--------------------------------------------------------------------------
#SFD_DEFAULT_LEVEL                = 0
#SFD_CUSTOM_LEVEL                  = $40000000

#SFD_NO_DITHER                      = 500
#SFD_WHITE                            = 501
#SFD_TRIANGULAR_PDF                = 502
;--------------------------------------------------------------------------
Structure SF_DITHER_INFO
  type.l
  level.d
  name$
EndStructure
;--------------------------------------------------------------------------
Structure SF_EMBED_FILE_INFO
  offset.i
  length.i
EndStructure
;--------------------------------------------------------------------------
Enumeration
    #SF_LOOP_NONE = 800
    #SF_LOOP_FORWARD
    #SF_LOOP_BACKWARD
    #SF_LOOP_ALTERNATING
EndEnumeration
;--------------------------------------------------------------------------
; typedef struct
; {    int gain ;                            I HAVE NO IDEA HOW TO IMPLEMENT THIS
;     char basenote, detune ;
;     char velocity_lo, velocity_hi ;
;     char key_lo, key_hi ;
;     int loop_count ;
; 
;     struct
;     {    int mode ;
;         unsigned int start ;
;         unsigned int end ;
;         unsigned int count ;
;     } loops [16] ; /* make variable in a sensible way */
; } SF_INSTRUMENT ;
;--------------------------------------------------------------------------
Structure SF_LOOP_INFO
  time_sig_num.u
  time_sig_den.u
  loop_mode.l
  num_beats.l
  bpm.f
  root_key.l
  
  future01.l
  future02.l
  future03.l
  future04.l
  future05.l
  future06.l
EndStructure
;--------------------------------------------------------------------------
PrototypeC.i __proto_sf_vio_get_filelen(*user_data)
PrototypeC.i __proto_sf_vio_seek(offset.i, whence.i, *user_data)
PrototypeC.i __proto_sf_vio_read(*ptr, count.i, *user_data)
PrototypeC.i __proto_sf_vio_write(*ptr, count.i, *user_data)
PrototypeC.i __proto_sf_vio_tell(*user_data)
Structure SF_VIRTUAL_IO
  proc_get_filelen.__proto_sf_vio_get_filelen
  proc_seek.__proto_sf_vio_seek
  proc_read.__proto_sf_vio_read
  proc_write.__proto_sf_vio_write
  proc_tell.__proto_sf_vio_tell
EndStructure
;--------------------------------------------------------------------------

;--------------------------------------------------------------------------
; * LSF Prototypes
;--------------------------------------------------------------------------
PrototypeC.i __proto_sf_open                    (path.p-ascii, mode.i, *sfinfo.SF_INFO)
PrototypeC.i __proto_sf_open_fd                 (fd.i, mode.i, *sfinfo.SF_INFO, close_desc.i)
PrototypeC.i __proto_sf_open_virtual            (*sfvirtual.SF_VIRTUAL_IO, mode.i, *sfinfo.SF_INFO, *user_data)
PrototypeC.l __proto_sf_error                   (*sndfile)
PrototypeC.i __proto_sf_strerror                (*sndfile)
PrototypeC.i __proto_sf_error_number            (errnum.i)
PrototypeC.l __proto_sf_perror                  (*sndfile)
PrototypeC.l __proto_sf_error_str               (*sndfile, *str.p-ascii, len.l)
PrototypeC.l __proto_sf_command                 (*sndfile, command.i, *data_, datasize.i)
PrototypeC.l __proto_sf_format_check            (*info.SF_INFO)
PrototypeC.i __proto_sf_seek                    (*sndfile, frames.i, whence.i)
PrototypeC.l __proto_sf_set_string              (*sndfile, str_type.i, str.p-ascii)
PrototypeC.i __proto_sf_get_string              (*sndfile, str_type.i)
PrototypeC.i __proto_sf_version_string          ()
PrototypeC.i __proto_sf_read_raw                    (*sndfile, *ptr, bytes.i)
PrototypeC.i __proto_sf_write_raw                 (*sndfile, *ptr, bytes.i)
PrototypeC.i __proto_sf_readf_short                (*sndfile, *ptr, frames.i)
PrototypeC.i __proto_sf_writef_short              (*sndfile, *ptr, frames.i)
PrototypeC.i __proto_sf_readf_int               (*sndfile, *ptr, frames.i)
PrototypeC.i __proto_sf_writef_int              (*sndfile, *ptr, frames.i)
PrototypeC.i __proto_sf_readf_float             (*sndfile, *ptr, frames.i)
PrototypeC.i __proto_sf_writef_float            (*sndfile, *ptr, frames.i)
PrototypeC.i __proto_sf_readf_double            (*sndfile, *ptr, frames.i)
PrototypeC.i __proto_sf_writef_double           (*sndfile, *ptr, frames.i)
PrototypeC.i __proto_sf_read_short              (*sndfile, *ptr, items.i)
PrototypeC.i __proto_sf_write_short             (*sndfile, *ptr, items.i)
PrototypeC.i __proto_sf_read_int                (*sndfile, *ptr, items.i)
PrototypeC.i __proto_sf_write_int               (*sndfile, *ptr, items.i)
PrototypeC.i __proto_sf_read_float              (*sndfile, *ptr, items.i)
PrototypeC.i __proto_sf_write_float             (*sndfile, *ptr, items.i)
PrototypeC.i __proto_sf_read_double             (*sndfile, *ptr, items.i)
PrototypeC.i __proto_sf_write_double              (*sndfile, *ptr, items.i)
PrototypeC.i __proto_sf_close                   (*sndfile)
PrototypeC   __proto_sf_write_sync              (*sndfile)
PrototypeC.i __proto_sf_wchar_open              (wpath.p-unicode, mode.i, *sfinfo.SF_INFO)
;--------------------------------------------------------------------------
; * Initialize and Import libsndfile Library
;--------------------------------------------------------------------------
Procedure LSF_Initialize()
  Debug "libsndfile initializing"
  CompilerIf #PB_Compiler_Processor = #PB_Processor_x64
    DLL_LSF = OpenLibrary(#PB_Any, "x64/libsndfile.dll")
  CompilerElse
    DLL_LSF = OpenLibrary(#PB_Any, "x86/libsndfile.dll")
  CompilerEndIf
  ;--------------------------------------------------------------------------
  Global sf_open.__proto_sf_open                      = GetFunction(DLL_LSF, "sf_open")
  Global sf_open_fd.__proto_sf_open_fd                = GetFunction(DLL_LSF, "sf_open_fd")
  Global sf_open_virtual.__proto_sf_open_virtual      = GetFunction(DLL_LSF, "sf_open_virtual")
  Global sf_error.__proto_sf_error                    = GetFunction(DLL_LSF, "sf_error")
  Global sf_strerror.__proto_sf_strerror              = GetFunction(DLL_LSF, "sf_strerror")
  Global sf_error_number.__proto_sf_error_number      = GetFunction(DLL_LSF, "sf_error_number")
  Global sf_perror.__proto_sf_perror                  = GetFunction(DLL_LSF, "sf_perror")
  Global sf_error_str.__proto_sf_error_str            = GetFunction(DLL_LSF, "sf_error_str")
  Global sf_command.__proto_sf_command                = GetFunction(DLL_LSF, "sf_command")
  Global sf_format_check.__proto_sf_format_check      = GetFunction(DLL_LSF, "sf_format_check")
  Global sf_seek.__proto_sf_seek                      = GetFunction(DLL_LSF, "sf_seek")
  Global sf_set_string.__proto_sf_set_string          = GetFunction(DLL_LSF, "sf_set_string")
  Global sf_get_string.__proto_sf_get_string          = GetFunction(DLL_LSF, "sf_get_string")
  Global sf_version_string.__proto_sf_version_string  = GetFunction(DLL_LSF, "sf_version_string")
  Global sf_read_raw.__proto_sf_read_raw              = GetFunction(DLL_LSF, "sf_read_raw")
  Global sf_write_raw.__proto_sf_write_raw            = GetFunction(DLL_LSF, "sf_write_raw")
  Global sf_readf_short.__proto_sf_readf_short        = GetFunction(DLL_LSF, "sf_readf_short")
  Global sf_writef_short.__proto_sf_writef_short      = GetFunction(DLL_LSF, "sf_writef_short")
  Global sf_readf_int.__proto_sf_readf_int            = GetFunction(DLL_LSF, "sf_readf_int")
  Global sf_writef_int.__proto_sf_writef_int          = GetFunction(DLL_LSF, "sf_writef_int")
  Global sf_readf_float.__proto_sf_readf_float        = GetFunction(DLL_LSF, "sf_readf_float")
  Global sf_writef_float.__proto_sf_writef_float      = GetFunction(DLL_LSF, "sf_writef_float")
  Global sf_readf_double.__proto_sf_readf_double      = GetFunction(DLL_LSF, "sf_readf_double")
  Global sf_writef_double.__proto_sf_writef_double    = GetFunction(DLL_LSF, "sf_writef_double")
  Global sf_read_short.__proto_sf_read_short          = GetFunction(DLL_LSF, "sf_read_short")
  Global sf_write_short.__proto_sf_write_short        = GetFunction(DLL_LSF, "sf_write_short")
  Global sf_read_int.__proto_sf_read_int              = GetFunction(DLL_LSF, "sf_read_int")
  Global sf_write_int.__proto_sf_write_int            = GetFunction(DLL_LSF, "sf_write_int")
  Global sf_read_float.__proto_sf_read_float          = GetFunction(DLL_LSF, "sf_read_float")
  Global sf_write_float.__proto_sf_write_float        = GetFunction(DLL_LSF, "sf_write_float")
  Global sf_read_double.__proto_sf_read_double        = GetFunction(DLL_LSF, "sf_read_double")
  Global sf_write_double.__proto_sf_write_double      = GetFunction(DLL_LSF, "sf_write_double")
  Global sf_close.__proto_sf_close                    = GetFunction(DLL_LSF, "sf_close")
  Global sf_write_sync.__proto_sf_write_sync          = GetFunction(DLL_LSF, "sf_write_sync")
EndProcedure
;--------------------------------------------------------------------------
; * Dispose libsndfile Library
;--------------------------------------------------------------------------
Procedure LSF_Dispose()
  Debug "libsndfile closing"
  CloseLibrary(DLL_LSF)
EndProcedure
; IDE Options = PureBasic 5.71 LTS (Windows - x86)
; CursorPosition = 6
; Folding = -
; EnableXP