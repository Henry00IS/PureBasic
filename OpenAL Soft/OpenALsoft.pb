;==============================================================================
; ** OpenALsoft.pb
;------------------------------------------------------------------------------
;  This module represents an OpenAL Soft header to import the sound library.
;  http://00laboratories.com/
;==============================================================================
IncludeFile #PB_Compiler_File + "i" ;- PBHGEN

;--------------------------------------------------------------------------
Global DLL_OPENAL.i ; DLL Handle
;--------------------------------------------------------------------------
#AL_NONE                      = 0
#AL_FALSE                     = 0
#AL_TRUE                      = 1
;--------------------------------------------------------------------------
#AL_SOURCE_RELATIVE           = $202
#AL_CONE_INNER_ANGLE          = $1001
#AL_CONE_OUTER_ANGLE          = $1002
#AL_PITCH                     = $1003
#AL_POSITION                  = $1004
#AL_DIRECTION                 = $1005
#AL_VELOCITY                  = $1006
#AL_LOOPING                   = $1007
#AL_BUFFER                    = $1009
#AL_GAIN                      = $100A
#AL_MIN_GAIN                  = $100D
#AL_MAX_GAIN                  = $100E
#AL_ORIENTATION               = $100F
#AL_SOURCE_STATE              = $1010
#AL_INITIAL                   = $1011
#AL_PLAYING                   = $1012
#AL_PAUSED                    = $1013
#AL_STOPPED                   = $1014
#AL_BUFFERS_QUEUED            = $1015
#AL_BUFFERS_PROCESSED         = $1016
#AL_REFERENCE_DISTANCE        = $1020
#AL_ROLLOFF_FACTOR            = $1021
#AL_CONE_OUTER_GAIN           = $1022
#AL_MAX_DISTANCE              = $1023
#AL_SEC_OFFSET                = $1024
#AL_SAMPLE_OFFSET             = $1025
#AL_BYTE_OFFSET               = $1026
#AL_SOURCE_TYPE               = $1027
#AL_STATIC                    = $1028
#AL_STREAMING                 = $1029
#AL_UNDETERMINED              = $1030
#AL_FORMAT_MONO8              = $1100
#AL_FORMAT_MONO16             = $1101
#AL_FORMAT_STEREO8            = $1102
#AL_FORMAT_STEREO16           = $1103
#AL_FREQUENCY                 = $2001
#AL_BITS                      = $2002
#AL_CHANNELS                  = $2003
#AL_SIZE                      = $2004
#AL_UNUSED                    = $2010
#AL_PENDING                   = $2011
#AL_PROCESSED                 = $2012
#AL_NO_ERROR                  = $0000
#AL_INVALID_NAME              = $A001
#AL_INVALID_ENUM              = $A002
#AL_INVALID_VALUE             = $A003
#AL_INVALID_OPERATION         = $A004
#AL_OUT_OF_MEMORY             = $A005
#AL_VENDOR                    = $B001
#AL_VERSION                   = $B002
#AL_RENDERER                  = $B003
#AL_EXTENSIONS                = $B004
#AL_DOPPLER_FACTOR            = $C000
#AL_DOPPLER_VELOCITY          = $C001
#AL_SPEED_OF_SOUND            = $C003
#AL_DISTANCE_MODEL            = $D000
#AL_INVERSE_DISTANCE          = $D001
#AL_INVERSE_DISTANCE_CLAMPED  = $D002
#AL_LINEAR_DISTANCE           = $D003
#AL_LINEAR_DISTANCE_CLAMPED   = $D004
#AL_EXPONENT_DISTANCE         = $D005
#AL_EXPONENT_DISTANCE_CLAMPED = $D006
;--------------------------------------------------------------------------
#ALC_FALSE                            = $0000
#ALC_TRUE                             = $0001
#ALC_FREQUENCY                        = $1007
#ALC_REFRESH                          = $1008
#ALC_SYNC                             = $1009
#ALC_MONO_SOURCES                     = $1010
#ALC_STEREO_SOURCES                   = $1011
#ALC_NO_ERROR                         = $0000
#ALC_INVALID_DEVICE                   = $A001
#ALC_INVALID_CONTEXT                  = $A002
#ALC_INVALID_ENUM                     = $A003
#ALC_INVALID_VALUE                    = $A004
#ALC_OUT_OF_MEMORY                    = $A005
#ALC_MAJOR_VERSION                    = $1000
#ALC_MINOR_VERSION                    = $1001
#ALC_ATTRIBUTES_SIZE                  = $1002
#ALC_ALL_ATTRIBUTES                   = $1003
#ALC_DEFAULT_DEVICE_SPECIFIER         = $1004
#ALC_DEVICE_SPECIFIER                 = $1005
#ALC_EXTENSIONS                       = $1006
#ALC_EXT_CAPTURE                      = $0001
#ALC_CAPTURE_DEVICE_SPECIFIER         = $0310
#ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER = $0311
#ALC_CAPTURE_SAMPLES                  = $0312
#ALC_ENUMERATE_ALL_EXT                = $0001
#ALC_DEFAULT_ALL_DEVICES_SPECIFIER    = $1012
;--------------------------------------------------------------------------
PrototypeC.l __proto_alDopplerFactor            (value.f)
PrototypeC.l __proto_alDopplerVelocity          (value.f)
PrototypeC.l __proto_alSpeedOfSound             (value.f)
PrototypeC.l __proto_alDistanceModel            (distanceModel.i)
;--------------------------------------------------------------------------
; * Renderer State management
;--------------------------------------------------------------------------
PrototypeC.l __proto_alEnable                   (capability.i)
PrototypeC.l __proto_alDisable                  (capability.i)
PrototypeC.l __proto_alIsEnabled                (capability.i)
;--------------------------------------------------------------------------
; * State retrieval
;--------------------------------------------------------------------------
PrototypeC.s __proto_alGetString                (param.i)
PrototypeC.l __proto_alGetBooleanv              (param.i, *values)
PrototypeC.l __proto_alGetIntegerv              (param.i, *values)
PrototypeC.l __proto_alGetFloatv                (param.i, *values)
PrototypeC.l __proto_alGetDoublev               (param.i, *values)
PrototypeC.a __proto_alGetBoolean               (param.i)
PrototypeC.i __proto_alGetInteger               (param.i)
PrototypeC.f __proto_alGetFloat                 (param.i)
PrototypeC.d __proto_alGetDouble                (param.i)
;--------------------------------------------------------------------------
; * Error retrieval
;--------------------------------------------------------------------------
PrototypeC.i __proto_alGetError()
;--------------------------------------------------------------------------
; * Extension support
;--------------------------------------------------------------------------
PrototypeC.a __proto_alIsExtensionPresent       (*extname)
PrototypeC.i __proto_alGetProcAddress           (*fname)
PrototypeC.i __proto_alGetEnumValue             (ename$)
;--------------------------------------------------------------------------
; * Set Listener parameters
;--------------------------------------------------------------------------
PrototypeC.l __proto_alListenerf                (param.i, value.f)
PrototypeC.l __proto_alListener3f               (param.i, value1.f, value2.f, value3.f)
PrototypeC.l __proto_alListenerfv               (param.i, *values)
PrototypeC.l __proto_alListeneri                (param.i, value.i)
PrototypeC.l __proto_alListener3i               (param.i, value1.i, value2.i, value3.i)
PrototypeC.l __proto_alListeneriv               (param.i, *values)
;--------------------------------------------------------------------------
; * Get Listener parameters
;--------------------------------------------------------------------------
PrototypeC.l __proto_alGetListenerf             (param, *value)
PrototypeC.l __proto_alGetListener3f            (param, *value1, *value2, *value3)
PrototypeC.l __proto_alGetListenerfv            (param, *values)
PrototypeC.l __proto_alGetListeneri             (param, *value)
PrototypeC.l __proto_alGetListener3i            (param, *value1, *value2, *value3)
PrototypeC.l __proto_alGetListeneriv            (param, *values)
;--------------------------------------------------------------------------
; * Create Source objects
;--------------------------------------------------------------------------
PrototypeC.l __proto_alGenSources               (n.i, *sources)
;--------------------------------------------------------------------------
; * Delete Source objects
;--------------------------------------------------------------------------
PrototypeC.l __proto_alDeleteSources            (n.i, *sources)
;--------------------------------------------------------------------------
; * Verify a handle is a valid Source
;--------------------------------------------------------------------------
PrototypeC.a __proto_alIsSource                 (source.i)
;--------------------------------------------------------------------------
; * Set Source parameters
;--------------------------------------------------------------------------
PrototypeC.l __proto_alSourcef                  (source.i, param.i, value.f)
PrototypeC.l __proto_alSource3f                 (source.i, param.i, value1.f, value2.f, value3.f)
PrototypeC.l __proto_alSourcefv                 (source.i, param.i, *values)
PrototypeC.l __proto_alSourcei                  (source.i, param.i, value.i)
PrototypeC.l __proto_alSource3i                 (source.i, param.i, value1.i, value2.i, value3.i)
PrototypeC.l __proto_alSourceiv                 (source.i, param.i, *values)
;--------------------------------------------------------------------------
; * Get Source parameters
;--------------------------------------------------------------------------
PrototypeC.l __proto_alGetSourcef               (source.i, param.i, *value)
PrototypeC.l __proto_alGetSource3f              (source.i, param.i, *value1, *value2, *value3)
PrototypeC.l __proto_alGetSourcefv              (source.i, param.i, *values)
PrototypeC.l __proto_alGetSourcei               (source.i, param.i, *value)
PrototypeC.l __proto_alGetSource3i              (source.i, param.i, *value1, *value2, *value3)
PrototypeC.l __proto_alGetSourceiv              (source.i, param.i, *values)
;--------------------------------------------------------------------------
; * Play, replay, or resume (if paused) a list of Sources
;--------------------------------------------------------------------------
PrototypeC.l __proto_alSourcePlayv              (n.i, *sources)
;--------------------------------------------------------------------------
; * Stop a list of Sources
;--------------------------------------------------------------------------
PrototypeC.l __proto_alSourceStopv              (n.i, *sources)
;--------------------------------------------------------------------------
; * Rewind a list of Sources
;--------------------------------------------------------------------------
PrototypeC.l __proto_alSourceRewindv            (n.i, *sources)
;--------------------------------------------------------------------------
; * Pause a list of Sources
;--------------------------------------------------------------------------
PrototypeC.l __proto_alSourcePausev             (n.i, *sources)
;--------------------------------------------------------------------------
; * Play, replay, or resume a Source
;--------------------------------------------------------------------------
PrototypeC.l __proto_alSourcePlay               (source.i)
;--------------------------------------------------------------------------
; * Stop a Source
;--------------------------------------------------------------------------
PrototypeC.l __proto_alSourceStop               (source.i)
;--------------------------------------------------------------------------
; * Rewind a Source (set playback postiton to beginning)
;--------------------------------------------------------------------------
PrototypeC.l __proto_alSourceRewind             (source.i)
;--------------------------------------------------------------------------
; * Pause a Source
;--------------------------------------------------------------------------
PrototypeC.l __proto_alSourcePause              (source.i)
;--------------------------------------------------------------------------
; * Queue buffers onto a source
;--------------------------------------------------------------------------
PrototypeC.l __proto_alSourceQueueBuffers       (source.i, nb.i, *buffers)
;--------------------------------------------------------------------------
; * Unqueue processed buffers from a source
;--------------------------------------------------------------------------
PrototypeC.l __proto_alSourceUnqueueBuffers     (source.i, nb.i, *buffers)
;--------------------------------------------------------------------------
; * Create Buffer objects
;--------------------------------------------------------------------------
PrototypeC.l __proto_alGenBuffers               (n.i, *buffers)
;--------------------------------------------------------------------------
; * Delete Buffer objects
;--------------------------------------------------------------------------
PrototypeC.l __proto_alDeleteBuffers            (n.i, *buffers)
;--------------------------------------------------------------------------
; * Verify a handle is a valid Buffer
;--------------------------------------------------------------------------
PrototypeC.a __proto_alIsBuffer                 (buffer.i)
;--------------------------------------------------------------------------
; * Specifies the data to be copied into a buffer
;--------------------------------------------------------------------------
PrototypeC.l __proto_alBufferData               (buffer.i, format.i, *data_, size.i, freq.i)
;--------------------------------------------------------------------------
; * Set Buffer parameters
;--------------------------------------------------------------------------
PrototypeC.l __proto_alBufferf                  (buffer.i, param.i, value.f)
PrototypeC.l __proto_alBuffer3f                 (buffer.i, param.i, value1.f, value2.f, value3.f)
PrototypeC.l __proto_alBufferfv                 (buffer.i, param.i, *values)
PrototypeC.l __proto_alBufferi                  (buffer.i, param.i, value.i)
PrototypeC.l __proto_alBuffer3i                 (buffer.i, param.i, value1.i, value2.i, value3.i)
PrototypeC.l __proto_alBufferiv                 (buffer.i, param.i, *values)
;--------------------------------------------------------------------------
; * Get Buffer parameters
;--------------------------------------------------------------------------
PrototypeC.l __proto_alGetBufferf               (buffer.i, param.i, *value)
PrototypeC.l __proto_alGetBuffer3f              (buffer.i, param.i, *value1, *value2, *value3)
PrototypeC.l __proto_alGetBufferfv              (buffer.i, param.i, *values)
PrototypeC.l __proto_alGetBufferi               (buffer.i, param.i, *value)
PrototypeC.l __proto_alGetBuffer3i              (buffer.i, param.i, *value1, *value2, *value3)
PrototypeC.l __proto_alGetBufferiv              (buffer.i, param.i, *values)
;--------------------------------------------------------------------------
; * Context management
;--------------------------------------------------------------------------
PrototypeC.i __proto_alcCreateContext(*device, *attrlist)
PrototypeC.a __proto_alcMakeContextCurrent(*context)
PrototypeC.i __proto_alcProcessContext(*context)
PrototypeC.i __proto_alcSuspendContext(*context)
PrototypeC.i __proto_alcDestroyContext(*context)
PrototypeC.i __proto_alcGetCurrentContext()
PrototypeC.i __proto_alcGetContextsDevice(*context)
;--------------------------------------------------------------------------
; * Device management
;--------------------------------------------------------------------------
PrototypeC.i __proto_alcOpenDevice(*devicename)
PrototypeC.a __proto_alcCloseDevice(*device)
;--------------------------------------------------------------------------
; * Error support
;--------------------------------------------------------------------------
PrototypeC.i __proto_alcGetError(*device)
;--------------------------------------------------------------------------
; * Extension support
;--------------------------------------------------------------------------
PrototypeC.a __proto_alcIsExtensionPresent(*device, extname$)
PrototypeC.i __proto_alcGetProcAddress(*device, funcname$)
PrototypeC.i __proto_alcGetEnumValue(*device, enumname$)
;--------------------------------------------------------------------------
; * Query function
;--------------------------------------------------------------------------
PrototypeC.s __proto_alcGetString(*device, param.i)
PrototypeC.i __proto_alcGetIntegerv(*device, param.i, size.i, *values)
;--------------------------------------------------------------------------
; * Capture function
;--------------------------------------------------------------------------
PrototypeC.i __proto_alcCaptureOpenDevice(devicename$, frequency.i, format.i, buffersize.i)
PrototypeC.a __proto_alcCaptureCloseDevice(*device)
PrototypeC.i __proto_alcCaptureStart(*device)
PrototypeC.i __proto_alcCaptureStop(*device)
PrototypeC.i __proto_alcCaptureSamples(*device, *buffer, samples.i)
;--------------------------------------------------------------------------
Procedure AL_Initialize()
  Debug "OpenAL Soft Initializing"
  CompilerIf #PB_Compiler_Processor = #PB_Processor_x64
    DLL_OPENAL = OpenLibrary(#PB_Any, "x64/soft_oal.dll")
  CompilerElse
    DLL_OPENAL = OpenLibrary(#PB_Any, "x86/soft_oal.dll")
  CompilerEndIf
  
  Global alDopplerFactor.__proto_alDopplerFactor                = GetFunction(DLL_OPENAL, "alDopplerFactor")
  Global alDopplerVelocity.__proto_alDopplerVelocity            = GetFunction(DLL_OPENAL, "alDopplerVelocity")
  Global alSpeedOfSound.__proto_alSpeedOfSound                  = GetFunction(DLL_OPENAL, "alSpeedOfSound")
  Global alDistanceModel.__proto_alDistanceModel                = GetFunction(DLL_OPENAL, "alDistanceModel")
  ;--------------------------------------------------------------------------
  ; * Renderer State management
  ;--------------------------------------------------------------------------
  Global alEnable.__proto_alEnable                              = GetFunction(DLL_OPENAL, "alEnable")
  Global alDisable.__proto_alDisable                            = GetFunction(DLL_OPENAL, "alDisable")
  Global alIsEnabled.__proto_alIsEnabled                        = GetFunction(DLL_OPENAL, "alIsEnabled")
  ;--------------------------------------------------------------------------
  ; * State retrieval
  ;--------------------------------------------------------------------------
  Global alGetString.__proto_alGetString                        = GetFunction(DLL_OPENAL, "alGetString")
  Global alGetBooleanv.__proto_alGetBooleanv                    = GetFunction(DLL_OPENAL, "alGetBooleanv")
  Global alGetIntegerv.__proto_alGetIntegerv                    = GetFunction(DLL_OPENAL, "alGetIntegerv")
  Global alGetFloatv.__proto_alGetFloatv                        = GetFunction(DLL_OPENAL, "alGetFloatv")
  Global alGetDoublev.__proto_alGetDoublev                      = GetFunction(DLL_OPENAL, "alGetDoublev")
  Global alGetBoolean.__proto_alGetBoolean                      = GetFunction(DLL_OPENAL, "alGetBoolean")
  Global alGetInteger.__proto_alGetInteger                      = GetFunction(DLL_OPENAL, "alGetInteger")
  Global alGetFloat.__proto_alGetFloat                          = GetFunction(DLL_OPENAL, "alGetFloat")
  Global alGetDouble.__proto_alGetDouble                        = GetFunction(DLL_OPENAL, "alGetDouble")
  ;--------------------------------------------------------------------------
  ; * Error retrieval
  ;--------------------------------------------------------------------------
  Global alGetError.__proto_alGetError                          = GetFunction(DLL_OPENAL, "alGetError")
  ;--------------------------------------------------------------------------
  ; * Extension support
  ;--------------------------------------------------------------------------
  Global alIsExtensionPresent.__proto_alIsExtensionPresent      = GetFunction(DLL_OPENAL, "alIsExtensionPresent")
  Global alGetProcAddress.__proto_alGetProcAddress              = GetFunction(DLL_OPENAL, "alGetProcAddress")
  Global alGetEnumValue.__proto_alGetEnumValue                  = GetFunction(DLL_OPENAL, "alGetEnumValue")
  ;--------------------------------------------------------------------------
  ; * Set Listener parameters
  ;--------------------------------------------------------------------------
  Global alListenerf.__proto_alListenerf                        = GetFunction(DLL_OPENAL, "alListenerf")
  Global alListener3f.__proto_alListener3f                      = GetFunction(DLL_OPENAL, "alListener3f")
  Global alListenerfv.__proto_alListenerfv                      = GetFunction(DLL_OPENAL, "alListenerfv")
  Global alListeneri.__proto_alListeneri                        = GetFunction(DLL_OPENAL, "alListeneri")
  Global alListener3i.__proto_alListener3i                      = GetFunction(DLL_OPENAL, "alListener3i")
  Global alListeneriv.__proto_alListeneriv                      = GetFunction(DLL_OPENAL, "alListeneriv")
  ;--------------------------------------------------------------------------
  ; * Get Listener parameters
  ;--------------------------------------------------------------------------
  Global alGetListenerf.__proto_alGetListenerf                  = GetFunction(DLL_OPENAL, "alGetListenerf")
  Global alGetListener3f.__proto_alGetListener3f                = GetFunction(DLL_OPENAL, "alGetListener3f")
  Global alGetListenerfv.__proto_alGetListenerfv                = GetFunction(DLL_OPENAL, "alGetListenerfv")
  Global alGetListeneri.__proto_alGetListeneri                  = GetFunction(DLL_OPENAL, "alGetListeneri")
  Global alGetListener3i.__proto_alGetListener3i                = GetFunction(DLL_OPENAL, "alGetListener3i")
  Global alGetListeneriv.__proto_alGetListeneriv                = GetFunction(DLL_OPENAL, "alGetListeneriv")
  ;--------------------------------------------------------------------------
  ; * Create Source objects
  ;--------------------------------------------------------------------------
  Global alGenSources.__proto_alGenSources                      = GetFunction(DLL_OPENAL, "alGenSources")
  ;--------------------------------------------------------------------------
  ; * Delete Source objects
  ;--------------------------------------------------------------------------
  Global alDeleteSources.__proto_alDeleteSources                = GetFunction(DLL_OPENAL, "alDeleteSources")
  ;--------------------------------------------------------------------------
  ; * Verify a handle is a valid Source
  ;--------------------------------------------------------------------------
  Global alIsSource.__proto_alIsSource                          = GetFunction(DLL_OPENAL, "alIsSource")
  ;--------------------------------------------------------------------------
  ; * Set Source parameters
  ;--------------------------------------------------------------------------
  Global alSourcef.__proto_alSourcef                            = GetFunction(DLL_OPENAL, "alSourcef")
  Global alSource3f.__proto_alSource3f                          = GetFunction(DLL_OPENAL, "alSource3f")
  Global alSourcefv.__proto_alSourcefv                          = GetFunction(DLL_OPENAL, "alSourcefv")
  Global alSourcei.__proto_alSourcei                            = GetFunction(DLL_OPENAL, "alSourcei")
  Global alSource3i.__proto_alSource3i                          = GetFunction(DLL_OPENAL, "alSource3i")
  Global alSourceiv.__proto_alSourceiv                          = GetFunction(DLL_OPENAL, "alSourceiv")
  ;--------------------------------------------------------------------------
  ; * Get Source parameters
  ;--------------------------------------------------------------------------
  Global alGetSourcef.__proto_alGetSourcef                      = GetFunction(DLL_OPENAL, "alGetSourcef")
  Global alGetSource3f.__proto_alGetSource3f                    = GetFunction(DLL_OPENAL, "alGetSource3f")
  Global alGetSourcefv.__proto_alGetSourcefv                    = GetFunction(DLL_OPENAL, "alGetSourcefv")
  Global alGetSourcei.__proto_alGetSourcei                      = GetFunction(DLL_OPENAL, "alGetSourcei")
  Global alGetSource3i.__proto_alGetSource3i                    = GetFunction(DLL_OPENAL, "alGetSource3i")
  Global alGetSourceiv.__proto_alGetSourceiv                    = GetFunction(DLL_OPENAL, "alGetSourceiv")
  ;--------------------------------------------------------------------------
  ; * Play, replay, or resume (if paused) a list of Sources
  ;--------------------------------------------------------------------------
  Global alSourcePlayv.__proto_alSourcePlayv                    = GetFunction(DLL_OPENAL, "alSourcePlayv")
  ;--------------------------------------------------------------------------
  ; * Stop a list of Sources
  ;--------------------------------------------------------------------------
  Global alSourceStopv.__proto_alSourceStopv                    = GetFunction(DLL_OPENAL, "alSourceStopv")
  ;--------------------------------------------------------------------------
  ; * Rewind a list of Sources
  ;--------------------------------------------------------------------------
  Global alSourceRewindv.__proto_alSourceRewindv                = GetFunction(DLL_OPENAL, "alSourceRewindv")
  ;--------------------------------------------------------------------------
  ; * Pause a list of Sources
  ;--------------------------------------------------------------------------
  Global alSourcePausev.__proto_alSourcePausev                  = GetFunction(DLL_OPENAL, "alSourcePausev")
  ;--------------------------------------------------------------------------
  ; * Play, replay, or resume a Source
  ;--------------------------------------------------------------------------
  Global alSourcePlay.__proto_alSourcePlay                      = GetFunction(DLL_OPENAL, "alSourcePlay")
  ;--------------------------------------------------------------------------
  ; * Stop a Source
  ;--------------------------------------------------------------------------
  Global alSourceStop.__proto_alSourceStop                      = GetFunction(DLL_OPENAL, "alSourceStop")
  ;--------------------------------------------------------------------------
  ; * Rewind a Source (set playback postiton to beginning)
  ;--------------------------------------------------------------------------
  Global alSourceRewind.__proto_alSourceRewind                  = GetFunction(DLL_OPENAL, "alSourceRewind")
  ;--------------------------------------------------------------------------
  ; * Pause a Source
  ;--------------------------------------------------------------------------
  Global alSourcePause.__proto_alSourcePause                    = GetFunction(DLL_OPENAL, "alSourcePause")
  ;--------------------------------------------------------------------------
  ; * Queue buffers onto a source
  ;--------------------------------------------------------------------------
  Global alSourceQueueBuffers.__proto_alSourceQueueBuffers      = GetFunction(DLL_OPENAL, "alSourceQueueBuffers")
  ;--------------------------------------------------------------------------
  ; * Unqueue processed buffers from a source
  ;--------------------------------------------------------------------------
  Global alSourceUnqueueBuffers.__proto_alSourceUnqueueBuffers  = GetFunction(DLL_OPENAL, "alSourceUnqueueBuffers")
  ;--------------------------------------------------------------------------
  ; * Create Buffer objects
  ;--------------------------------------------------------------------------
  Global alGenBuffers.__proto_alGenBuffers                      = GetFunction(DLL_OPENAL, "alGenBuffers")
  ;--------------------------------------------------------------------------
  ; * Delete Buffer objects
  ;--------------------------------------------------------------------------
  Global alDeleteBuffers.__proto_alDeleteBuffers                = GetFunction(DLL_OPENAL, "alDeleteBuffers")
  ;--------------------------------------------------------------------------
  ; * Verify a handle is a valid Buffer
  ;--------------------------------------------------------------------------
  Global alIsBuffer.__proto_alIsBuffer                          = GetFunction(DLL_OPENAL, "alIsBuffer")
  ;--------------------------------------------------------------------------
  ; * Specifies the data to be copied into a buffer
  ;--------------------------------------------------------------------------
  Global alBufferData.__proto_alBufferData                      = GetFunction(DLL_OPENAL, "alBufferData")
  ;--------------------------------------------------------------------------
  ; * Set Buffer parameters
  ;--------------------------------------------------------------------------
  Global alBufferf.__proto_alBufferf                            = GetFunction(DLL_OPENAL, "alBufferf")
  Global alBuffer3f.__proto_alBuffer3f                          = GetFunction(DLL_OPENAL, "alBuffer3f")
  Global alBufferfv.__proto_alBufferfv                          = GetFunction(DLL_OPENAL, "alBufferfv")
  Global alBufferi.__proto_alBufferi                            = GetFunction(DLL_OPENAL, "alBufferi")
  Global alBuffer3i.__proto_alBuffer3i                          = GetFunction(DLL_OPENAL, "alBuffer3i")
  Global alBufferiv.__proto_alBufferiv                          = GetFunction(DLL_OPENAL, "alBufferiv")
  ;--------------------------------------------------------------------------
  ; * Get Buffer parameters
  ;--------------------------------------------------------------------------
  Global alGetBufferf.__proto_alGetBufferf                      = GetFunction(DLL_OPENAL, "alGetBufferf")
  Global alGetBuffer3f.__proto_alGetBuffer3f                    = GetFunction(DLL_OPENAL, "alGetBuffer3f")
  Global alGetBufferfv.__proto_alGetBufferfv                    = GetFunction(DLL_OPENAL, "alGetBufferfv")
  Global alGetBufferi.__proto_alGetBufferi                      = GetFunction(DLL_OPENAL, "alGetBufferi")
  Global alGetBuffer3i.__proto_alGetBuffer3i                    = GetFunction(DLL_OPENAL, "alGetBuffer3i")
  Global alGetBufferiv.__proto_alGetBufferiv                    = GetFunction(DLL_OPENAL, "alGetBufferiv")
  ;--------------------------------------------------------------------------
  ; * Context management
  ;--------------------------------------------------------------------------
  Global alcCreateContext.__proto_alcCreateContext              = GetFunction(DLL_OPENAL, "alcCreateContext")
  Global alcMakeContextCurrent.__proto_alcMakeContextCurrent    = GetFunction(DLL_OPENAL, "alcMakeContextCurrent")
  Global alcProcessContext.__proto_alcProcessContext            = GetFunction(DLL_OPENAL, "alcProcessContext")
  Global alcSuspendContext.__proto_alcSuspendContext            = GetFunction(DLL_OPENAL, "alcSuspendContext")
  Global alcDestroyContext.__proto_alcDestroyContext            = GetFunction(DLL_OPENAL, "alcDestroyContext")
  Global alcGetCurrentContext.__proto_alcGetCurrentContext      = GetFunction(DLL_OPENAL, "alcGetCurrentContext")
  Global alcGetContextsDevice.__proto_alcGetContextsDevice      = GetFunction(DLL_OPENAL, "alcGetContextsDevice")
  ;--------------------------------------------------------------------------
  ; * Device management
  ;--------------------------------------------------------------------------
  Global alcOpenDevice.__proto_alcOpenDevice                    = GetFunction(DLL_OPENAL, "alcOpenDevice")
  Global alcCloseDevice.__proto_alcCloseDevice                  = GetFunction(DLL_OPENAL, "alcCloseDevice")
  ;--------------------------------------------------------------------------
  ; * Error support
  ;--------------------------------------------------------------------------
  Global alcGetError.__proto_alcGetError                        = GetFunction(DLL_OPENAL, "alcGetError")
  ;--------------------------------------------------------------------------
  ; * Extension support
  ;--------------------------------------------------------------------------
  Global alcIsExtensionPresent.__proto_alcIsExtensionPresent    = GetFunction(DLL_OPENAL, "alcIsExtensionPresent")
  Global alcGetProcAddress.__proto_alcGetProcAddress            = GetFunction(DLL_OPENAL, "alcGetProcAddress")
  Global alcGetEnumValue.__proto_alcGetEnumValue                = GetFunction(DLL_OPENAL, "alcGetEnumValue")
  ;--------------------------------------------------------------------------
  ; * Query function
  ;--------------------------------------------------------------------------
  Global alcGetString.__proto_alcGetString                      = GetFunction(DLL_OPENAL, "alcGetString")
  Global alcGetIntegerv.__proto_alcGetIntegerv                  = GetFunction(DLL_OPENAL, "alcGetIntegerv")
  ;--------------------------------------------------------------------------
  ; * Capture function
  ;--------------------------------------------------------------------------
  Global alcCaptureOpenDevice.__proto_alcCaptureOpenDevice      = GetFunction(DLL_OPENAL, "alcCaptureOpenDevice")
  Global alcCaptureCloseDevice.__proto_alcCaptureCloseDevice    = GetFunction(DLL_OPENAL, "alcCaptureCloseDevice")
  Global alcCaptureStart.__proto_alcCaptureStart                = GetFunction(DLL_OPENAL, "alcCaptureStart")
  Global alcCaptureStop.__proto_alcCaptureStop                  = GetFunction(DLL_OPENAL, "alcCaptureStop")
  Global alcCaptureSamples.__proto_alcCaptureSamples            = GetFunction(DLL_OPENAL, "alcCaptureSamples")
EndProcedure

Procedure AL_Dispose()
  Debug "OpenAL Soft Closing"
  CloseLibrary(DLL_OPENAL)
EndProcedure

Procedure AL_GetFormatFromChannelCount(ChannelCount.i)
  Select ChannelCount
    Case 1
      ProcedureReturn #AL_FORMAT_MONO16
    Case 2
      ProcedureReturn #AL_FORMAT_STEREO16
    Case 4
      ProcedureReturn alGetEnumValue("AL_FORMAT_QUAD16")
    Case 6
      ProcedureReturn alGetEnumValue("AL_FORMAT_51CHN16")
    Case 7
      ProcedureReturn alGetEnumValue("AL_FORMAT_61CHN16")
    Case 8
      ProcedureReturn alGetEnumValue("AL_FORMAT_71CHN16")
    Default
      ProcedureReturn 0
  EndSelect
EndProcedure
; IDE Options = PureBasic 5.71 LTS (Windows - x86)
; CursorPosition = 7
; Folding = -
; EnableXP