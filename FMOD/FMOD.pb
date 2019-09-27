;==============================================================================
; ** FMOD.pb
;------------------------------------------------------------------------------
;  This module represents an FMOD header to import the sound library.
;  http://00laboratories.com/
;==============================================================================
IncludeFile #PB_Compiler_File + "i" ;- PBHGEN

;--------------------------------------------------------------------------
Global DLL_FMOD.i ; DLL Handle
;--------------------------------------------------------------------------
; 0xaaaabbcc -> aaaa = major version number.  bb = minor version number.  cc = development version number.
#FMOD_VERSION = $00010515
;--------------------------------------------------------------------------
Enumeration
  #FMOD_OK                            ; No errors.
  #FMOD_ERR_BADCOMMAND                ; Tried to call a function on a data type that does not allow this type of functionality (ie calling Sound::lock on a streaming sound).
  #FMOD_ERR_CHANNEL_ALLOC             ; Error trying to allocate a channel.
  #FMOD_ERR_CHANNEL_STOLEN            ; The specified channel has been reused to play another sound.
  #FMOD_ERR_DMA                       ; DMA Failure.  See debug output for more information.
  #FMOD_ERR_DSP_CONNECTION            ; DSP connection error.  Connection possibly caused a cyclic dependency or connected dsps with incompatible buffer counts.
  #FMOD_ERR_DSP_DONTPROCESS           ; DSP return code from a DSP process query callback.  Tells mixer not to call the process callback and therefore not consume CPU.  Use this to optimize the DSP graph.
  #FMOD_ERR_DSP_FORMAT                ; DSP Format error.  A DSP unit may have attempted to connect to this network with the wrong format, or a matrix may have been set with the wrong size if the target unit has a specified channel map.
  #FMOD_ERR_DSP_INUSE                 ; DSP is already in the mixer's DSP network. It must be removed before being reinserted or released.
  #FMOD_ERR_DSP_NOTFOUND              ; DSP connection error.  Couldn't find the DSP unit specified.
  #FMOD_ERR_DSP_RESERVED              ; DSP operation error.  Cannot perform operation on this DSP as it is reserved by the system.
  #FMOD_ERR_DSP_SILENCE               ; DSP return code from a DSP process query callback.  Tells mixer silence would be produced from read, so go idle and not consume CPU.  Use this to optimize the DSP graph.
  #FMOD_ERR_DSP_TYPE                  ; DSP operation cannot be performed on a DSP of this type.
  #FMOD_ERR_FILE_BAD                  ; Error loading file.
  #FMOD_ERR_FILE_COULDNOTSEEK         ; Couldn't perform seek operation.  This is a limitation of the medium (ie netstreams) or the file format.
  #FMOD_ERR_FILE_DISKEJECTED          ; Media was ejected while reading.
  #FMOD_ERR_FILE_EOF                  ; End of file unexpectedly reached while trying to read essential data (truncated?).
  #FMOD_ERR_FILE_ENDOFDATA            ; End of current chunk reached while trying to read data.
  #FMOD_ERR_FILE_NOTFOUND             ; File not found.
  #FMOD_ERR_FORMAT                    ; Unsupported file or audio format.
  #FMOD_ERR_HEADER_MISMATCH           ; There is a version mismatch between the FMOD header and either the FMOD Studio library or the FMOD Low Level library.
  #FMOD_ERR_HTTP                      ; A HTTP error occurred. This is a catch-all for HTTP errors not listed elsewhere.
  #FMOD_ERR_HTTP_ACCESS               ; The specified resource requires authentication or is forbidden.
  #FMOD_ERR_HTTP_PROXY_AUTH           ; Proxy authentication is required to access the specified resource.
  #FMOD_ERR_HTTP_SERVER_ERROR         ; A HTTP server error occurred.
  #FMOD_ERR_HTTP_TIMEOUT              ; The HTTP request timed out.
  #FMOD_ERR_INITIALIZATION            ; FMOD was not initialized correctly to support this function.
  #FMOD_ERR_INITIALIZED               ; Cannot call this command after System::init.
  #FMOD_ERR_INTERNAL                  ; An error occurred that wasn't supposed to.  Contact support.
  #FMOD_ERR_INVALID_FLOAT             ; Value passed in was a NaN, Inf or denormalized float.
  #FMOD_ERR_INVALID_HANDLE            ; An invalid object handle was used.
  #FMOD_ERR_INVALID_PARAM             ; An invalid parameter was passed to this function.
  #FMOD_ERR_INVALID_POSITION          ; An invalid seek position was passed to this function.
  #FMOD_ERR_INVALID_SPEAKER           ; An invalid speaker was passed to this function based on the current speaker mode.
  #FMOD_ERR_INVALID_SYNCPOINT         ; The syncpoint did not come from this sound handle.
  #FMOD_ERR_INVALID_THREAD            ; Tried to call a function on a thread that is not supported.
  #FMOD_ERR_INVALID_VECTOR            ; The vectors passed in are not unit length, or perpendicular.
  #FMOD_ERR_MAXAUDIBLE                ; Reached maximum audible playback count for this sound's soundgroup.
  #FMOD_ERR_MEMORY                    ; Not enough memory or resources.
  #FMOD_ERR_MEMORY_CANTPOINT          ; Can't use #FMOD_OPENMEMORY_POINT on non PCM source data, or non mp3/xma/adpcm data if #FMOD_CREATECOMPRESSEDSAMPLE was used.
  #FMOD_ERR_NEEDS3D                   ; Tried to call a command on a 2d sound when the command was meant for 3d sound.
  #FMOD_ERR_NEEDSHARDWARE             ; Tried to use a feature that requires hardware support.
  #FMOD_ERR_NET_CONNECT               ; Couldn't connect to the specified host.
  #FMOD_ERR_NET_SOCKET_ERROR          ; A socket error occurred.  This is a catch-all for socket-related errors not listed elsewhere.
  #FMOD_ERR_NET_URL                   ; The specified URL couldn't be resolved.
  #FMOD_ERR_NET_WOULD_BLOCK           ; Operation on a non-blocking socket could not complete immediately.
  #FMOD_ERR_NOTREADY                  ; Operation could not be performed because specified sound/DSP connection is not ready.
  #FMOD_ERR_OUTPUT_ALLOCATED          ; Error initializing output device, but more specifically, the output device is already in use and cannot be reused.
  #FMOD_ERR_OUTPUT_CREATEBUFFER       ; Error creating hardware sound buffer.
  #FMOD_ERR_OUTPUT_DRIVERCALL         ; A call to a standard soundcard driver failed, which could possibly mean a bug in the driver or resources were missing or exhausted.
  #FMOD_ERR_OUTPUT_FORMAT             ; Soundcard does not support the specified format.
  #FMOD_ERR_OUTPUT_INIT               ; Error initializing output device.
  #FMOD_ERR_OUTPUT_NODRIVERS          ; The output device has no drivers installed.  If pre-init, #FMOD_OUTPUT_NOSOUND is selected as the output mode.  If post-init, the function just fails.
  #FMOD_ERR_PLUGIN                    ; An unspecified error has been returned from a plugin.
  #FMOD_ERR_PLUGIN_MISSING            ; A requested output, dsp unit type or codec was not available.
  #FMOD_ERR_PLUGIN_RESOURCE           ; A resource that the plugin requires cannot be found. (ie the DLS file for MIDI playback)
  #FMOD_ERR_PLUGIN_VERSION            ; A plugin was built with an unsupported SDK version.
  #FMOD_ERR_RECORD                    ; An error occurred trying to initialize the recording device.
  #FMOD_ERR_REVERB_CHANNELGROUP       ; Reverb properties cannot be set on this channel because a parent channelgroup owns the reverb connection.
  #FMOD_ERR_REVERB_INSTANCE           ; Specified instance in #FMOD_REVERB_PROPERTIES couldn't be set. Most likely because it is an invalid instance number or the reverb doesn't exist.
  #FMOD_ERR_SUBSOUNDS                 ; The error occurred because the sound referenced contains subsounds when it shouldn't have, or it doesn't contain subsounds when it should have.  The operation may also not be able to be performed on a parent sound.
  #FMOD_ERR_SUBSOUND_ALLOCATED        ; This subsound is already being used by another sound, you cannot have more than one parent to a sound.  Null out the other parent's entry first.
  #FMOD_ERR_SUBSOUND_CANTMOVE         ; Shared subsounds cannot be replaced or moved from their parent stream, such as when the parent stream is an FSB file.
  #FMOD_ERR_TAGNOTFOUND               ; The specified tag could not be found or there are no tags.
  #FMOD_ERR_TOOMANYCHANNELS           ; The sound created exceeds the allowable input channel count.  This can be increased using the 'maxinputchannels' parameter in System::setSoftwareFormat.
  #FMOD_ERR_TRUNCATED                 ; The retrieved string is too long to fit in the supplied buffer and has been truncated.
  #FMOD_ERR_UNIMPLEMENTED             ; Something in FMOD hasn't been implemented when it should be! contact support!
  #FMOD_ERR_UNINITIALIZED             ; This command failed because System::init or System::setDriver was not called.
  #FMOD_ERR_UNSUPPORTED               ; A command issued was not supported by this object.  Possibly a plugin without certain callbacks specified.
  #FMOD_ERR_VERSION                   ; The version number of this file format is not supported.
  #FMOD_ERR_EVENT_ALREADY_LOADED      ; The specified bank has already been loaded.
  #FMOD_ERR_EVENT_LIVEUPDATE_BUSY     ; The live update connection failed due to the game already being connected.
  #FMOD_ERR_EVENT_LIVEUPDATE_MISMATCH ; The live update connection failed due to the game data being out of sync with the tool.
  #FMOD_ERR_EVENT_LIVEUPDATE_TIMEOUT  ; The live update connection timed out.
  #FMOD_ERR_EVENT_NOTFOUND            ; The requested event, bus or vca could not be found.
  #FMOD_ERR_STUDIO_UNINITIALIZED      ; The Studio::System object is not yet initialized.
  #FMOD_ERR_STUDIO_NOT_LOADED         ; The specified resource is not loaded, so it can't be unloaded.
  ;--------------------------------------------------------------------------
  #FMOD_ERR_INVALID_STRING            ; An invalid string was passed to this function.
  #FMOD_ERR_ALREADY_LOCKED            ; The specified resource is already locked.
  #FMOD_ERR_NOT_LOCKED                ; The specified resource is not locked, so it can't be unlocked.
EndEnumeration
;--------------------------------------------------------------------------
Enumeration ; FMOD_CHANNELCONTROL_TYPE
  #FMOD_CHANNELCONTROL_CHANNEL
  #FMOD_CHANNELCONTROL_CHANNELGROUP
EndEnumeration
;--------------------------------------------------------------------------
Structure FMOD_VECTOR
  X.f ; X co-ordinate in 3D space.
  Y.f ; Y co-ordinate in 3D space.
  Z.f ; Z co-ordinate in 3D space.
EndStructure
;--------------------------------------------------------------------------
Structure FMOD_3D_ATTRIBUTES
  Position.FMOD_VECTOR
  Velocity.FMOD_VECTOR
  Forward.FMOD_VECTOR
  Up.FMOD_VECTOR
EndStructure
;--------------------------------------------------------------------------
Structure FMOD_GUID
  Data1.l ; Specifies the first 8 hexadecimal digits of the GUID.
  Data2.u ; Specifies the first group of 4 hexadecimal digits.
  Data3.u ; Specifies the second group of 4 hexadecimal digits.
  Data4.a[8] ; Array of 8 bytes. The first 2 bytes contain the third group of 4 hexadecimal digits. The remaining 6 bytes contain the final 12 hexadecimal digits.
EndStructure
;--------------------------------------------------------------------------
Macro FMOD_ASYNCREADINFO : : EndMacro ; PureBasic IDE Suggestion Helper.
Prototype __proto_FMOD_ASYNCREADINFO_DONE(*info#FMOD_ASYNCREADINFO, result.l)
UndefineMacro FMOD_ASYNCREADINFO

Structure FMOD_ASYNCREADINFO
  *handle       ; [r] The file handle that was filled out in the open callback.
  offset.l      ; [r] Seek position, make sure you read from this file offset.
  sizebytes.l   ; [r] how many bytes requested for read.
  priority.l    ; [r] 0 = low importance.  100 = extremely important (ie 'must read now or stuttering may occur').
  *userdata     ; [r/w] User data pointer specific to this request.  Initially 0, can be ignored or set by the user. Not related to the file's main userdata member.
  *buffer       ; [w] Buffer to read file data into.
  bytesread.l   ; [w] Fill this in before setting result code to tell FMOD how many bytes were read.
  *done.__proto_FMOD_ASYNCREADINFO_DONE ; [r] FMOD file system wake up function. Call this when user file read is finished. Pass result of file read as a parameter.
EndStructure
;--------------------------------------------------------------------------
Enumeration
  #FMOD_OUTPUTTYPE_AUTODETECT   ; Picks the best output mode for the platform. This is the default.
  ;--------------------------------------------------------------------------
  #FMOD_OUTPUTTYPE_UNKNOWN      ; All - 3rd party plugin, unknown. This is for use with System::getOutput only.
  #FMOD_OUTPUTTYPE_NOSOUND      ; All - Perform all mixing but discard the final output.
  #FMOD_OUTPUTTYPE_WAVWRITER    ; All - Writes output to a .wav file.
  #FMOD_OUTPUTTYPE_NOSOUND_NRT  ; All - Non-realtime version of #FMOD_OUTPUTTYPE_NOSOUND. User can drive mixer with System::update at whatever rate they want.
  #FMOD_OUTPUTTYPE_WAVWRITER_NRT; All - Non-realtime version of #FMOD_OUTPUTTYPE_WAVWRITER. User can drive mixer with System::update at whatever rate they want.
  ;--------------------------------------------------------------------------
  #FMOD_OUTPUTTYPE_DSOUND       ; Win                  - Direct Sound.                        (Default on Windows XP and below)
  #FMOD_OUTPUTTYPE_WINMM        ; Win                  - Windows Multimedia.
  #FMOD_OUTPUTTYPE_WASAPI       ; Win/WinStore/XboxOne - Windows Audio Session API.           (Default on Windows Vista and above, Xbox One and Windows Store Applications)
  #FMOD_OUTPUTTYPE_ASIO         ; Win                  - Low latency ASIO 2.0.
  #FMOD_OUTPUTTYPE_PULSEAUDIO   ; Linux                - Pulse Audio.                         (Default on Linux if available)
  #FMOD_OUTPUTTYPE_ALSA         ; Linux                - Advanced Linux Sound Architecture.   (Default on Linux if PulseAudio isn't available)
  #FMOD_OUTPUTTYPE_COREAUDIO    ; Mac/iOS              - Core Audio.                          (Default on Mac and iOS)
  #FMOD_OUTPUTTYPE_XBOX360      ; Xbox 360             - XAudio.                              (Default on Xbox 360)
  #FMOD_OUTPUTTYPE_PS3          ; PS3                  - Audio Out.                           (Default on PS3)
  #FMOD_OUTPUTTYPE_AUDIOTRACK   ; Android              - Java Audio Track.                    (Default on Android 2.2 and below)
  #FMOD_OUTPUTTYPE_OPENSL       ; Android              - OpenSL ES.                           (Default on Android 2.3 and above)
  #FMOD_OUTPUTTYPE_WIIU         ; Wii U                - AX.                                  (Default on Wii U)
  #FMOD_OUTPUTTYPE_AUDIOOUT     ; PS4/PSVita           - Audio Out.                           (Default on PS4 and PS Vita)
  ;--------------------------------------------------------------------------
  #FMOD_OUTPUTTYPE_MAX          ; Maximum number of output types supported.
EndEnumeration
;--------------------------------------------------------------------------
Enumeration
  #FMOD_DEBUG_MODE_TTY      ; Default log location per platform, i.e. Visual Studio output window, stderr, LogCat, etc
  #FMOD_DEBUG_MODE_FILE     ; Write log to specified file path
  #FMOD_DEBUG_MODE_CALLBACK ; Call specified callback with log information
EndEnumeration
;--------------------------------------------------------------------------
#FMOD_DEBUG_LEVEL_NONE           = $00000000 ; Disable all messages
#FMOD_DEBUG_LEVEL_ERROR          = $00000001 ; Enable only error messages.
#FMOD_DEBUG_LEVEL_WARNING        = $00000002 ; Enable warning and error messages.
#FMOD_DEBUG_LEVEL_LOG            = $00000004 ; Enable informational, warning and error messages (default).
#FMOD_DEBUG_TYPE_MEMORY          = $00000100 ; Verbose logging for memory operations, only use this if you are debugging a memory related issue.
#FMOD_DEBUG_TYPE_FILE            = $00000200 ; Verbose logging for file access, only use this if you are debugging a file related issue.
#FMOD_DEBUG_TYPE_CODEC           = $00000400 ; Verbose logging for codec initialization, only use this if you are debugging a codec related issue.
#FMOD_DEBUG_TYPE_TRACE           = $00000800 ; Verbose logging for internal errors, use this for tracking the origin of error codes.
#FMOD_DEBUG_DISPLAY_TIMESTAMPS   = $00010000 ; Display the time stamp of the log message in milliseconds.
#FMOD_DEBUG_DISPLAY_LINENUMBERS  = $00020000 ; Display the source code file and line number for where the message originated.
#FMOD_DEBUG_DISPLAY_THREAD       = $00040000 ; Display the thread ID of the calling function that generated the message.
;--------------------------------------------------------------------------
#FMOD_MEMORY_NORMAL              = $00000000 ; Standard memory. 
#FMOD_MEMORY_STREAM_FILE         = $00000001 ; Stream file buffer, size controllable with System::setStreamBufferSize. 
#FMOD_MEMORY_STREAM_DECODE       = $00000002 ; Stream decode buffer, size controllable with FMOD_CREATESOUNDEXINFO::decodebuffersize. 
#FMOD_MEMORY_SAMPLEDATA          = $00000004 ; Sample data buffer.  Raw audio data, usually PCM/MPEG/ADPCM/XMA data. 
#FMOD_MEMORY_DSP_BUFFER          = $00000008 ; DSP memory block allocated when more than 1 output exists on a DSP node. 
#FMOD_MEMORY_PLUGIN              = $00000010 ; Memory allocated by a third party plugin. 
#FMOD_MEMORY_XBOX360_PHYSICAL    = $00100000 ; Requires XPhysicalAlloc / XPhysicalFree. 
#FMOD_MEMORY_PERSISTENT          = $00200000 ; Persistent memory. Memory will be freed when System::release is called. 
#FMOD_MEMORY_SECONDARY           = $00400000 ; Secondary memory. Allocation should be in secondary memory. For example RSX on the PS3. 
#FMOD_MEMORY_ALL                 = $FFFFFFFF
;--------------------------------------------------------------------------
Enumeration
  #FMOD_SPEAKERMODE_DEFAULT       ; Default speaker mode based on operating system/output mode.  Windows = control panel setting, Xbox = 5.1, PS3 = 7.1 etc.
  #FMOD_SPEAKERMODE_RAW           ; There is no specific speakermode.  Sound channels are mapped in order of input to output.  Use System::setSoftwareFormat to specify speaker count. See remarks for more information.
  #FMOD_SPEAKERMODE_MONO          ; The speakers are monaural. 
  #FMOD_SPEAKERMODE_STEREO        ; The speakers are stereo. 
  #FMOD_SPEAKERMODE_QUAD          ; 4 speaker setup.    This includes front left, front right, surround left, surround right.
  #FMOD_SPEAKERMODE_SURROUND      ; 5 speaker setup.    This includes front left, front right, center, surround left, surround right.
  #FMOD_SPEAKERMODE_5POINT1       ; 5.1 speaker setup.  This includes front left, front right, center, surround left, surround right and an LFE speaker.
  #FMOD_SPEAKERMODE_7POINT1       ; 7.1 speaker setup.  This includes front left, front right, center, surround left, surround right, back left, back right and an LFE speaker.
  ;--------------------------------------------------------------------------
  #FMOD_SPEAKERMODE_MAX           ; Maximum number of speaker modes supported.
EndEnumeration
;--------------------------------------------------------------------------
Enumeration
  #FMOD_SPEAKER_FRONT_LEFT
  #FMOD_SPEAKER_FRONT_RIGHT
  #FMOD_SPEAKER_FRONT_CENTER
  #FMOD_SPEAKER_LOW_FREQUENCY
  #FMOD_SPEAKER_SURROUND_LEFT
  #FMOD_SPEAKER_SURROUND_RIGHT
  #FMOD_SPEAKER_BACK_LEFT
  #FMOD_SPEAKER_BACK_RIGHT
  ;--------------------------------------------------------------------------
  #FMOD_SPEAKER_MAX               ; Maximum number of speaker types supported.
EndEnumeration
;--------------------------------------------------------------------------
#FMOD_CHANNELMASK_FRONT_LEFT      = $00000001
#FMOD_CHANNELMASK_FRONT_RIGHT     = $00000002
#FMOD_CHANNELMASK_FRONT_CENTER    = $00000004
#FMOD_CHANNELMASK_LOW_FREQUENCY   = $00000008
#FMOD_CHANNELMASK_SURROUND_LEFT   = $00000010
#FMOD_CHANNELMASK_SURROUND_RIGHT  = $00000020
#FMOD_CHANNELMASK_BACK_LEFT       = $00000040
#FMOD_CHANNELMASK_BACK_RIGHT      = $00000080
#FMOD_CHANNELMASK_BACK_CENTER     = $00000100
;--------------------------------------------------------------------------
#FMOD_CHANNELMASK_MONO            = (#FMOD_CHANNELMASK_FRONT_LEFT)
#FMOD_CHANNELMASK_STEREO          = (#FMOD_CHANNELMASK_FRONT_LEFT | #FMOD_CHANNELMASK_FRONT_RIGHT)
#FMOD_CHANNELMASK_LRC             = (#FMOD_CHANNELMASK_FRONT_LEFT | #FMOD_CHANNELMASK_FRONT_RIGHT | #FMOD_CHANNELMASK_FRONT_CENTER)
#FMOD_CHANNELMASK_QUAD            = (#FMOD_CHANNELMASK_FRONT_LEFT | #FMOD_CHANNELMASK_FRONT_RIGHT | #FMOD_CHANNELMASK_SURROUND_LEFT | #FMOD_CHANNELMASK_SURROUND_RIGHT)
#FMOD_CHANNELMASK_SURROUND        = (#FMOD_CHANNELMASK_FRONT_LEFT | #FMOD_CHANNELMASK_FRONT_RIGHT | #FMOD_CHANNELMASK_FRONT_CENTER  | #FMOD_CHANNELMASK_SURROUND_LEFT | #FMOD_CHANNELMASK_SURROUND_RIGHT)
#FMOD_CHANNELMASK_5POINT1         = (#FMOD_CHANNELMASK_FRONT_LEFT | #FMOD_CHANNELMASK_FRONT_RIGHT | #FMOD_CHANNELMASK_FRONT_CENTER  | #FMOD_CHANNELMASK_LOW_FREQUENCY | #FMOD_CHANNELMASK_SURROUND_LEFT | #FMOD_CHANNELMASK_SURROUND_RIGHT)
#FMOD_CHANNELMASK_5POINT1_REARS   = (#FMOD_CHANNELMASK_FRONT_LEFT | #FMOD_CHANNELMASK_FRONT_RIGHT | #FMOD_CHANNELMASK_FRONT_CENTER  | #FMOD_CHANNELMASK_LOW_FREQUENCY | #FMOD_CHANNELMASK_BACK_LEFT     | #FMOD_CHANNELMASK_BACK_RIGHT)
#FMOD_CHANNELMASK_7POINT0         = (#FMOD_CHANNELMASK_FRONT_LEFT | #FMOD_CHANNELMASK_FRONT_RIGHT | #FMOD_CHANNELMASK_FRONT_CENTER  | #FMOD_CHANNELMASK_SURROUND_LEFT | #FMOD_CHANNELMASK_SURROUND_RIGHT| #FMOD_CHANNELMASK_BACK_LEFT      | #FMOD_CHANNELMASK_BACK_RIGHT)
#FMOD_CHANNELMASK_7POINT1         = (#FMOD_CHANNELMASK_FRONT_LEFT | #FMOD_CHANNELMASK_FRONT_RIGHT | #FMOD_CHANNELMASK_FRONT_CENTER  | #FMOD_CHANNELMASK_LOW_FREQUENCY | #FMOD_CHANNELMASK_SURROUND_LEFT | #FMOD_CHANNELMASK_SURROUND_RIGHT | #FMOD_CHANNELMASK_BACK_LEFT | #FMOD_CHANNELMASK_BACK_RIGHT)
;--------------------------------------------------------------------------
Enumeration
  #FMOD_CHANNELORDER_DEFAULT      ; Left, Right, Center, LFE, Surround Left, Surround Right, Back Left, Back Right (see FMOD_SPEAKER enumeration)
  #FMOD_CHANNELORDER_WAVEFORMAT   ; Left, Right, Center, LFE, Back Left, Back Right, Surround Left, Surround Right (as per Microsoft .wav WAVEFORMAT structure master order)
  #FMOD_CHANNELORDER_PROTOOLS     ; Left, Center, Right, Surround Left, Surround Right, LFE
  #FMOD_CHANNELORDER_ALLMONO      ; Mono, Mono, Mono, Mono, Mono, Mono, ... (each channel all the way up to 32 channels are treated as if they were mono)
  #FMOD_CHANNELORDER_ALLSTEREO    ; Left, Right, Left, Right, Left, Right, ... (each pair of channels is treated as stereo all the way up to 32 channels)
  #FMOD_CHANNELORDER_ALSA         ; Left, Right, Surround Left, Surround Right, Center, LFE (as per Linux ALSA channel order)
  ;--------------------------------------------------------------------------
  #FMOD_CHANNELORDER_MAX          ; Maximum number of channel orderings supported.
EndEnumeration
;--------------------------------------------------------------------------
Enumeration
  #FMOD_PLUGINTYPE_OUTPUT         ; The plugin type is an output module.  FMOD mixed audio will play through one of these devices
  #FMOD_PLUGINTYPE_CODEC          ; The plugin type is a file format codec.  FMOD will use these codecs to load file formats for playback.
  #FMOD_PLUGINTYPE_DSP            ; The plugin type is a DSP unit.  FMOD will use these plugins as part of its DSP network to apply effects to output or generate sound in realtime.
  ;--------------------------------------------------------------------------
  #FMOD_PLUGINTYPE_MAX            ; Maximum number of plugin types supported.
EndEnumeration
;--------------------------------------------------------------------------
#FMOD_INIT_NORMAL                 = $00000000 ; Initialize normally
#FMOD_INIT_STREAM_FROM_UPDATE     = $00000001 ; No stream thread is created internally.  Streams are driven from System::update.  Mainly used with non-realtime outputs.
#FMOD_INIT_MIX_FROM_UPDATE        = $00000002 ; Win/PS3/Xbox 360 Only - FMOD Mixer thread is woken up to do a mix when System::update is called rather than waking periodically on its own timer.
#FMOD_INIT_3D_RIGHTHANDED         = $00000004 ; FMOD will treat +X as right, +Y as up and +Z as backwards (towards you).
#FMOD_INIT_CHANNEL_LOWPASS        = $00000100 ; All FMOD_3D based voices will add a software lowpass filter effect into the DSP chain which is automatically used when Channel::set3DOcclusion is used or the geometry API.   This also causes sounds to sound duller when the sound goes behind the listener, as a fake HRTF style effect.  Use System::setAdvancedSettings to disable or adjust cutoff frequency for this feature.
#FMOD_INIT_CHANNEL_DISTANCEFILTER = $00000200 ; All FMOD_3D based voices will add a software lowpass and highpass filter effect into the DSP chain which will act as a distance-automated bandpass filter. Use System::setAdvancedSettings to adjust the center frequency.
#FMOD_INIT_PROFILE_ENABLE         = $00010000 ; Enable TCP/IP based host which allows FMOD Designer or FMOD Profiler to connect to it, and view memory, CPU and the DSP network graph in real-time.
#FMOD_INIT_VOL0_BECOMES_VIRTUAL   = $00020000 ; Any sounds that are 0 volume will go virtual and not be processed except for having their positions updated virtually.  Use System::setAdvancedSettings to adjust what volume besides zero to switch to virtual at.
#FMOD_INIT_GEOMETRY_USECLOSEST    = $00040000 ; With the geometry engine, only process the closest polygon rather than accumulating all polygons the sound to listener line intersects.
#FMOD_INIT_PREFER_DOLBY_DOWNMIX   = $00080000 ; When using FMOD_SPEAKERMODE_5POINT1 with a stereo output device, use the Dolby Pro Logic II downmix algorithm instead of the SRS Circle Surround algorithm.
#FMOD_INIT_THREAD_UNSAFE          = $00100000 ; Disables thread safety for API calls. Only use this if FMOD low level is being called from a single thread, and if Studio API is not being used!
#FMOD_INIT_PROFILE_METER_ALL      = $00200000 ; Slower, but adds level metering for every single DSP unit in the graph.  Use DSP::setMeteringEnabled to turn meters off individually.
;--------------------------------------------------------------------------
Enumeration
  #FMOD_SOUND_TYPE_UNKNOWN          ; 3rd party / unknown plugin format.
  #FMOD_SOUND_TYPE_AIFF             ; AIFF.
  #FMOD_SOUND_TYPE_ASF              ; Microsoft Advanced Systems Format (ie WMA/ASF/WMV).
  #FMOD_SOUND_TYPE_AT3              ; Sony ATRAC 3 format
  #FMOD_SOUND_TYPE_DLS              ; Sound font / downloadable sound bank.
  #FMOD_SOUND_TYPE_FLAC             ; FLAC lossless codec.
  #FMOD_SOUND_TYPE_FSB              ; FMOD Sample Bank.
  #FMOD_SOUND_TYPE_GCADPCM          ; Nintendo GameCube/Wii ADPCM
  #FMOD_SOUND_TYPE_IT               ; Impulse Tracker.
  #FMOD_SOUND_TYPE_MIDI             ; MIDI. extracodecdata is a pointer to an #FMOD_MIDI_EXTRACODECDATA structure.
  #FMOD_SOUND_TYPE_MOD              ; Protracker / Fasttracker MOD.
  #FMOD_SOUND_TYPE_MPEG             ; MP2/MP3 MPEG.
  #FMOD_SOUND_TYPE_OGGVORBIS        ; Ogg vorbis.
  #FMOD_SOUND_TYPE_PLAYLIST         ; Information only from ASX/PLS/M3U/WAX playlists
  #FMOD_SOUND_TYPE_RAW              ; Raw PCM data.
  #FMOD_SOUND_TYPE_S3M              ; ScreamTracker 3.
  #FMOD_SOUND_TYPE_USER             ; User created sound.
  #FMOD_SOUND_TYPE_WAV              ; Microsoft WAV.
  #FMOD_SOUND_TYPE_XM               ; FastTracker 2 XM.
  #FMOD_SOUND_TYPE_XMA              ; Xbox360 XMA
  #FMOD_SOUND_TYPE_VAG              ; PlayStation Portable ADPCM VAG format.
  #FMOD_SOUND_TYPE_AUDIOQUEUE       ; iPhone hardware decoder, supports AAC, ALAC and MP3. extracodecdata is a pointer to an #FMOD_AUDIOQUEUE_EXTRACODECDATA structure.
  #FMOD_SOUND_TYPE_XWMA             ; Xbox360 XWMA
  #FMOD_SOUND_TYPE_BCWAV            ; 3DS BCWAV container format for DSP ADPCM and PCM
  #FMOD_SOUND_TYPE_AT9              ; PS4 / PSVita ATRAC 9 format
  #FMOD_SOUND_TYPE_VORBIS           ; Vorbis
  #FMOD_SOUND_TYPE_MEDIA_FOUNDATION ; Windows Store Application built in system codecs
  #FMOD_SOUND_TYPE_MEDIACODEC       ; Android MediaCodec
  ;--------------------------------------------------------------------------
  #FMOD_SOUND_TYPE_MAX              ; Maximum number of sound types supported.
EndEnumeration
;--------------------------------------------------------------------------
Enumeration
  #FMOD_SOUND_FORMAT_NONE          ; Unitialized / unknown.
  #FMOD_SOUND_FORMAT_PCM8          ; 8bit integer PCM data.
  #FMOD_SOUND_FORMAT_PCM16         ; 16bit integer PCM data.
  #FMOD_SOUND_FORMAT_PCM24         ; 24bit integer PCM data.
  #FMOD_SOUND_FORMAT_PCM32         ; 32bit integer PCM data.
  #FMOD_SOUND_FORMAT_PCMFLOAT      ; 32bit floating point PCM data.
  #FMOD_SOUND_FORMAT_GCADPCM       ; Compressed Nintendo 3DS/Wii DSP data.
  #FMOD_SOUND_FORMAT_IMAADPCM      ; Compressed IMA ADPCM data.
  #FMOD_SOUND_FORMAT_VAG           ; Compressed PlayStation Portable ADPCM data.
  #FMOD_SOUND_FORMAT_HEVAG         ; Compressed PSVita ADPCM data.
  #FMOD_SOUND_FORMAT_XMA           ; Compressed Xbox360 XMA data.
  #FMOD_SOUND_FORMAT_MPEG          ; Compressed MPEG layer 2 or 3 data.
  #FMOD_SOUND_FORMAT_CELT          ; Compressed CELT data.
  #FMOD_SOUND_FORMAT_AT9           ; Compressed PSVita ATRAC9 data.
  #FMOD_SOUND_FORMAT_XWMA          ; Compressed Xbox360 xWMA data.
  #FMOD_SOUND_FORMAT_VORBIS        ; Compressed Vorbis data.
  ;--------------------------------------------------------------------------
  #FMOD_SOUND_FORMAT_MAX           ; Maximum number of sound formats supported.
EndEnumeration
;--------------------------------------------------------------------------
#FMOD_DEFAULT                   = $00000000  ; Default for all modes listed below. FMOD_LOOP_OFF, FMOD_2D, FMOD_3D_WORLDRELATIVE, FMOD_3D_INVERSEROLLOFF
#FMOD_LOOP_OFF                  = $00000001  ; For non looping sounds. (DEFAULT).  Overrides FMOD_LOOP_NORMAL / FMOD_LOOP_BIDI.
#FMOD_LOOP_NORMAL               = $00000002  ; For forward looping sounds.
#FMOD_LOOP_BIDI                 = $00000004  ; For bidirectional looping sounds. (only works on software mixed static sounds).
#FMOD_2D                        = $00000008  ; Ignores any 3d processing. (DEFAULT).
#FMOD_3D                        = $00000010  ; Makes the sound positionable in 3D.  Overrides FMOD_2D.
#FMOD_CREATESTREAM              = $00000080  ; Decompress at runtime, streaming from the source provided (ie from disk).  Overrides FMOD_CREATESAMPLE and FMOD_CREATECOMPRESSEDSAMPLE.  Note a stream can only be played once at a time due to a stream only having 1 stream buffer and file handle.  Open multiple streams to have them play concurrently.
#FMOD_CREATESAMPLE              = $00000100  ; Decompress at loadtime, decompressing or decoding whole file into memory as the target sample format (ie PCM).  Fastest for playback and most flexible.
#FMOD_CREATECOMPRESSEDSAMPLE    = $00000200  ; Load MP2/MP3/IMAADPCM/CELT/Vorbis/AT9 or XMA into memory and leave it compressed.  CELT/Vorbis/AT9 encoding only supported in the FSB file format.  During playback the FMOD software mixer will decode it in realtime as a 'compressed sample'.  Overrides FMOD_CREATESAMPLE.  If the sound data is not one of the supported formats, it will behave as if it was created with FMOD_CREATESAMPLE and decode the sound into PCM.
#FMOD_OPENUSER                  = $00000400  ; Opens a user created static sample or stream. Use FMOD_CREATESOUNDEXINFO to specify format and/or read callbacks.  If a user created 'sample' is created with no read callback, the sample will be empty.  Use Sound::lock and Sound::unlock to place sound data into the sound if this is the case.
#FMOD_OPENMEMORY                = $00000800  ; "name_or_data" will be interpreted as a pointer to memory instead of filename for creating sounds.  Use FMOD_CREATESOUNDEXINFO to specify length.  If used with FMOD_CREATESAMPLE or FMOD_CREATECOMPRESSEDSAMPLE, FMOD duplicates the memory into its own buffers.  Your own buffer can be freed after open.  If used with FMOD_CREATESTREAM, FMOD will stream out of the buffer whose pointer you passed in.  In this case, your own buffer should not be freed until you have finished with and released the stream.
#FMOD_OPENMEMORY_POINT          = $10000000  ; "name_or_data" will be interpreted as a pointer to memory instead of filename for creating sounds.  Use FMOD_CREATESOUNDEXINFO to specify length.  This differs to FMOD_OPENMEMORY in that it uses the memory as is, without duplicating the memory into its own buffers.  Cannot be freed after open, only after Sound::release.   Will not work if the data is compressed and FMOD_CREATECOMPRESSEDSAMPLE is not used.
#FMOD_OPENRAW                   = $00001000  ; Will ignore file format and treat as raw pcm.  Use FMOD_CREATESOUNDEXINFO to specify format.  Requires at least defaultfrequency, numchannels and format to be specified before it will open.  Must be little endian data.
#FMOD_OPENONLY                  = $00002000  ; Just open the file, dont prebuffer or read.  Good for fast opens for info, or when sound::readData is to be used.
#FMOD_ACCURATETIME              = $00004000  ; For System::createSound - for accurate Sound::getLength/Channel::setPosition on VBR MP3, and MOD/S3M/XM/IT/MIDI files.  Scans file first, so takes longer to open. FMOD_OPENONLY does not affect this.
#FMOD_MPEGSEARCH                = $00008000  ; For corrupted / bad MP3 files.  This will search all the way through the file until it hits a valid MPEG header.  Normally only searches for 4k.
#FMOD_NONBLOCKING               = $00010000  ; For opening sounds and getting streamed subsounds (seeking) asyncronously.  Use Sound::getOpenState to poll the state of the sound as it opens or retrieves the subsound in the background.
#FMOD_UNIQUE                    = $00020000  ; Unique sound, can only be played one at a time
#FMOD_3D_HEADRELATIVE           = $00040000  ; Make the sound's position, velocity and orientation relative to the listener.
#FMOD_3D_WORLDRELATIVE          = $00080000  ; Make the sound's position, velocity and orientation absolute (relative to the world). (DEFAULT)
#FMOD_3D_INVERSEROLLOFF         = $00100000  ; This sound will follow the inverse rolloff model where mindistance = full volume, maxdistance = where sound stops attenuating, and rolloff is fixed according to the global rolloff factor.  (DEFAULT)
#FMOD_3D_LINEARROLLOFF          = $00200000  ; This sound will follow a linear rolloff model where mindistance = full volume, maxdistance = silence.
#FMOD_3D_LINEARSQUAREROLLOFF    = $00400000  ; This sound will follow a linear-square rolloff model where mindistance = full volume, maxdistance = silence.
#FMOD_3D_INVERSETAPEREDROLLOFF  = $00800000  ; This sound will follow the inverse rolloff model at distances close to mindistance and a linear-square rolloff close to maxdistance.
#FMOD_3D_CUSTOMROLLOFF          = $04000000  ; This sound will follow a rolloff model defined by Sound::set3DCustomRolloff / Channel::set3DCustomRolloff.
#FMOD_3D_IGNOREGEOMETRY         = $40000000  ; Is not affect by geometry occlusion.  If not specified in Sound::setMode, or Channel::setMode, the flag is cleared and it is affected by geometry again.
; Unused                        = $01000000    Used to be FMOD_UNICODE
#FMOD_IGNORETAGS                = $02000000  ; Skips id3v2/asf/etc tag checks when opening a sound, to reduce seek/read overhead when opening files (helps with CD performance).
#FMOD_LOWMEM                    = $08000000  ; Removes some features from samples to give a lower memory overhead, like Sound::getName.  See remarks.
#FMOD_LOADSECONDARYRAM          = $20000000  ; Load sound into the secondary RAM of supported platform. On PS3, sounds will be loaded into RSX/VRAM.
#FMOD_VIRTUAL_PLAYFROMSTART     = $80000000  ; For sounds that start virtual (due to being quiet or low importance), instead of swapping back to audible, and playing at the correct offset according to time, this flag makes the sound play from the start.
;--------------------------------------------------------------------------
Enumeration
  #FMOD_OPENSTATE_READY        ; Opened and ready to play.
  #FMOD_OPENSTATE_LOADING      ; Initial load in progress.
  #FMOD_OPENSTATE_ERROR        ; Failed to open - file not found, out of memory etc.  See return value of Sound::getOpenState for what happened.
  #FMOD_OPENSTATE_CONNECTING   ; Connecting to remote host (internet sounds only).
  #FMOD_OPENSTATE_BUFFERING    ; Buffering data.
  #FMOD_OPENSTATE_SEEKING      ; Seeking to subsound and re-flushing stream buffer.
  #FMOD_OPENSTATE_PLAYING      ; Ready and playing, but not possible to release at this time without stalling the main thread.
  #FMOD_OPENSTATE_SETPOSITION  ; Seeking within a stream to a different position.
  ;--------------------------------------------------------------------------
  #FMOD_OPENSTATE_MAX          ; Maximum number of open state types.
EndEnumeration
;--------------------------------------------------------------------------
Enumeration
  #FMOD_SOUNDGROUP_BEHAVIOR_FAIL           ; Any sound played that puts the sound count over the SoundGroup::setMaxAudible setting, will simply fail during System::playSound.
  #FMOD_SOUNDGROUP_BEHAVIOR_MUTE           ; Any sound played that puts the sound count over the SoundGroup::setMaxAudible setting, will be silent, then if another sound in the group stops the sound that was silent before becomes audible again.
  #FMOD_SOUNDGROUP_BEHAVIOR_STEALLOWEST    ; Any sound played that puts the sound count over the SoundGroup::setMaxAudible setting, will steal the quietest / least important sound playing in the group.
  ;--------------------------------------------------------------------------
  #FMOD_SOUNDGROUP_BEHAVIOR_MAX            ; Maximum number of sound group behaviors.
EndEnumeration
;--------------------------------------------------------------------------
Enumeration
  #FMOD_CHANNELCONTROL_CALLBACK_END               ; Called when a sound ends.
  #FMOD_CHANNELCONTROL_CALLBACK_VIRTUALVOICE      ; Called when a voice is swapped out or swapped in.
  #FMOD_CHANNELCONTROL_CALLBACK_SYNCPOINT         ; Called when a syncpoint is encountered.  Can be from wav file markers.
  #FMOD_CHANNELCONTROL_CALLBACK_OCCLUSION         ; Called when the channel has its geometry occlusion value calculated.  Can be used to clamp or change the value.
  ;--------------------------------------------------------------------------
  #FMOD_CHANNELCONTROL_CALLBACK_MAX               ; Maximum number of callback types supported.
EndEnumeration
;--------------------------------------------------------------------------
#FMOD_CHANNELCONTROL_DSP_HEAD   = -1 ; Head of the DSP chain.  Equivalent of index 0.
#FMOD_CHANNELCONTROL_DSP_FADER  = -2 ; Built in fader DSP.
#FMOD_CHANNELCONTROL_DSP_PANNER = -3 ; Built in panner DSP.
#FMOD_CHANNELCONTROL_DSP_TAIL   = -4 ; Tail of the DSP chain.  Equivalent of the number of dsps minus 1.
;--------------------------------------------------------------------------
Enumeration
  #FMOD_ERRORCALLBACK_INSTANCETYPE_NONE
  #FMOD_ERRORCALLBACK_INSTANCETYPE_SYSTEM
  #FMOD_ERRORCALLBACK_INSTANCETYPE_CHANNEL
  #FMOD_ERRORCALLBACK_INSTANCETYPE_CHANNELGROUP
  #FMOD_ERRORCALLBACK_INSTANCETYPE_CHANNELCONTROL
  #FMOD_ERRORCALLBACK_INSTANCETYPE_SOUND
  #FMOD_ERRORCALLBACK_INSTANCETYPE_SOUNDGROUP
  #FMOD_ERRORCALLBACK_INSTANCETYPE_DSP
  #FMOD_ERRORCALLBACK_INSTANCETYPE_DSPCONNECTION
  #FMOD_ERRORCALLBACK_INSTANCETYPE_GEOMETRY
  #FMOD_ERRORCALLBACK_INSTANCETYPE_REVERB3D
  #FMOD_ERRORCALLBACK_INSTANCETYPE_STUDIO_SYSTEM
  #FMOD_ERRORCALLBACK_INSTANCETYPE_STUDIO_EVENTDESCRIPTION
  #FMOD_ERRORCALLBACK_INSTANCETYPE_STUDIO_EVENTINSTANCE
  #FMOD_ERRORCALLBACK_INSTANCETYPE_STUDIO_PARAMETERINSTANCE
  #FMOD_ERRORCALLBACK_INSTANCETYPE_STUDIO_CUEINSTANCE
  #FMOD_ERRORCALLBACK_INSTANCETYPE_STUDIO_BUS
  #FMOD_ERRORCALLBACK_INSTANCETYPE_STUDIO_VCA
  #FMOD_ERRORCALLBACK_INSTANCETYPE_STUDIO_BANK
EndEnumeration
;--------------------------------------------------------------------------
Structure FMOD_ERRORCALLBACK_INFO
  result.l        ; Error code result.
  instancetype.l  ; Type of instance the error occurred on.
  *instance       ; Instance pointer.
  *functionname   ; Function that the error occurred on.
  *functionparams ; Function parameters that the error ocurred on.
EndStructure
;--------------------------------------------------------------------------
#FMOD_SYSTEM_CALLBACK_DEVICELISTCHANGED      = $00000001  ; Called from System::update when the enumerated list of devices has changed.
#FMOD_SYSTEM_CALLBACK_DEVICELOST             = $00000002  ; Called from System::update when an output device has been lost due to control panel parameter changes and FMOD cannot automatically recover.
#FMOD_SYSTEM_CALLBACK_MEMORYALLOCATIONFAILED = $00000004  ; Called directly when a memory allocation fails somewhere in FMOD.  (NOTE - 'system' will be NULL in this callback type.)
#FMOD_SYSTEM_CALLBACK_THREADCREATED          = $00000008  ; Called directly when a thread is created.
#FMOD_SYSTEM_CALLBACK_BADDSPCONNECTION       = $00000010  ; Called when a bad connection was made with DSP::addInput. Usually called from mixer thread because that is where the connections are made.
#FMOD_SYSTEM_CALLBACK_PREMIX                 = $00000020  ; Called each tick before a mix update happens.
#FMOD_SYSTEM_CALLBACK_POSTMIX                = $00000040  ; Called each tick after a mix update happens.
#FMOD_SYSTEM_CALLBACK_ERROR                  = $00000080  ; Called when each API function returns an error code, including delayed async functions.
#FMOD_SYSTEM_CALLBACK_MIDMIX                 = $00000100  ; Called each tick in mix update after clocks have been updated before the main mix occurs.
#FMOD_SYSTEM_CALLBACK_THREADDESTROYED        = $00000200  ; Called directly when a thread is destroyed.
#FMOD_SYSTEM_CALLBACK_PREUPDATE              = $00000400  ; Called at start of System::update function.
#FMOD_SYSTEM_CALLBACK_POSTUPDATE             = $00000800  ; Called at end of System::update function.
;--------------------------------------------------------------------------
Prototype.l FMOD_DEBUG_CALLBACK           (flags.l, file.p-ascii, line.l, func.p-ascii, message.p-ascii)
;--------------------------------------------------------------------------
Prototype.l FMOD_SYSTEM_CALLBACK          (*system, type.l, *commanddata1, *commanddata2, *userdata)
;--------------------------------------------------------------------------
Prototype.l FMOD_CHANNELCONTROL_CALLBACK  (*channelcontrol, controltype.l, callbacktype.l, *commanddata1, *commanddata2)
;--------------------------------------------------------------------------
Prototype.l FMOD_SOUND_NONBLOCK_CALLBACK  (*sound, result.l)
Prototype.l FMOD_SOUND_PCMREAD_CALLBACK   (*sound, *data, datalen.l)
Prototype.l FMOD_SOUND_PCMSETPOS_CALLBACK (*sound, subsound.l, position.l, postype.l)
;--------------------------------------------------------------------------
Prototype.l FMOD_FILE_OPEN_CALLBACK       (name.p-ascii, *filesize, *purebasic_warning_doublepointer_handle, *userdata)
Prototype.l FMOD_FILE_CLOSE_CALLBACK      (*handle, *userdata)
Prototype.l FMOD_FILE_READ_CALLBACK       (*handle, *buffer, sizebytes.l, *bytesread, *userdata)
Prototype.l FMOD_FILE_SEEK_CALLBACK       (*handle, pos.l, *userdata)
Prototype.l FMOD_FILE_ASYNCREAD_CALLBACK  (*info.FMOD_ASYNCREADINFO, *userdata)
Prototype.l FMOD_FILE_ASYNCCANCEL_CALLBACK(*info.FMOD_ASYNCREADINFO, *userdata)
;--------------------------------------------------------------------------
Prototype.i FMOD_MEMORY_ALLOC_CALLBACK    (size.l, type.l, sourcestr.p-ascii)
Prototype.i FMOD_MEMORY_REALLOC_CALLBACK  (*ptr, size.l, type.l, sourcestr.p-ascii)
Prototype   FMOD_MEMORY_FREE_CALLBACK     (*ptr, type.l, sourcestr.p-ascii)
;--------------------------------------------------------------------------
Prototype.f FMOD_3D_ROLLOFF_CALLBACK      (*channelcontrol, distance.f)
;--------------------------------------------------------------------------
Enumeration
  #FMOD_DSP_RESAMPLER_DEFAULT      ; Default interpolation method.  Currently equal to #FMOD_DSP_RESAMPLER_LINEAR.
  #FMOD_DSP_RESAMPLER_NOINTERP     ; No interpolation.  High frequency aliasing hiss will be audible depending on the sample rate of the sound.
  #FMOD_DSP_RESAMPLER_LINEAR       ; Linear interpolation (default method).  Fast and good quality, causes very slight lowpass effect on low frequency sounds.
  #FMOD_DSP_RESAMPLER_CUBIC        ; Cubic interpolation.  Slower than linear interpolation but better quality.
  #FMOD_DSP_RESAMPLER_SPLINE       ; 5 point spline interpolation.  Slowest resampling method but best quality.
  ;--------------------------------------------------------------------------
  #FMOD_DSP_RESAMPLER_MAX          ; Maximum number of resample methods supported.
EndEnumeration
;--------------------------------------------------------------------------
Enumeration
  #FMOD_DSPCONNECTION_TYPE_STANDARD       ; Default connection type.         Audio is mixed from the input to the output DSP's audible buffer.
  #FMOD_DSPCONNECTION_TYPE_SIDECHAIN      ; Sidechain connection type.       Audio is mixed from the input to the output DSP's sidechain buffer.
  #FMOD_DSPCONNECTION_TYPE_SEND           ; Send connection type.            Audio is mixed from the input to the output DSP's audible buffer, but the input is NOT executed, only copied from.  A standard connection or sidechain needs to make an input execute to generate data.
  #FMOD_DSPCONNECTION_TYPE_SEND_SIDECHAIN ; Send sidechain connection type.  Audio is mixed from the input to the output DSP's sidechain buffer, but the input is NOT executed, only copied from.  A standard connection or sidechain needs to make an input execute to generate data.
  ;--------------------------------------------------------------------------
  #FMOD_DSPCONNECTION_TYPE_MAX            ; Maximum number of DSP connection types supported.
EndEnumeration
;--------------------------------------------------------------------------
Enumeration
  #FMOD_TAGTYPE_UNKNOWN
  #FMOD_TAGTYPE_ID3V1
  #FMOD_TAGTYPE_ID3V2
  #FMOD_TAGTYPE_VORBISCOMMENT
  #FMOD_TAGTYPE_SHOUTCAST
  #FMOD_TAGTYPE_ICECAST
  #FMOD_TAGTYPE_ASF
  #FMOD_TAGTYPE_MIDI
  #FMOD_TAGTYPE_PLAYLIST
  #FMOD_TAGTYPE_FMOD
  #FMOD_TAGTYPE_USER
  ;--------------------------------------------------------------------------
  #FMOD_TAGTYPE_MAX            ; Maximum number of tag types supported.
EndEnumeration
;--------------------------------------------------------------------------
Enumeration
  #FMOD_TAGDATATYPE_BINARY
  #FMOD_TAGDATATYPE_INT
  #FMOD_TAGDATATYPE_FLOAT
  #FMOD_TAGDATATYPE_STRING
  #FMOD_TAGDATATYPE_STRING_UTF16
  #FMOD_TAGDATATYPE_STRING_UTF16BE
  #FMOD_TAGDATATYPE_STRING_UTF8
  #FMOD_TAGDATATYPE_CDTOC
  ;--------------------------------------------------------------------------
  #FMOD_TAGDATATYPE_MAX            ; Maximum number of tag datatypes supported.
EndEnumeration
;--------------------------------------------------------------------------
Structure FMOD_TAG
  type.l      ; [r] The type of this tag.
  datatype.l  ; [r] The type of data that this tag contains
  *name       ; [r] The name of this tag i.e. "TITLE", "ARTIST" etc.
  *data       ; [r] Pointer to the tag data - its format is determined by the datatype member
  datalen.l   ; [r] Length of the data contained in this tag
  updated.l   ; [r] True if this tag has been updated since last being accessed with Sound::getTag
EndStructure
;--------------------------------------------------------------------------
#FMOD_TIMEUNIT_MS                = $00000001  ; Milliseconds.
#FMOD_TIMEUNIT_PCM               = $00000002  ; PCM samples, related to milliseconds * samplerate / 1000.
#FMOD_TIMEUNIT_PCMBYTES          = $00000004  ; Bytes, related to PCM samples * channels * datawidth (ie 16bit = 2 bytes).
#FMOD_TIMEUNIT_RAWBYTES          = $00000008  ; Raw file bytes of (compressed) sound data (does not include headers).  Only used by Sound::getLength and Channel::getPosition.
#FMOD_TIMEUNIT_PCMFRACTION       = $00000010  ; Fractions of 1 PCM sample.  Unsigned int range 0 to 0xFFFFFFFF.  Used for sub-sample granularity for DSP purposes.
#FMOD_TIMEUNIT_MODORDER          = $00000100  ; MOD/S3M/XM/IT.  Order in a sequenced module format.  Use Sound::getFormat to determine the PCM format being decoded to.
#FMOD_TIMEUNIT_MODROW            = $00000200  ; MOD/S3M/XM/IT.  Current row in a sequenced module format.  Sound::getLength will return the number of rows in the currently playing or seeked to pattern.
#FMOD_TIMEUNIT_MODPATTERN        = $00000400  ; MOD/S3M/XM/IT.  Current pattern in a sequenced module format.  Sound::getLength will return the number of patterns in the song and Channel::getPosition will return the currently playing pattern.
#FMOD_TIMEUNIT_BUFFERED          = $10000000  ; Time value as seen by buffered stream.  This is always ahead of audible time, and is only used for processing.
;--------------------------------------------------------------------------
#FMOD_PORT_INDEX_NONE            = -1         ; Use when a port index is not required
;--------------------------------------------------------------------------
Structure FMOD_CREATESOUNDEXINFO
  cbsize.l                                            ; [w] Size of this structure.  This is used so the structure can be expanded in the future and still work on older versions of FMOD Studio.
  length.l                                            ; [w] Optional. Specify 0 to ignore. Number of bytes to load starting at 'fileoffset', or size of sound to create (if FMOD_OPENUSER is used).  Required if loading from memory.  If 0 is specified, then it will use the size of the file (unless loading from memory then an error will be returned).
  fileoffset.l                                        ; [w] Optional. Specify 0 to ignore. Offset from start of the file to start loading from.  This is useful for loading files from inside big data files.
  numchannels.l                                       ; [w] Optional. Specify 0 to ignore. Number of channels in a sound mandatory if FMOD_OPENUSER or FMOD_OPENRAW is used.
  defaultfrequency.l                                  ; [w] Optional. Specify 0 to ignore. Default frequency of sound in Hz, mandatory if FMOD_OPENUSER or FMOD_OPENRAW is used.  Other formats use the frequency determined by the file format.
  format.l                                            ; [w] Optional. Specify 0 or FMOD_SOUND_FORMAT_NONE to ignore. Format of the sound, mandatory if FMOD_OPENUSER or FMOD_OPENRAW is used.  Other formats use the format determined by the file format.
  decodebuffersize.l                                  ; [w] Optional. Specify 0 to ignore. For streams.  This determines the size of the double buffer (in PCM samples) that a stream uses.  Use this for user created streams if you want to determine the size of the callback buffer passed to you.  Specify 0 to use FMOD's default size which is currently equivalent to 400ms of the sound format created/loaded.
  initialsubsound.l                                   ; [w] Optional. Specify 0 to ignore. In a multi-sample file format such as .FSB/.DLS, specify the initial subsound to seek to, only if FMOD_CREATESTREAM is used.
  numsubsounds.l                                      ; [w] Optional. Specify 0 to ignore or have no subsounds.  In a sound created with FMOD_OPENUSER, specify the number of subsounds that are accessable with Sound::getSubSound.  If not created with FMOD_OPENUSER, this will limit the number of subsounds loaded within a multi-subsound file.  If using FSB, then if FMOD_CREATESOUNDEXINFO::inclusionlist is used, this will shuffle subsounds down so that there are not any gaps.  It will mean that the indices of the sounds will be different.
  *inclusionlist                                      ; [w] Optional. Specify 0 to ignore. In a multi-sample format such as .FSB/.DLS it may be desirable to specify only a subset of sounds to be loaded out of the whole file.  This is an array of subsound indices to load into memory when created.
  inclusionlistnum.l                                  ; [w] Optional. Specify 0 to ignore. This is the number of integers contained within the inclusionlist array.
  pcmreadcallback.FMOD_SOUND_PCMREAD_CALLBACK         ; [w] Optional. Specify 0 to ignore. Callback to 'piggyback' on FMOD's read functions and accept or even write PCM data while FMOD is opening the sound.  Used for user sounds created with FMOD_OPENUSER or for capturing decoded data as FMOD reads it.
  pcmsetposcallback.FMOD_SOUND_PCMSETPOS_CALLBACK     ; [w] Optional. Specify 0 to ignore. Callback for when the user calls a seeking function such as Channel::setTime or Channel::setPosition within a multi-sample sound, and for when it is opened.
  nonblockcallback.FMOD_SOUND_NONBLOCK_CALLBACK       ; [w] Optional. Specify 0 to ignore. Callback for successful completion, or error while loading a sound that used the FMOD_NONBLOCKING flag.  Also called duing seeking, when setPosition is called or a stream is restarted.
  *dlsname                                            ; [w] Optional. Specify 0 to ignore. Filename for a DLS sample set when loading a MIDI file. If not specified, on Windows it will attempt to open /windows/system32/drivers/gm.dls or /windows/system32/drivers/etc/gm.dls, on Mac it will attempt to load /System/Library/Components/CoreAudio.component/Contents/Resources/gs_instruments.dls, otherwise the MIDI will fail to open. Current DLS support is for level 1 of the specification.
  *encryptionkey                                      ; [w] Optional. Specify 0 to ignore. Key for encrypted FSB file.  Without this key an encrypted FSB file will not load.
  maxpolyphony.l                                      ; [w] Optional. Specify 0 to ignore. For sequenced formats with dynamic channel allocation such as .MID and .IT, this specifies the maximum voice count allowed while playing.  .IT defaults to 64.  .MID defaults to 32.
  *userdata                                           ; [w] Optional. Specify 0 to ignore. This is user data to be attached to the sound during creation.  Access via Sound::getUserData.  Note: This is not passed to FMOD_FILE_OPEN_CALLBACK - use fileuserdata for that.
  suggestedsoundtype.l                                ; [w] Optional. Specify 0 or FMOD_SOUND_TYPE_UNKNOWN to ignore.  Instead of scanning all codec types, use this to speed up loading by making it jump straight to this codec.
  fileuseropen.FMOD_FILE_OPEN_CALLBACK                ; [w] Optional. Specify 0 to ignore. Callback for opening this file.
  fileuserclose.FMOD_FILE_CLOSE_CALLBACK              ; [w] Optional. Specify 0 to ignore. Callback for closing this file.
  fileuserread.FMOD_FILE_READ_CALLBACK                ; [w] Optional. Specify 0 to ignore. Callback for reading from this file.
  fileuserseek.FMOD_FILE_SEEK_CALLBACK                ; [w] Optional. Specify 0 to ignore. Callback for seeking within this file.
  fileuserasyncread.FMOD_FILE_ASYNCREAD_CALLBACK      ; [w] Optional. Specify 0 to ignore. Callback for seeking within this file.
  fileuserasynccancel.FMOD_FILE_ASYNCCANCEL_CALLBACK  ; [w] Optional. Specify 0 to ignore. Callback for seeking within this file.
  *fileuserdata                                       ; [w] Optional. Specify 0 to ignore. User data to be passed into the file callbacks.
  channelorder.l                                      ; [w] Optional. Specify 0 to ignore. Use this to differ the way fmod maps multichannel sounds to speakers.  See FMOD_CHANNELORDER for more.
  channelmask.l                                       ; [w] Optional. Specify 0 to ignore. Use this to specify which channels map to which speakers.  See FMOD_CHANNELMASK for more.
  *initialsoundgroup.FMOD_SOUNDGROUP                  ; [w] Optional. Specify 0 to ignore. Specify a sound group if required, to put sound in as it is created.
  initialseekposition.l                               ; [w] Optional. Specify 0 to ignore. For streams. Specify an initial position to seek the stream to.
  initialseekpostype.l                                ; [w] Optional. Specify 0 to ignore. For streams. Specify the time unit for the position set in initialseekposition.
  ignoresetfilesystem.l                               ; [w] Optional. Specify 0 to ignore. Set to 1 to use fmod's built in file system. Ignores setFileSystem callbacks and also FMOD_CREATESOUNEXINFO file callbacks.  Useful for specific cases where you don't want to use your own file system but want to use fmod's file system (ie net streaming).
  audioqueuepolicy.l                                  ; [w] Optional. Specify 0 or FMOD_AUDIOQUEUE_CODECPOLICY_DEFAULT to ignore. Policy used to determine whether hardware or software is used for decoding, see FMOD_AUDIOQUEUE_CODECPOLICY for options (iOS >= 3.0 required, otherwise only hardware is available)
  minmidigranularity.l                                ; [w] Optional. Specify 0 to ignore. Allows you to set a minimum desired MIDI mixer granularity. Values smaller than 512 give greater than default accuracy at the cost of more CPU and vice versa. Specify 0 for default (512 samples).
  nonblockthreadid.l                                  ; [w] Optional. Specify 0 to ignore. Specifies a thread index to execute non blocking load on.  Allows for up to 5 threads to be used for loading at once.  This is to avoid one load blocking another.  Maximum value = 4.
EndStructure
;--------------------------------------------------------------------------
Structure FMOD_REVERB_PROPERTIES
  DecayTime.f         ; [r/w] 0.0    20000.0 1500.0  Reverberation decay time in ms
  EarlyDelay.f        ; [r/w] 0.0    300.0   7.0     Initial reflection delay time
  LateDelay.f         ; [r/w] 0.0    100     11.0    Late reverberation delay time relative to initial reflection
  HFReference.f       ; [r/w] 20.0   20000.0 5000    Reference high frequency (hz)
  HFDecayRatio.f      ; [r/w] 10.0   100.0   50.0    High-frequency to mid-frequency decay time ratio
  Diffusion.f         ; [r/w] 0.0    100.0   100.0   Value that controls the echo density in the late reverberation decay.
  Density.f           ; [r/w] 0.0    100.0   100.0   Value that controls the modal density in the late reverberation decay
  LowShelfFrequency.f ; [r/w] 20.0   1000.0  250.0   Reference low frequency (hz)
  LowShelfGain.f      ; [r/w] -36.0  12.0    0.0     Relative room effect level at low frequencies
  HighCut.f           ; [r/w] 20.0   20000.0 20000.0 Relative room effect level at high frequencies
  EarlyLateMix.f      ; [r/w] 0.0    100.0   50.0    Early reflections level relative to room effect
  WetLevel.f          ; [r/w] -80.0  20.0    -6.0    Room effect level (at mid frequencies)
EndStructure
;--------------------------------------------------------------------------
; #define FMOD_PRESET_OFF              {  1000,    7,  11, 5000, 100, 100, 100, 250, 0,    20,  96, -80.0f }
Global FMOD_PRESET_OFF.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_OFF
  \DecayTime = 1000
  \EarlyDelay = 7
  \LateDelay = 11
  \HFReference = 5000
  \HFDecayRatio = 100
  \Diffusion = 100
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 20
  \EarlyLateMix = 96
  \WetLevel = -80.0
EndWith
; #define FMOD_PRESET_GENERIC          {  1500,    7,  11, 5000,  83, 100, 100, 250, 0, 14500,  96,  -8.0f }
Global FMOD_PRESET_GENERIC.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_GENERIC
  \DecayTime = 1500
  \EarlyDelay = 7
  \LateDelay = 11
  \HFReference = 5000
  \HFDecayRatio = 83
  \Diffusion = 100
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 14500
  \EarlyLateMix = 96
  \WetLevel = -8.0
EndWith
; #define FMOD_PRESET_PADDEDCELL       {   170,    1,   2, 5000,  10, 100, 100, 250, 0,   160,  84,  -7.8f }
Global FMOD_PRESET_PADDEDCELL.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_PADDEDCELL
  \DecayTime = 170
  \EarlyDelay = 1
  \LateDelay = 2
  \HFReference = 5000
  \HFDecayRatio = 10
  \Diffusion = 100
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 160
  \EarlyLateMix = 84
  \WetLevel = -7.8
EndWith
; #define FMOD_PRESET_ROOM             {   400,    2,   3, 5000,  83, 100, 100, 250, 0,  6050,  88,  -9.4f }
Global FMOD_PRESET_ROOM.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_ROOM
  \DecayTime = 400
  \EarlyDelay = 2
  \LateDelay = 3
  \HFReference = 5000
  \HFDecayRatio = 83
  \Diffusion = 100
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 6050
  \EarlyLateMix = 88
  \WetLevel = -9.4
EndWith
; #define FMOD_PRESET_BATHROOM         {  1500,    7,  11, 5000,  54, 100,  60, 250, 0,  2900,  83,   0.5f }
Global FMOD_PRESET_BATHROOM.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_BATHROOM
  \DecayTime = 1500
  \EarlyDelay = 7
  \LateDelay = 11
  \HFReference = 5000
  \HFDecayRatio = 54
  \Diffusion = 100
  \Density = 60
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 2900
  \EarlyLateMix = 83
  \WetLevel = 0.5
EndWith
; #define FMOD_PRESET_LIVINGROOM       {   500,    3,   4, 5000,  10, 100, 100, 250, 0,   160,  58, -19.0f }
Global FMOD_PRESET_LIVINGROOM.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_LIVINGROOM
  \DecayTime = 500
  \EarlyDelay = 3
  \LateDelay = 4
  \HFReference = 5000
  \HFDecayRatio = 10
  \Diffusion = 100
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 160
  \EarlyLateMix = 58
  \WetLevel = -19.0
EndWith
; #define FMOD_PRESET_STONEROOM        {  2300,   12,  17, 5000,  64, 100, 100, 250, 0,  7800,  71,  -8.5f }
Global FMOD_PRESET_STONEROOM.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_STONEROOM
  \DecayTime = 2300
  \EarlyDelay = 12
  \LateDelay = 17
  \HFReference = 5000
  \HFDecayRatio = 64
  \Diffusion = 100
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 7800
  \EarlyLateMix = 71
  \WetLevel = -8.5
EndWith
; #define FMOD_PRESET_AUDITORIUM       {  4300,   20,  30, 5000,  59, 100, 100, 250, 0,  5850,  64, -11.7f }
Global FMOD_PRESET_AUDITORIUM.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_AUDITORIUM
  \DecayTime = 4300
  \EarlyDelay = 20
  \LateDelay = 30
  \HFReference = 5000
  \HFDecayRatio = 59
  \Diffusion = 100
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 5850
  \EarlyLateMix = 64
  \WetLevel = -11.7
EndWith
; #define FMOD_PRESET_CONCERTHALL      {  3900,   20,  29, 5000,  70, 100, 100, 250, 0,  5650,  80,  -9.8f }
Global FMOD_PRESET_CONCERTHALL.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_CONCERTHALL
  \DecayTime = 3900
  \EarlyDelay = 20
  \LateDelay = 29
  \HFReference = 5000
  \HFDecayRatio = 70
  \Diffusion = 100
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 5650
  \EarlyLateMix = 80
  \WetLevel = -9.8
EndWith
; #define FMOD_PRESET_CAVE             {  2900,   15,  22, 5000, 100, 100, 100, 250, 0, 20000,  59, -11.3f }
Global FMOD_PRESET_CAVE.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_CAVE
  \DecayTime = 2900
  \EarlyDelay = 15
  \LateDelay = 22
  \HFReference = 5000
  \HFDecayRatio = 100
  \Diffusion = 100
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 20000
  \EarlyLateMix = 59
  \WetLevel = -11.3
EndWith
; #define FMOD_PRESET_ARENA            {  7200,   20,  30, 5000,  33, 100, 100, 250, 0,  4500,  80,  -9.6f }
Global FMOD_PRESET_ARENA.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_ARENA
  \DecayTime = 7200
  \EarlyDelay = 20
  \LateDelay = 30
  \HFReference = 5000
  \HFDecayRatio = 33
  \Diffusion = 100
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 4500
  \EarlyLateMix = 80
  \WetLevel = -9.6
EndWith
; #define FMOD_PRESET_HANGAR           { 10000,   20,  30, 5000,  23, 100, 100, 250, 0,  3400,  72,  -7.4f }
Global FMOD_PRESET_HANGAR.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_HANGAR
  \DecayTime = 10000
  \EarlyDelay = 20
  \LateDelay = 30
  \HFReference = 5000
  \HFDecayRatio = 23
  \Diffusion = 100
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 3400
  \EarlyLateMix = 72
  \WetLevel = -7.4
EndWith
; #define FMOD_PRESET_CARPETTEDHALLWAY {   300,    2,  30, 5000,  10, 100, 100, 250, 0,   500,  56, -24.0f }
Global FMOD_PRESET_CARPETTEDHALLWAY.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_CARPETTEDHALLWAY
  \DecayTime = 300
  \EarlyDelay = 2
  \LateDelay = 30
  \HFReference = 5000
  \HFDecayRatio = 10
  \Diffusion = 100
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 500
  \EarlyLateMix = 56
  \WetLevel = -24.0
EndWith
; #define FMOD_PRESET_HALLWAY          {  1500,    7,  11, 5000,  59, 100, 100, 250, 0,  7800,  87,  -5.5f }
Global FMOD_PRESET_HALLWAY.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_HALLWAY
  \DecayTime = 1500
  \EarlyDelay = 7
  \LateDelay = 11
  \HFReference = 5000
  \HFDecayRatio = 59
  \Diffusion = 100
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 7800
  \EarlyLateMix = 87
  \WetLevel = -5.5
EndWith
; #define FMOD_PRESET_STONECORRIDOR    {   270,   13,  20, 5000,  79, 100, 100, 250, 0,  9000,  86,  -6.0f }
Global FMOD_PRESET_STONECORRIDOR.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_STONECORRIDOR
  \DecayTime = 270
  \EarlyDelay = 13
  \LateDelay = 20
  \HFReference = 5000
  \HFDecayRatio = 79
  \Diffusion = 100
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 9000
  \EarlyLateMix = 86
  \WetLevel = -6.0
EndWith
; #define FMOD_PRESET_ALLEY            {  1500,    7,  11, 5000,  86, 100, 100, 250, 0,  8300,  80,  -9.8f }
Global FMOD_PRESET_ALLEY.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_ALLEY
  \DecayTime = 1500
  \EarlyDelay = 7
  \LateDelay = 11
  \HFReference = 5000
  \HFDecayRatio = 86
  \Diffusion = 100
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 8300
  \EarlyLateMix = 80
  \WetLevel = -9.8
EndWith
; #define FMOD_PRESET_FOREST           {  1500,  162,  88, 5000,  54,  79, 100, 250, 0,   760,  94, -12.3f }
Global FMOD_PRESET_FOREST.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_FOREST
  \DecayTime = 1500
  \EarlyDelay = 162
  \LateDelay = 88
  \HFReference = 5000
  \HFDecayRatio = 54
  \Diffusion = 79
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 760
  \EarlyLateMix = 94
  \WetLevel = -12.3
EndWith
; #define FMOD_PRESET_CITY             {  1500,    7,  11, 5000,  67,  50, 100, 250, 0,  4050,  66, -26.0f }
Global FMOD_PRESET_CITY.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_CITY
  \DecayTime = 1500
  \EarlyDelay = 7
  \LateDelay = 11
  \HFReference = 5000
  \HFDecayRatio = 67
  \Diffusion = 50
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 4050
  \EarlyLateMix = 66
  \WetLevel = -26.0
EndWith
; #define FMOD_PRESET_MOUNTAINS        {  1500,  300, 100, 5000,  21,  27, 100, 250, 0,  1220,  82, -24.0f }
Global FMOD_PRESET_MOUNTAINS.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_MOUNTAINS
  \DecayTime = 1500
  \EarlyDelay = 300
  \LateDelay = 100
  \HFReference = 5000
  \HFDecayRatio = 21
  \Diffusion = 27
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 1220
  \EarlyLateMix = 82
  \WetLevel = -24.0
EndWith
; #define FMOD_PRESET_QUARRY           {  1500,   61,  25, 5000,  83, 100, 100, 250, 0,  3400, 100,  -5.0f }
Global FMOD_PRESET_QUARRY.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_QUARRY
  \DecayTime = 1500
  \EarlyDelay = 61
  \LateDelay = 25
  \HFReference = 5000
  \HFDecayRatio = 83
  \Diffusion = 100
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 3400
  \EarlyLateMix = 100
  \WetLevel = -5.0
EndWith
; #define FMOD_PRESET_PLAIN            {  1500,  179, 100, 5000,  50,  21, 100, 250, 0,  1670,  65, -28.0f }
Global FMOD_PRESET_PLAIN.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_PLAIN
  \DecayTime = 1500
  \EarlyDelay = 179
  \LateDelay = 100
  \HFReference = 5000
  \HFDecayRatio = 50
  \Diffusion = 21
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 1670
  \EarlyLateMix = 65
  \WetLevel = -28.0
EndWith
; #define FMOD_PRESET_PARKINGLOT       {  1700,    8,  12, 5000, 100, 100, 100, 250, 0, 20000,  56, -19.5f }
Global FMOD_PRESET_PARKINGLOT.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_PARKINGLOT
  \DecayTime = 1700
  \EarlyDelay = 8
  \LateDelay = 12
  \HFReference = 5000
  \HFDecayRatio = 100
  \Diffusion = 100
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 20000
  \EarlyLateMix = 56
  \WetLevel = -19.5
EndWith
; #define FMOD_PRESET_SEWERPIPE        {  2800,   14,  21, 5000,  14,  80,  60, 250, 0,  3400,  66,   1.2f }
Global FMOD_PRESET_SEWERPIPE.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_SEWERPIPE
  \DecayTime = 2800
  \EarlyDelay = 14
  \LateDelay = 21
  \HFReference = 5000
  \HFDecayRatio = 14
  \Diffusion = 80
  \Density = 60
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 3400
  \EarlyLateMix = 66
  \WetLevel = -1.2
EndWith
; #define FMOD_PRESET_UNDERWATER       {  1500,    7,  11, 5000,  10, 100, 100, 250, 0,   500,  92,   7.0f }
Global FMOD_PRESET_UNDERWATER.FMOD_REVERB_PROPERTIES
With FMOD_PRESET_UNDERWATER
  \DecayTime = 1500
  \EarlyDelay = 7
  \LateDelay = 11
  \HFReference = 5000
  \HFDecayRatio = 10
  \Diffusion = 100
  \Density = 100
  \LowShelfFrequency = 250
  \LowShelfGain = 0
  \HighCut = 500
  \EarlyLateMix = 92
  \WetLevel = -7.0
EndWith
;--------------------------------------------------------------------------
Structure FMOD_ADVANCEDSETTINGS
  cbSize.l                     ; [w]   Size of this structure.  Use sizeof(FMOD_ADVANCEDSETTINGS)  NOTE: This must be set before calling System::getAdvancedSettings or System::setAdvancedSettings!
  maxMPEGCodecs.l              ; [r/w] Optional. Specify 0 to ignore. For use with FMOD_CREATECOMPRESSEDSAMPLE only.  MPEG   codecs consume 30,528 bytes per instance and this number will determine how many MPEG   channels can be played simultaneously. Default = 32.
  maxADPCMCodecs.l             ; [r/w] Optional. Specify 0 to ignore. For use with FMOD_CREATECOMPRESSEDSAMPLE only.  ADPCM  codecs consume  3,128 bytes per instance and this number will determine how many ADPCM  channels can be played simultaneously. Default = 32.
  maxXMACodecs.l               ; [r/w] Optional. Specify 0 to ignore. For use with FMOD_CREATECOMPRESSEDSAMPLE only.  XMA    codecs consume 14,836 bytes per instance and this number will determine how many XMA    channels can be played simultaneously. Default = 32.
  maxCELTCodecs.l              ; [r/w] Optional. Specify 0 to ignore. For use with FMOD_CREATECOMPRESSEDSAMPLE only.  CELT   codecs consume 25,408 bytes per instance and this number will determine how many CELT   channels can be played simultaneously. Default = 32.
  maxVorbisCodecs.l            ; [r/w] Optional. Specify 0 to ignore. For use with FMOD_CREATECOMPRESSEDSAMPLE only.  Vorbis codecs consume 23,256 bytes per instance and this number will determine how many Vorbis channels can be played simultaneously. Default = 32.
  maxAT9Codecs.l               ; [r/w] Optional. Specify 0 to ignore. For use with FMOD_CREATECOMPRESSEDSAMPLE only.  AT9    codecs consume  8,720 bytes per instance and this number will determine how many AT9    channels can be played simultaneously. Default = 32.
  maxPCMCodecs.l               ; [r/w] Optional. Specify 0 to ignore. For use with PS3 only.                          PCM    codecs consume 12,672 bytes per instance and this number will determine how many streams and PCM voices can be played simultaneously. Default = 16.
  ASIONumChannels.l            ; [r/w] Optional. Specify 0 to ignore. Number of channels available on the ASIO device.
  *purebasic_doublepointer_ASIOChannelList; [r/w] Optional. Specify 0 to ignore. Pointer to an array of strings (number of entries defined by ASIONumChannels) with ASIO channel names.
  *ASIOSpeakerList.FMOD_SPEAKER; [r/w] Optional. Specify 0 to ignore. Pointer to a list of speakers that the ASIO channels map to.  This can be called after System::init to remap ASIO output.
  HRTFMinAngle.f               ; [r/w] Optional.                      For use with FMOD_INIT_HRTF_LOWPASS.  The angle range (0-360) of a 3D sound in relation to the listener, at which the HRTF function begins to have an effect. 0 = in front of the listener. 180 = from 90 degrees to the left of the listener to 90 degrees to the right. 360 = behind the listener. Default = 180.0.
  HRTFMaxAngle.f               ; [r/w] Optional.                      For use with FMOD_INIT_HRTF_LOWPASS.  The angle range (0-360) of a 3D sound in relation to the listener, at which the HRTF function has maximum effect. 0 = front of the listener. 180 = from 90 degrees to the left of the listener to 90 degrees to the right. 360 = behind the listener. Default = 360.0.
  HRTFFreq.f                   ; [r/w] Optional. Specify 0 to ignore. For use with FMOD_INIT_HRTF_LOWPASS.  The cutoff frequency of the HRTF's lowpass filter function when at maximum effect. (i.e. at HRTFMaxAngle).  Default = 4000.0.
  vol0virtualvol.f             ; [r/w] Optional. Specify 0 to ignore. For use with FMOD_INIT_VOL0_BECOMES_VIRTUAL.  If this flag is used, and the volume is below this, then the sound will become virtual.  Use this value to raise the threshold to a different point where a sound goes virtual.
  defaultDecodeBufferSize.l    ; [r/w] Optional. Specify 0 to ignore. For streams. This determines the default size of the double buffer (in milliseconds) that a stream uses.  Default = 400ms
  profilePort.u                ; [r/w] Optional. Specify 0 to ignore. For use with FMOD_INIT_PROFILE_ENABLE.  Specify the port to listen on for connections by the profiler application.
  geometryMaxFadeTime.l        ; [r/w] Optional. Specify 0 to ignore. The maximum time in miliseconds it takes for a channel to fade to the new level when its occlusion changes.
  distanceFilterCenterFreq.f   ; [r/w] Optional. Specify 0 to ignore. For use with FMOD_INIT_DISTANCE_FILTERING.  The default center frequency in Hz for the distance filtering effect. Default = 1500.0.
  reverb3Dinstance.l           ; [r/w] Optional. Specify 0 to ignore. Out of 0 to 3, 3d reverb spheres will create a phyical reverb unit on this instance slot.  See FMOD_REVERB_PROPERTIES.
  DSPBufferPoolSize.l          ; [r/w] Optional. Specify 0 to ignore. Number of buffers in DSP buffer pool.  Each buffer will be DSPBlockSize * sizeof(float) * SpeakerModeChannelCount.  ie 7.1 @ 1024 DSP block size = 8 * 1024 * 4 = 32kb.  Default = 8.
  stackSizeStream.l            ; [r/w] Optional. Specify 0 to ignore. Specify the stack size for the FMOD Stream thread in bytes.  Useful for custom codecs that use excess stack.  Default 49,152 (48kb)
  stackSizeNonBlocking.l       ; [r/w] Optional. Specify 0 to ignore. Specify the stack size for the FMOD_NONBLOCKING loading thread.  Useful for custom codecs that use excess stack.  Default 65,536 (64kb)
  stackSizeMixer.l             ; [r/w] Optional. Specify 0 to ignore. Specify the stack size for the FMOD mixer thread.  Useful for custom dsps that use excess stack.  Default 49,152 (48kb)
  resamplerMethod.l            ; [r/w] Optional. Specify 0 to ignore. Resampling method used with fmod's software mixer.  See FMOD_DSP_RESAMPLER for details on methods.
  commandQueueSize.l           ; [r/w] Optional. Specify 0 to ignore. Specify the command queue size for thread safe processing.  Default 2048 (2kb)
  randomSeed.l                 ; [r/w] Optional. Specify 0 to ignore. Seed value that FMOD will use to initialize its internal random number generators.
EndStructure
;--------------------------------------------------------------------------
Structure FMOD_CODEC_WAVEFORMAT
  name.a[256];      [in] Name of sound.
  format.l;         [in] Format for (decompressed) codec output, ie FMOD_SOUND_FORMAT_PCM8, FMOD_SOUND_FORMAT_PCM16.
  channels.l;       [in] Number of channels used by codec, ie mono = 1, stereo = 2. 
  frequency.l;      [in] Default frequency in hz of the codec, ie 44100. 
  lengthbytes.l;    [in] Length in bytes of the source data. 
  lengthpcm.l;      [in] Length in decompressed, PCM samples of the file, ie length in seconds * frequency.  Used for Sound::getLength and for memory allocation of static decompressed sample data. 
  blockalign.l;     [in] Blockalign in decompressed, PCM samples of the optimal decode chunk size for this format.  The codec read callback will be called in multiples of this value. 
  loopstart.l;      [in] Loopstart in decompressed, PCM samples of file. 
  loopend.l;        [in] Loopend in decompressed, PCM samples of file. 
  mode.l;           [in] Mode to determine whether the sound should by default load as looping, non looping, 2d or 3d. 
  channelmask.l;    [in] Defined channel bitmask to describe which speakers the channels in the codec map to, in order of channel count.  See fmod_common.h.  Leave at 0 to map to the speaker layout defined in FMOD_SPEAKER. 
  channelorder.l;   [in] Defined channel order type, to describe where each sound channel should pan for the number of channels specified.  See fmod_common.h.  Leave at 0 to play in default speaker order. 
  peakvolume.f;     [in] Peak volume of sound, or 0 if not used. 
EndStructure
;--------------------------------------------------------------------------
#FMOD_CODEC_WAVEFORMAT_VERSION = 1
;--------------------------------------------------------------------------
Macro FMOD_CODEC_STATE : : EndMacro ; PureBasic IDE Suggestion Helper.
Prototype.l FMOD_CODEC_OPEN_CALLBACK         (*codec_state#FMOD_CODEC_STATE, usermode.l, *userexinfo.FMOD_CREATESOUNDEXINFO)
Prototype.l FMOD_CODEC_CLOSE_CALLBACK        (*codec_state#FMOD_CODEC_STATE)
Prototype.l FMOD_CODEC_READ_CALLBACK         (*codec_state#FMOD_CODEC_STATE, *buffer, sizebytes.l, *bytesread)
Prototype.l FMOD_CODEC_GETLENGTH_CALLBACK    (*codec_state#FMOD_CODEC_STATE, *length, lengthtype.l)
Prototype.l FMOD_CODEC_SETPOSITION_CALLBACK  (*codec_state#FMOD_CODEC_STATE, subsound.l, position.l, postype.l)
Prototype.l FMOD_CODEC_GETPOSITION_CALLBACK  (*codec_state#FMOD_CODEC_STATE, *position, postype.l)
Prototype.l FMOD_CODEC_SOUNDCREATE_CALLBACK  (*codec_state#FMOD_CODEC_STATE, subsound.l, *sound)
Prototype.l FMOD_CODEC_METADATA_CALLBACK     (*codec_state#FMOD_CODEC_STATE, tagtype.l, name.p-ascii, *data, datalen.l, datatype.l, unique.l)
Prototype.l FMOD_CODEC_GETWAVEFORMAT_CALLBACK(*codec_state#FMOD_CODEC_STATE, index.l, *waveformat.FMOD_CODEC_WAVEFORMAT)
UndefineMacro FMOD_CODEC_STATE
;--------------------------------------------------------------------------
Structure FMOD_CODEC_STATE
  numsubsounds.l;                          [in] Number of 'subsounds' in this sound.  Anything other than 0 makes it a 'container' format (ie DLS/FSB etc which contain 1 or more subsounds).  For most normal, single sound codec such as WAV/AIFF/MP3, this should be 0 as they are not a container for subsounds, they are the sound by itself. 
  *waveformat.FMOD_CODEC_WAVEFORMAT;       [in] Pointer to an array of format structures containing information about each sample.  Can be 0 or NULL if FMOD_CODEC_GETWAVEFORMAT_CALLBACK callback is preferred.  The number of entries here must equal the number of subsounds defined in the subsound parameter. If numsubsounds = 0 then there should be 1 instance of this structure. 
  *plugindata;                             [in] Plugin writer created data the codec author wants to attach to this object. 
  ;--------------------------------------------------------------------------
  *filehandle;                             [out] This will return an internal FMOD file handle to use with the callbacks provided.  
  filesize.l;                              [out] This will contain the size of the file in bytes. 
  fileread.FMOD_FILE_READ_CALLBACK;        [out] This will return a callable FMOD file function to use from codec. 
  fileseek.FMOD_FILE_SEEK_CALLBACK;        [out] This will return a callable FMOD file function to use from codec.  
  metadata.FMOD_CODEC_METADATA_CALLBACK;   [out] This will return a callable FMOD metadata function to use from codec.  
  ;--------------------------------------------------------------------------
  waveformatversion.l;                     [in] Must be set to FMOD_CODEC_WAVEFORMAT_VERSION in the FMOD_CODEC_OPEN_CALLBACK. 
EndStructure
;--------------------------------------------------------------------------
Structure FMOD_CODEC_DESCRIPTION
  *name                                             ; [in] Name of the codec. 
  version.l                                         ; [in] Plugin writer's version number. 
  defaultasstream.l                                 ; [in] Tells FMOD To open the file As a stream when calling System::createSound, And Not a Static sample.  Should normally be 0 (FALSE), because generally the user wants To decode the file into memory when using System::createSound.   Mainly used For formats that decode For a very long time, Or could use large amounts of memory when decoded.  Usually sequenced formats such As mod/s3m/xm/it/midi fall into this category.   It is mainly To stop users that don't know what they're doing from getting FMOD_ERR_MEMORY returned from createSound when they should have in fact called System::createStream Or used FMOD_CREATESTREAM in System::createSound. 
  timeunits.l                                       ; [in] When setposition codec is called, only these time formats will be passed to the codec. Use bitwise OR to accumulate different types. 
  open.FMOD_CODEC_OPEN_CALLBACK                     ; [in] Open callback for the codec for when FMOD tries to open a sound using this codec. 
  close.FMOD_CODEC_CLOSE_CALLBACK                   ; [in] Close callback for the codec for when FMOD tries to close a sound using this codec.  
  Read.FMOD_CODEC_READ_CALLBACK                     ; [in] Read callback for the codec for when FMOD tries to read some data from the file to the destination format (specified in the open callback).
  getlength.FMOD_CODEC_GETLENGTH_CALLBACK           ; [in] Callback to return the length of the song in whatever format required when Sound::getLength is called. 
  setposition.FMOD_CODEC_SETPOSITION_CALLBACK       ; [in] Seek callback for the codec for when FMOD tries to seek within the file with Channel::setPosition. 
  getposition.FMOD_CODEC_GETPOSITION_CALLBACK       ; [in] Tell callback for the codec for when FMOD tries to get the current position within the with Channel::getPosition. 
  soundcreate.FMOD_CODEC_SOUNDCREATE_CALLBACK       ; [in] Sound creation callback for the codec when FMOD finishes creating the sound.  (So the codec can set more parameters for the related created sound, ie loop points/mode or 3D attributes etc). 
  getwaveformat.FMOD_CODEC_GETWAVEFORMAT_CALLBACK   ; [in] Callback to tell FMOD about the waveformat of a particular subsound.  This is to save memory, rather than saving 1000 FMOD_CODEC_WAVEFORMAT structures in the codec, the codec might have a more optimal way of storing this information. 
EndStructure
;--------------------------------------------------------------------------
;TODO:Add FMOD DSP
;TODO:Add FMOD OUTPUT
;--------------------------------------------------------------------------

;--------------------------------------------------------------------------
; * FMOD global system functions (optional).
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_Memory_Initialize                (*poolmem, poollen.l, useralloc.FMOD_MEMORY_ALLOC_CALLBACK, userrealloc.FMOD_MEMORY_REALLOC_CALLBACK, userfree.FMOD_MEMORY_FREE_CALLBACK, memtypeflags.l)
Prototype.l __proto_FMOD_Memory_GetStats                  (*currentalloced, *maxalloced, blocking.l)
Prototype.l __proto_FMOD_Debug_Initialize                 (flags, mode, callback.FMOD_DEBUG_CALLBACK, filename.p-ascii)
Prototype.l __proto_FMOD_File_SetDiskBusy                 (busy.l)
Prototype.l __proto_FMOD_File_GetDiskBusy                 (*busy)
;--------------------------------------------------------------------------
; * FMOD System factory functions.  Use this to create an FMOD System Instance.  below you will see FMOD_System_Init/Close to get started.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_System_Create                    (*purebasic_doublepointer_system) 
Prototype.l __proto_FMOD_System_Release                   (*system)
;--------------------------------------------------------------------------
;    'System' API
;--------------------------------------------------------------------------
; * Setup functions.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_System_SetOutput                 (*system, output.l)
Prototype.l __proto_FMOD_System_GetOutput                 (*system, *output)
Prototype.l __proto_FMOD_System_GetNumDrivers             (*system, *numdrivers)
Prototype.l __proto_FMOD_System_GetDriverInfo             (*system, id.l, name.p-ascii, namelen.l, *guid.FMOD_GUID, *systemrate, *speakermode, *speakermodechannels)
Prototype.l __proto_FMOD_System_SetDriver                 (*system, driver.l)
Prototype.l __proto_FMOD_System_GetDriver                 (*system, *driver)
Prototype.l __proto_FMOD_System_SetSoftwareChannels       (*system, numsoftwarechannels.l)
Prototype.l __proto_FMOD_System_GetSoftwareChannels       (*system, *numsoftwarechannels)
Prototype.l __proto_FMOD_System_SetSoftwareFormat         (*system, samplerate.l, speakermode.l, numrawspeakers.l)
Prototype.l __proto_FMOD_System_GetSoftwareFormat         (*system, *samplerate, *speakermode, *numrawspeakers)
Prototype.l __proto_FMOD_System_SetDSPBufferSize          (*system, bufferlength.l, numbuffers.l)
Prototype.l __proto_FMOD_System_GetDSPBufferSize          (*system, *bufferlength, *numbuffers)
Prototype.l __proto_FMOD_System_SetFileSystem             (*system, useropen.FMOD_FILE_OPEN_CALLBACK, userclose.FMOD_FILE_CLOSE_CALLBACK, userread.FMOD_FILE_READ_CALLBACK, userseek.FMOD_FILE_SEEK_CALLBACK, userasyncread.FMOD_FILE_ASYNCREAD_CALLBACK, userasynccancel.FMOD_FILE_ASYNCCANCEL_CALLBACK, blockalign.l)
Prototype.l __proto_FMOD_System_AttachFileSystem          (*system, useropen.FMOD_FILE_OPEN_CALLBACK, userclose.FMOD_FILE_CLOSE_CALLBACK, userread.FMOD_FILE_READ_CALLBACK, userseek.FMOD_FILE_SEEK_CALLBACK)
Prototype.l __proto_FMOD_System_SetAdvancedSettings       (*system, *settings.FMOD_ADVANCEDSETTINGS)
Prototype.l __proto_FMOD_System_GetAdvancedSettings       (*system, *settings.FMOD_ADVANCEDSETTINGS)
Prototype.l __proto_FMOD_System_SetCallback               (*system, callback.FMOD_SYSTEM_CALLBACK, callbackmask.l)
;--------------------------------------------------------------------------
; * Plug-in support.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_System_SetPluginPath             (*system, path.p-ascii)
Prototype.l __proto_FMOD_System_LoadPlugin                (*system, filename.p-ascii, *handle, priority.l)
Prototype.l __proto_FMOD_System_UnloadPlugin              (*system, handle.l)
Prototype.l __proto_FMOD_System_GetNumPlugins             (*system, plugintype.l, *numplugins)
Prototype.l __proto_FMOD_System_GetPluginHandle           (*system, plugintype.l, index.l, *handle)
Prototype.l __proto_FMOD_System_GetPluginInfo             (*system, handle.l, *plugintype, name.p-ascii, namelen.l, *version)
Prototype.l __proto_FMOD_System_SetOutputByPlugin         (*system, handle.l)
Prototype.l __proto_FMOD_System_GetOutputByPlugin         (*system, *handle)
Prototype.l __proto_FMOD_System_CreateDSPByPlugin         (*system, handle.l, *purebasic_doublepointer_dsp)
Prototype.l __proto_FMOD_System_GetDSPInfoByPlugin        (*system, handle.l, *purebasic_doublepointer_description)
Prototype.l __proto_FMOD_System_RegisterCodec             (*system, *description.FMOD_CODEC_DESCRIPTION, *handle, priority.l)
Prototype.l __proto_FMOD_System_RegisterDSP               (*system, *description, *handle)
Prototype.l __proto_FMOD_System_RegisterOutput            (*system, *description, *handle)
;--------------------------------------------------------------------------
; * Init/Close.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_System_Init                      (*system, maxchannels.l, flags.l, *extradriverdata)
Prototype.l __proto_FMOD_System_Close                     (*system)
;--------------------------------------------------------------------------
; * General post-init system functions.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_System_Update                    (*system)
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_System_SetSpeakerPosition        (*system, speaker.l, x.f, y.f, active.l)
Prototype.l __proto_FMOD_System_GetSpeakerPosition        (*system, speaker.l, *x, *y, *active)
Prototype.l __proto_FMOD_System_SetStreamBufferSize       (*system, filebuffersize.l, filebuffersizetype.l)
Prototype.l __proto_FMOD_System_GetStreamBufferSize       (*system, *filebuffersize, *filebuffersizetype)
Prototype.l __proto_FMOD_System_Set3DSettings             (*system, dopplerscale.f, distancefactor.f, rolloffscale.f)
Prototype.l __proto_FMOD_System_Get3DSettings             (*system, *dopplerscale, *distancefactor, *rolloffscale)
Prototype.l __proto_FMOD_System_Set3DNumListeners         (*system, numlisteners.l)
Prototype.l __proto_FMOD_System_Get3DNumListeners         (*system, *numlisteners)
Prototype.l __proto_FMOD_System_Set3DListenerAttributes   (*system, listener.l, *pos.FMOD_VECTOR, *vel.FMOD_VECTOR, *forward.FMOD_VECTOR, *up.FMOD_VECTOR)
Prototype.l __proto_FMOD_System_Get3DListenerAttributes   (*system, listener.l, *pos.FMOD_VECTOR, *vel.FMOD_VECTOR, *forward.FMOD_VECTOR, *up.FMOD_VECTOR)
Prototype.l __proto_FMOD_System_Set3DRolloffCallback      (*system, callback.FMOD_3D_ROLLOFF_CALLBACK)
Prototype.l __proto_FMOD_System_MixerSuspend              (*system)
Prototype.l __proto_FMOD_System_MixerResume               (*system)
;--------------------------------------------------------------------------
; * System information functions.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_System_GetVersion                (*system, *version)
Prototype.l __proto_FMOD_System_GetOutputHandle           (*system, *purebasic_doublepointer_handle)
Prototype.l __proto_FMOD_System_GetChannelsPlaying        (*system, *channels)
Prototype.l __proto_FMOD_System_GetCPUUsage               (*system, *dsp, *stream, *geometry, *update, *total)
Prototype.l __proto_FMOD_System_GetSoundRAM               (*system, *currentalloced, *maxalloced, *total)
;--------------------------------------------------------------------------
; * Sound/DSP/Channel/FX creation and retrieval.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_System_CreateSound               (*system, name_or_data.p-ascii, mode.l, *exinfo.FMOD_CREATESOUNDEXINFO, *purebasic_doublepointer_sound)
Prototype.l __proto_FMOD_System_CreateStream              (*system, name_or_data.p-ascii, mode.l, *exinfo.FMOD_CREATESOUNDEXINFO, *purebasic_doublepointer_sound)
Prototype.l __proto_FMOD_System_CreateDSP                 (*system, *description, *purebasic_doublepointer_dsp)
Prototype.l __proto_FMOD_System_CreateDSPByType           (*system, type.l, *purebasic_doublepointer_dsp)
Prototype.l __proto_FMOD_System_CreateChannelGroup        (*system, name.p-ascii, *purebasic_doublepointer_channelgroup)
Prototype.l __proto_FMOD_System_CreateSoundGroup          (*system, name.p-ascii, *purebasic_doublepointer_soundgroup)
Prototype.l __proto_FMOD_System_CreateReverb3D            (*system, *purebasic_doublepointer_reverb)
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_System_PlaySound                 (*system, *sound, *channelgroup, paused.l, *purebasic_doublepointer_channel)
Prototype.l __proto_FMOD_System_PlayDSP                   (*system, *dsp, *channelgroup, paused.l, *purebasic_doublepointer_channel)
Prototype.l __proto_FMOD_System_GetChannel                (*system, channelid.l, *purebasic_doublepointer_channel)
Prototype.l __proto_FMOD_System_GetMasterChannelGroup     (*system, *purebasic_doublepointer_channelgroup)
Prototype.l __proto_FMOD_System_GetMasterSoundGroup       (*system, *purebasic_doublepointer_soundgroup)
;--------------------------------------------------------------------------
; * Routing to ports.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_System_AttachChannelGroupToPort  (*system, portType.l, portIndex.q, *channelgroup, passThru.l)
Prototype.l __proto_FMOD_System_DetachChannelGroupFromPort(*system, *channelgroup)
;--------------------------------------------------------------------------
; * Reverb API.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_System_SetReverbProperties       (*system, instance.l, *prop.FMOD_REVERB_PROPERTIES)
Prototype.l __proto_FMOD_System_GetReverbProperties       (*system, instance.l, *prop.FMOD_REVERB_PROPERTIES)
;--------------------------------------------------------------------------
; * System level DSP functionality.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_System_LockDSP                   (*system)
Prototype.l __proto_FMOD_System_UnlockDSP                 (*system)
;--------------------------------------------------------------------------
; * Recording API.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_System_GetRecordNumDrivers       (*system, *numdrivers)
Prototype.l __proto_FMOD_System_GetRecordDriverInfo       (*system, id.l, *name.p-ascii, namelen.l, *guid.FMOD_GUID, *systemrate, *speakermode, *speakermodechannels)
Prototype.l __proto_FMOD_System_GetRecordPosition         (*system, id.l, *position)
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_System_RecordStart               (*system, id.l, *sound, loop.l)
Prototype.l __proto_FMOD_System_RecordStop                (*system, id.l)
Prototype.l __proto_FMOD_System_IsRecording               (*system, id.l, *recording)
;--------------------------------------------------------------------------
; * Geometry API.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_System_CreateGeometry            (*system, maxpolygons.l, maxvertices.l, *purebasic_doublepointer_geometry)
Prototype.l __proto_FMOD_System_SetGeometrySettings       (*system, maxworldsize.f)
Prototype.l __proto_FMOD_System_GetGeometrySettings       (*system, *maxworldsize)
Prototype.l __proto_FMOD_System_LoadGeometry              (*system, *data, datasize.l, *purebasic_doublepointer_geometry)
Prototype.l __proto_FMOD_System_GetGeometryOcclusion      (*system, *listener.FMOD_VECTOR, *source.FMOD_VECTOR, *direct, *reverb)
;--------------------------------------------------------------------------
; * Network functions.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_System_SetNetworkProxy           (*system, proxy.p-ascii)
Prototype.l __proto_FMOD_System_GetNetworkProxy           (*system, *proxy.p-ascii, proxylen.l)
Prototype.l __proto_FMOD_System_SetNetworkTimeout         (*system, timeout.l)
Prototype.l __proto_FMOD_System_GetNetworkTimeout         (*system, *timeout)
;--------------------------------------------------------------------------
; * Userdata set/get.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_System_SetUserData               (*system, *userdata)
Prototype.l __proto_FMOD_System_GetUserData               (*system, *purebasic_doublepointer_userdata)
;--------------------------------------------------------------------------
;    'Sound' API
Prototype.l __proto_FMOD_Sound_Release                    (*sound)
Prototype.l __proto_FMOD_Sound_GetSystemObject            (*sound, *purebasic_doublepointer_system)
;--------------------------------------------------------------------------
; * Standard sound manipulation functions.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_Sound_Lock                       (*sound, offset.l, length.l, *purebasic_doublepointer_ptr1, *purebasic_doublepointer_ptr2, *len1, *len2)
Prototype.l __proto_FMOD_Sound_Unlock                     (*sound, *ptr1, *ptr2, len1.l, len2.l)
Prototype.l __proto_FMOD_Sound_SetDefaults                (*sound, frequency.f, priority.l)
Prototype.l __proto_FMOD_Sound_GetDefaults                (*sound, *frequency, *priority)
Prototype.l __proto_FMOD_Sound_Set3DMinMaxDistance        (*sound, min.f, max.f)
Prototype.l __proto_FMOD_Sound_Get3DMinMaxDistance        (*sound, *min, *max)
Prototype.l __proto_FMOD_Sound_Set3DConeSettings          (*sound, insideconeangle.f, outsideconeangle.f, outsidevolume.f)
Prototype.l __proto_FMOD_Sound_Get3DConeSettings          (*sound, *insideconeangle, *outsideconeangle, *outsidevolume)
Prototype.l __proto_FMOD_Sound_Set3DCustomRolloff         (*sound, *points.FMOD_VECTOR, numpoints.l)
Prototype.l __proto_FMOD_Sound_Get3DCustomRolloff         (*sound, *purebasic_doublepointer_points.FMOD_VECTOR, *numpoints)
Prototype.l __proto_FMOD_Sound_SetSubSound                (*sound, index.l, *subsound)
Prototype.l __proto_FMOD_Sound_GetSubSound                (*sound, index.l, *purebasic_doublepointer_subsound)
Prototype.l __proto_FMOD_Sound_GetSubSoundParent          (*sound, *purebasic_doublepointer_parentsound)
Prototype.l __proto_FMOD_Sound_GetName                    (*sound, *name.p-ascii, namelen.l)
Prototype.l __proto_FMOD_Sound_GetLength                  (*sound, *length, lengthtype.l)
Prototype.l __proto_FMOD_Sound_GetFormat                  (*sound, *type, *format, *channels, *bits)
Prototype.l __proto_FMOD_Sound_GetNumSubSounds            (*sound, *numsubsounds)
Prototype.l __proto_FMOD_Sound_GetNumTags                 (*sound, *numtags, *numtagsupdated)
Prototype.l __proto_FMOD_Sound_GetTag                     (*sound, *name.p-ascii, index.l, *tag.FMOD_TAG)
Prototype.l __proto_FMOD_Sound_GetOpenState               (*sound, *openstate, *percentbuffered, *starving, *diskbusy)
Prototype.l __proto_FMOD_Sound_ReadData                   (*sound, *buffer, lenbytes.l, *read)
Prototype.l __proto_FMOD_Sound_SeekData                   (*sound, pcm.l)
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_Sound_SetSoundGroup              (*sound, *soundgroup)
Prototype.l __proto_FMOD_Sound_GetSoundGroup              (*sound, *purebasic_doublepointer_soundgroup)
;--------------------------------------------------------------------------
; * Synchronization po.l API.  These po.ls can come from markers embedded in wav files, and can also generate channel callbacks.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_Sound_GetNumSyncPoints           (*sound, *numsyncpoints)
Prototype.l __proto_FMOD_Sound_GetSyncPoint               (*sound, index.l, *purebasic_doublepointer_point)
Prototype.l __proto_FMOD_Sound_GetSyncPointInfo           (*sound, *FMOD_SYNCPOINT, *name.p-ascii, namelen.l, *offset, offsettype.l)
Prototype.l __proto_FMOD_Sound_AddSyncPoint               (*sound, offset.l, offsettype.l, name.p-ascii, *purebasic_doublepointer_syncpoint)
Prototype.l __proto_FMOD_Sound_DeleteSyncPoint            (*sound, *point)
;--------------------------------------------------------------------------
; * Functions also in Channel class but here they are the 'default' to save having to change it in Channel all the time.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_Sound_SetMode                    (*sound, mode.l)
Prototype.l __proto_FMOD_Sound_GetMode                    (*sound, *mode)
Prototype.l __proto_FMOD_Sound_SetLoopCount               (*sound, loopcount.l)
Prototype.l __proto_FMOD_Sound_GetLoopCount               (*sound, *loopcount)
Prototype.l __proto_FMOD_Sound_SetLoopPoints              (*sound, loopstart.l, loopstarttype.l, loopend.l, loopendtype.l)
Prototype.l __proto_FMOD_Sound_GetLoopPoints              (*sound, *loopstart, loopstarttype.l, *loopend, loopendtype.l)
;--------------------------------------------------------------------------
; * For MOD/S3M/XM/IT/MID sequenced formats only.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_Sound_GetMusicNumChannels        (*sound, *numchannels)
Prototype.l __proto_FMOD_Sound_SetMusicChannelVolume      (*sound, channel.l, volume.f)
Prototype.l __proto_FMOD_Sound_GetMusicChannelVolume      (*sound, channel.l, *volume)
Prototype.l __proto_FMOD_Sound_SetMusicSpeed              (*sound, speed.f)
Prototype.l __proto_FMOD_Sound_GetMusicSpeed              (*sound, *speed)
;--------------------------------------------------------------------------
; * Userdata set/get.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_Sound_SetUserData                (*sound, *userdata)
Prototype.l __proto_FMOD_Sound_GetUserData                (*sound, *purebasic_doublepointer_userdata)
;--------------------------------------------------------------------------
;    'Channel' API
Prototype.l __proto_FMOD_Channel_GetSystemObject          (*channel, *purebasic_doublepointer_system)
;--------------------------------------------------------------------------
; * General control functionality for Channels and ChannelGroups.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_Channel_Stop                     (*channel)
Prototype.l __proto_FMOD_Channel_SetPaused                (*channel, paused.l)
Prototype.l __proto_FMOD_Channel_GetPaused                (*channel, *paused)
Prototype.l __proto_FMOD_Channel_SetVolume                (*channel, volume.f)
Prototype.l __proto_FMOD_Channel_GetVolume                (*channel, *volume)
Prototype.l __proto_FMOD_Channel_SetVolumeRamp            (*channel, ramp.l)
Prototype.l __proto_FMOD_Channel_GetVolumeRamp            (*channel, *ramp)
Prototype.l __proto_FMOD_Channel_GetAudibility            (*channel, *audibility)
Prototype.l __proto_FMOD_Channel_SetPitch                 (*channel, pitch.f)
Prototype.l __proto_FMOD_Channel_GetPitch                 (*channel, *pitch)
Prototype.l __proto_FMOD_Channel_SetMute                  (*channel, mute.l)
Prototype.l __proto_FMOD_Channel_GetMute                  (*channel, *mute)
Prototype.l __proto_FMOD_Channel_SetReverbProperties      (*channel, instance.l, wet.f)
Prototype.l __proto_FMOD_Channel_GetReverbProperties      (*channel, instance.l, *wet)
Prototype.l __proto_FMOD_Channel_SetLowPassGain           (*channel, gain.f)
Prototype.l __proto_FMOD_Channel_GetLowPassGain           (*channel, *gain)
Prototype.l __proto_FMOD_Channel_SetMode                  (*channel, mode)
Prototype.l __proto_FMOD_Channel_GetMode                  (*channel, *mode)
Prototype.l __proto_FMOD_Channel_SetCallback              (*channel, callback.FMOD_CHANNELCONTROL_CALLBACK)
Prototype.l __proto_FMOD_Channel_IsPlaying                (*channel, *isplaying)
;--------------------------------------------------------------------------
; * Panning and level adjustment.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_Channel_SetPan                   (*channel, pan.f)
Prototype.l __proto_FMOD_Channel_SetMixLevelsOutput       (*channel, frontleft.f, frontright.f, center.f, lfe.f, surroundleft.f, surroundright.f, backleft.f, backright.f)
Prototype.l __proto_FMOD_Channel_SetMixLevelsInput        (*channel, *levels, numlevels.l)
Prototype.l __proto_FMOD_Channel_SetMixMatrix             (*channel, *matrix, outchannels.l, inchannels.l, inchannel_hop.l)
Prototype.l __proto_FMOD_Channel_GetMixMatrix             (*channel, *matrix, *outchannels, *inchannels, inchannel_hop.l)
;--------------------------------------------------------------------------
; * Clock based functionality.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_Channel_GetDSPClock              (*channel, *dspclock.Quad, *parentclock.Quad)
Prototype.l __proto_FMOD_Channel_SetDelay                 (*channel, dspclock_start.q, dspclock_end.q, stopchannels.l)
Prototype.l __proto_FMOD_Channel_GetDelay                 (*channel, *dspclock_start.Quad, *dspclock_end.Quad, *stopchannels)
Prototype.l __proto_FMOD_Channel_AddFadePoint             (*channel, dspclock.q, volume.f)
Prototype.l __proto_FMOD_Channel_SetFadePointRamp         (*channel, dspclock.q, volume.f)
Prototype.l __proto_FMOD_Channel_RemoveFadePoints         (*channel, dspclock_start.q, dspclock_end.q)
Prototype.l __proto_FMOD_Channel_GetFadePoints            (*channel, *numpoints, *point_dspclock.Quad, *point_volume)
;--------------------------------------------------------------------------
; * DSP effects.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_Channel_GetDSP                   (*channel, index.l, *purebasic_doublepointer_dsp)
Prototype.l __proto_FMOD_Channel_AddDSP                   (*channel, index.l, *dsp)
Prototype.l __proto_FMOD_Channel_RemoveDSP                (*channel, *dsp)
Prototype.l __proto_FMOD_Channel_GetNumDSPs               (*channel, *numdsps)
Prototype.l __proto_FMOD_Channel_SetDSPIndex              (*channel, *dsp, index.l)
Prototype.l __proto_FMOD_Channel_GetDSPIndex              (*channel, *dsp, *index)
Prototype.l __proto_FMOD_Channel_OverridePanDSP           (*channel, *pan)
;--------------------------------------------------------------------------
; * 3D functionality.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_Channel_Set3DAttributes          (*channel, *pos.FMOD_VECTOR, *vel.FMOD_VECTOR, *alt_pan_pos.FMOD_VECTOR)
Prototype.l __proto_FMOD_Channel_Get3DAttributes          (*channel, *pos.FMOD_VECTOR, *vel.FMOD_VECTOR, *alt_pan_pos.FMOD_VECTOR)
Prototype.l __proto_FMOD_Channel_Set3DMinMaxDistance      (*channel, mindistance.f, maxdistance.f)
Prototype.l __proto_FMOD_Channel_Get3DMinMaxDistance      (*channel, *mindistance, *maxdistance)
Prototype.l __proto_FMOD_Channel_Set3DConeSettings        (*channel, insideconeangle.f, outsideconeangle.f, outsidevolume.f)
Prototype.l __proto_FMOD_Channel_Get3DConeSettings        (*channel, *insideconeangle, *outsideconeangle, *outsidevolume)
Prototype.l __proto_FMOD_Channel_Set3DConeOrientation     (*channel, *orientation.FMOD_VECTOR)
Prototype.l __proto_FMOD_Channel_Get3DConeOrientation     (*channel, *orientation.FMOD_VECTOR)
Prototype.l __proto_FMOD_Channel_Set3DCustomRolloff       (*channel, *points.FMOD_VECTOR, numpoints.l)
Prototype.l __proto_FMOD_Channel_Get3DCustomRolloff       (*channel, *purebasic_doublepointer_points.FMOD_VECTOR, *numpoints)
Prototype.l __proto_FMOD_Channel_Set3DOcclusion           (*channel, directocclusion.f, reverbocclusion.f)
Prototype.l __proto_FMOD_Channel_Get3DOcclusion           (*channel, *directocclusion, *reverbocclusion)
Prototype.l __proto_FMOD_Channel_Set3DSpread              (*channel, angle.f)
Prototype.l __proto_FMOD_Channel_Get3DSpread              (*channel, *angle)
Prototype.l __proto_FMOD_Channel_Set3DLevel               (*channel, level.f)
Prototype.l __proto_FMOD_Channel_Get3DLevel               (*channel, *level)
Prototype.l __proto_FMOD_Channel_Set3DDopplerLevel        (*channel, level.f)
Prototype.l __proto_FMOD_Channel_Get3DDopplerLevel        (*channel, *level)
Prototype.l __proto_FMOD_Channel_Set3DDistanceFilter      (*channel, custom.l, customLevel.f, centerFreq.f)
Prototype.l __proto_FMOD_Channel_Get3DDistanceFilter      (*channel, *custom, *customLevel, *centerFreq)
;--------------------------------------------------------------------------
; * Userdata set/get.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_Channel_SetUserData              (*channel, *userdata)
Prototype.l __proto_FMOD_Channel_GetUserData              (*channel, *purebasic_doublepointer_userdata)
;--------------------------------------------------------------------------
; * Channel specific control functionality.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_Channel_SetFrequency             (*channel, frequency.f)
Prototype.l __proto_FMOD_Channel_GetFrequency             (*channel, *frequency)
Prototype.l __proto_FMOD_Channel_SetPriority              (*channel, priority.l)
Prototype.l __proto_FMOD_Channel_GetPriority              (*channel, *priority)
Prototype.l __proto_FMOD_Channel_SetPosition              (*channel, position.l, postype.l)
Prototype.l __proto_FMOD_Channel_GetPosition              (*channel, *position, postype.l)
Prototype.l __proto_FMOD_Channel_SetChannelGroup          (*channel, *channelgroup)
Prototype.l __proto_FMOD_Channel_GetChannelGroup          (*channel, *purebasic_doublepointer_channelgroup)
Prototype.l __proto_FMOD_Channel_SetLoopCount             (*channel, loopcount.l)
Prototype.l __proto_FMOD_Channel_GetLoopCount             (*channel, *loopcount)
Prototype.l __proto_FMOD_Channel_SetLoopPoints            (*channel, loopstart.l, loopstarttype.l, loopend.l, loopendtype.l)
Prototype.l __proto_FMOD_Channel_GetLoopPoints            (*channel, *loopstart, loopstarttype.l, *loopend, loopendtype.l)
;--------------------------------------------------------------------------
; * Information only functions.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_Channel_IsVirtual                (*channel, *isvirtual)
Prototype.l __proto_FMOD_Channel_GetCurrentSound          (*channel, *purebasic_doublepointer_sound)
Prototype.l __proto_FMOD_Channel_GetIndex                 (*channel, *index)
;--------------------------------------------------------------------------
;    'ChannelGroup' API
Prototype.l __proto_FMOD_ChannelGroup_GetSystemObject     (*channelgroup, *purebasic_doublepointer_system)
;--------------------------------------------------------------------------
; * General control functionality for Channels and ChannelGroups.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_ChannelGroup_Stop                (*channelgroup)
Prototype.l __proto_FMOD_ChannelGroup_SetPaused           (*channelgroup, paused.l)
Prototype.l __proto_FMOD_ChannelGroup_GetPaused           (*channelgroup, *paused)
Prototype.l __proto_FMOD_ChannelGroup_SetVolume           (*channelgroup, volume.f)
Prototype.l __proto_FMOD_ChannelGroup_GetVolume           (*channelgroup, *volume)
Prototype.l __proto_FMOD_ChannelGroup_SetVolumeRamp       (*channelgroup, ramp.l)
Prototype.l __proto_FMOD_ChannelGroup_GetVolumeRamp       (*channelgroup, *ramp)
Prototype.l __proto_FMOD_ChannelGroup_GetAudibility       (*channelgroup, *audibility)
Prototype.l __proto_FMOD_ChannelGroup_SetPitch            (*channelgroup, pitch.f)
Prototype.l __proto_FMOD_ChannelGroup_GetPitch            (*channelgroup, *pitch)
Prototype.l __proto_FMOD_ChannelGroup_SetMute             (*channelgroup, mute.l)
Prototype.l __proto_FMOD_ChannelGroup_GetMute             (*channelgroup, *mute)
Prototype.l __proto_FMOD_ChannelGroup_SetReverbProperties (*channelgroup, instance.l, wet.f)
Prototype.l __proto_FMOD_ChannelGroup_GetReverbProperties (*channelgroup, instance.l, *wet)
Prototype.l __proto_FMOD_ChannelGroup_SetLowPassGain      (*channelgroup, gain.f)
Prototype.l __proto_FMOD_ChannelGroup_GetLowPassGain      (*channelgroup, *gain)
Prototype.l __proto_FMOD_ChannelGroup_SetMode             (*channelgroup, mode.l)
Prototype.l __proto_FMOD_ChannelGroup_GetMode             (*channelgroup, *mode)
Prototype.l __proto_FMOD_ChannelGroup_SetCallback         (*channelgroup, callback.FMOD_CHANNELCONTROL_CALLBACK)
Prototype.l __proto_FMOD_ChannelGroup_IsPlaying           (*channelgroup, *isplaying)
;--------------------------------------------------------------------------
; * Panning and level adjustment.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_ChannelGroup_SetPan              (*channelgroup, pan.f)
Prototype.l __proto_FMOD_ChannelGroup_SetMixLevelsOutput  (*channelgroup, frontleft.f, frontright.f, center.f, lfe.f, surroundleft.f, surroundright.f, backleft.f, backright.f)
Prototype.l __proto_FMOD_ChannelGroup_SetMixLevelsInput   (*channelgroup, *levels, numlevels.l)
Prototype.l __proto_FMOD_ChannelGroup_SetMixMatrix        (*channelgroup, *matrix, outchannels.l, inchannels.l, inchannel_hop.l)
Prototype.l __proto_FMOD_ChannelGroup_GetMixMatrix        (*channelgroup, *matrix, *outchannels, *inchannels, inchannel_hop.l)
;--------------------------------------------------------------------------
; * Clock based functionality.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_ChannelGroup_GetDSPClock         (*channelgroup, *dspclock.Quad, *parentclock.Quad)
Prototype.l __proto_FMOD_ChannelGroup_SetDelay            (*channelgroup, dspclock_start.q, dspclock_end.q, stopchannels.l)
Prototype.l __proto_FMOD_ChannelGroup_GetDelay            (*channelgroup, *dspclock_start.Quad, *dspclock_end.Quad, *stopchannels)
Prototype.l __proto_FMOD_ChannelGroup_AddFadePoint        (*channelgroup, dspclock.q, volume.f)
Prototype.l __proto_FMOD_ChannelGroup_SetFadePointRamp    (*channelgroup, dspclock.q, volume.f)
Prototype.l __proto_FMOD_ChannelGroup_RemoveFadePoints    (*channelgroup, dspclock_start.q, dspclock_end.q)
Prototype.l __proto_FMOD_ChannelGroup_GetFadePoints       (*channelgroup, *numpoints, *point_dspclock.Quad, *point_volume)
;--------------------------------------------------------------------------
; * DSP effects.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_ChannelGroup_GetDSP              (*channelgroup, index.l, *purebasic_doublepointer_dsp)
Prototype.l __proto_FMOD_ChannelGroup_AddDSP              (*channelgroup, index.l, *dsp)
Prototype.l __proto_FMOD_ChannelGroup_RemoveDSP           (*channelgroup, *dsp)
Prototype.l __proto_FMOD_ChannelGroup_GetNumDSPs          (*channelgroup, *numdsps)
Prototype.l __proto_FMOD_ChannelGroup_SetDSPIndex         (*channelgroup, *dsp, index.l)
Prototype.l __proto_FMOD_ChannelGroup_GetDSPIndex         (*channelgroup, *dsp, *index)
Prototype.l __proto_FMOD_ChannelGroup_OverridePanDSP      (*channelgroup, *pan)
;--------------------------------------------------------------------------
; * 3D functionality.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_ChannelGroup_Set3DAttributes     (*channelgroup, *pos.FMOD_VECTOR, *vel.FMOD_VECTOR, *alt_pan_pos.FMOD_VECTOR)
Prototype.l __proto_FMOD_ChannelGroup_Get3DAttributes     (*channelgroup, *pos.FMOD_VECTOR, *vel.FMOD_VECTOR, *alt_pan_pos.FMOD_VECTOR)
Prototype.l __proto_FMOD_ChannelGroup_Set3DMinMaxDistance (*channelgroup, mindistance.f, maxdistance.f)
Prototype.l __proto_FMOD_ChannelGroup_Get3DMinMaxDistance (*channelgroup, *mindistance, *maxdistance)
Prototype.l __proto_FMOD_ChannelGroup_Set3DConeSettings   (*channelgroup, insideconeangle.f, outsideconeangle.f, outsidevolume.f)
Prototype.l __proto_FMOD_ChannelGroup_Get3DConeSettings   (*channelgroup, *insideconeangle, *outsideconeangle, *outsidevolume)
Prototype.l __proto_FMOD_ChannelGroup_Set3DConeOrientation(*channelgroup, *orientation.FMOD_VECTOR)
Prototype.l __proto_FMOD_ChannelGroup_Get3DConeOrientation(*channelgroup, *orientation.FMOD_VECTOR)
Prototype.l __proto_FMOD_ChannelGroup_Set3DCustomRolloff  (*channelgroup, *points.FMOD_VECTOR, numpoints.l)
Prototype.l __proto_FMOD_ChannelGroup_Get3DCustomRolloff  (*channelgroup, *purebasic_doublepointer_points.FMOD_VECTOR, *numpoints)
Prototype.l __proto_FMOD_ChannelGroup_Set3DOcclusion      (*channelgroup, directocclusion.f, reverbocclusion.f)
Prototype.l __proto_FMOD_ChannelGroup_Get3DOcclusion      (*channelgroup, *directocclusion, *reverbocclusion)
Prototype.l __proto_FMOD_ChannelGroup_Set3DSpread         (*channelgroup, angle.f)
Prototype.l __proto_FMOD_ChannelGroup_Get3DSpread         (*channelgroup, *angle)
Prototype.l __proto_FMOD_ChannelGroup_Set3DLevel          (*channelgroup, level.f)
Prototype.l __proto_FMOD_ChannelGroup_Get3DLevel          (*channelgroup, *level)
Prototype.l __proto_FMOD_ChannelGroup_Set3DDopplerLevel   (*channelgroup, level.f)
Prototype.l __proto_FMOD_ChannelGroup_Get3DDopplerLevel   (*channelgroup, *level)
Prototype.l __proto_FMOD_ChannelGroup_Set3DDistanceFilter (*channelgroup, custom.l, customLevel.f, centerFreq.f)
Prototype.l __proto_FMOD_ChannelGroup_Get3DDistanceFilter (*channelgroup, *custom, *customLevel, *centerFreq)
;--------------------------------------------------------------------------
; * Userdata set/get.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_ChannelGroup_SetUserData         (*channelgroup, *userdata)
Prototype.l __proto_FMOD_ChannelGroup_GetUserData         (*channelgroup, *purebasic_doublepointer_userdata)
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_ChannelGroup_Release             (*channelgroup)
;--------------------------------------------------------------------------
; * Nested channel groups.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_ChannelGroup_AddGroup            (*channelgroup, *group, propagatedspclock.l, *purebasic_doublepointer_connection)
Prototype.l __proto_FMOD_ChannelGroup_GetNumGroups        (*channelgroup, *numgroups)
Prototype.l __proto_FMOD_ChannelGroup_GetGroup            (*channelgroup, index.l, *purebasic_doublepointer_group)
Prototype.l __proto_FMOD_ChannelGroup_GetParentGroup      (*channelgroup, *purebasic_doublepointer_group)
;--------------------------------------------------------------------------
; * Information only functions.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_ChannelGroup_GetName             (*channelgroup, *name.p-ascii, namelen.l)
Prototype.l __proto_FMOD_ChannelGroup_GetNumChannels      (*channelgroup, *numchannels)
Prototype.l __proto_FMOD_ChannelGroup_GetChannel          (*channelgroup, index.l, *purebasic_doublepointer_channel)
;--------------------------------------------------------------------------
;    'SoundGroup' API
Prototype.l __proto_FMOD_SoundGroup_Release               (*soundgroup)
Prototype.l __proto_FMOD_SoundGroup_GetSystemObject       (*soundgroup, *purebasic_doublepointer_system)
;--------------------------------------------------------------------------
; * SoundGroup control functions.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_SoundGroup_SetMaxAudible         (*soundgroup, maxaudible.l)
Prototype.l __proto_FMOD_SoundGroup_GetMaxAudible         (*soundgroup, *maxaudible)
Prototype.l __proto_FMOD_SoundGroup_SetMaxAudibleBehavior (*soundgroup, behavior)
Prototype.l __proto_FMOD_SoundGroup_GetMaxAudibleBehavior (*soundgroup, *behavior)
Prototype.l __proto_FMOD_SoundGroup_SetMuteFadeSpeed      (*soundgroup, speed.f)
Prototype.l __proto_FMOD_SoundGroup_GetMuteFadeSpeed      (*soundgroup, *speed)
Prototype.l __proto_FMOD_SoundGroup_SetVolume             (*soundgroup, volume.f)
Prototype.l __proto_FMOD_SoundGroup_GetVolume             (*soundgroup, *volume)
Prototype.l __proto_FMOD_SoundGroup_Stop                  (*soundgroup)
;--------------------------------------------------------------------------
; * Information only functions.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_SoundGroup_GetName               (*soundgroup, *name.p-ascii, namelen.l)
Prototype.l __proto_FMOD_SoundGroup_GetNumSounds          (*soundgroup, *numsounds)
Prototype.l __proto_FMOD_SoundGroup_GetSound              (*soundgroup, index.l, *purebasic_doublepointer_sound)
Prototype.l __proto_FMOD_SoundGroup_GetNumPlaying         (*soundgroup, *numplaying)
;--------------------------------------------------------------------------
; * Userdata set/get.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_SoundGroup_SetUserData           (*soundgroup, *userdata)
Prototype.l __proto_FMOD_SoundGroup_GetUserData           (*soundgroup, *purebasic_doublepointer_userdata)
;--------------------------------------------------------------------------
;    'DSP' API
Prototype.l __proto_FMOD_DSP_Release                      (*dsp)
Prototype.l __proto_FMOD_DSP_GetSystemObject              (*dsp, *purebasic_doublepointer_system)
;--------------------------------------------------------------------------
; * Connection / disconnection / input and output enumeration.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_DSP_AddInput                     (*dsp, *input, *purebasic_doublepointer_connection, type.l)
Prototype.l __proto_FMOD_DSP_DisconnectFrom               (*dsp, *target, *connection)
Prototype.l __proto_FMOD_DSP_DisconnectAll                (*dsp, inputs.l, outputs.l)
Prototype.l __proto_FMOD_DSP_GetNumInputs                 (*dsp, *numinputs)
Prototype.l __proto_FMOD_DSP_GetNumOutputs                (*dsp, *numoutputs)
Prototype.l __proto_FMOD_DSP_GetInput                     (*dsp, index.l, *purebasic_doublepointer_input, *purebasic_doublepointer_inputconnection)
Prototype.l __proto_FMOD_DSP_GetOutput                    (*dsp, index.l, *purebasic_doublepointer_output, *purebasic_doublepointer_outputconnection)
;--------------------------------------------------------------------------
; * DSP unit control.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_DSP_SetActive                    (*dsp, active.l)
Prototype.l __proto_FMOD_DSP_GetActive                    (*dsp, *active)
Prototype.l __proto_FMOD_DSP_SetBypass                    (*dsp, bypass.l)
Prototype.l __proto_FMOD_DSP_GetBypass                    (*dsp, *bypass)
Prototype.l __proto_FMOD_DSP_SetWetDryMix                 (*dsp, prewet.f, postwet.f, dry.f)
Prototype.l __proto_FMOD_DSP_GetWetDryMix                 (*dsp, *prewet, *postwet, *dry)
Prototype.l __proto_FMOD_DSP_SetChannelFormat             (*dsp, channelmask.l, numchannels.l, source_speakermode.l)
Prototype.l __proto_FMOD_DSP_GetChannelFormat             (*dsp, *channelmask, *numchannels, *source_speakermode)
Prototype.l __proto_FMOD_DSP_GetOutputChannelFormat       (*dsp, inmask.l, inchannels.l, inspeakermode.l, *outmask, *outchannels, *outspeakermode)
Prototype.l __proto_FMOD_DSP_Reset                        (*dsp)
;--------------------------------------------------------------------------
; * DSP parameter control.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_DSP_SetParameterFloat            (*dsp, index.l, value.f)
Prototype.l __proto_FMOD_DSP_SetParameterInt              (*dsp, index.l, value.l)
Prototype.l __proto_FMOD_DSP_SetParameterBool             (*dsp, index.l, value.l)
Prototype.l __proto_FMOD_DSP_SetParameterData             (*dsp, index.l, *data, length.l)
Prototype.l __proto_FMOD_DSP_GetParameterFloat            (*dsp, index.l, *value, valuestr.p-ascii, valuestrlen.l)
Prototype.l __proto_FMOD_DSP_GetParameterInt              (*dsp, index.l, *value, valuestr.p-ascii, valuestrlen.l)
Prototype.l __proto_FMOD_DSP_GetParameterBool             (*dsp, index.l, *value, valuestr.p-ascii, valuestrlen.l)
Prototype.l __proto_FMOD_DSP_GetParameterData             (*dsp, index.l, *purebasic_doublepointer_data, *length, valuestr.p-ascii, valuestrlen.l)
Prototype.l __proto_FMOD_DSP_GetNumParameters             (*dsp, *numparams)
Prototype.l __proto_FMOD_DSP_GetParameterInfo             (*dsp, index.l, *purebasic_doublepointer_desc)
Prototype.l __proto_FMOD_DSP_GetDataParameterIndex        (*dsp, datatype.l, *index)
Prototype.l __proto_FMOD_DSP_ShowConfigDialog             (*dsp, *hwnd, show.l)
;--------------------------------------------------------------------------
; * DSP attributes.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_DSP_GetInfo                      (*dsp, *name.p-ascii, *version, *channels, *configwidth, *configheight)
Prototype.l __proto_FMOD_DSP_GetType                      (*dsp, *type)
Prototype.l __proto_FMOD_DSP_GetIdle                      (*dsp, *idle)
;--------------------------------------------------------------------------
; * Userdata set/get.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_DSP_SetUserData                  (*dsp, *userdata)
Prototype.l __proto_FMOD_DSP_GetUserData                  (*dsp, *purebasic_doublepointer_userdata)
;--------------------------------------------------------------------------
; * Metering.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_DSP_SetMeteringEnabled           (*dsp, inputEnabled.l, outputEnabled.l)
Prototype.l __proto_FMOD_DSP_GetMeteringEnabled           (*dsp, *inputEnabled, *outputEnabled)
Prototype.l __proto_FMOD_DSP_GetMeteringInfo              (*dsp, *inputInfo, *outputInfo)
;--------------------------------------------------------------------------
;    'DSPConnection' API
Prototype.l __proto_FMOD_DSPConnection_GetInput           (*dspconnection, *purebasic_doublepointer_input)
Prototype.l __proto_FMOD_DSPConnection_GetOutput          (*dspconnection, *purebasic_doublepointer_output)
Prototype.l __proto_FMOD_DSPConnection_SetMix             (*dspconnection, volume.f)
Prototype.l __proto_FMOD_DSPConnection_GetMix             (*dspconnection, *volume)
Prototype.l __proto_FMOD_DSPConnection_SetMixMatrix       (*dspconnection, *matrix, outchannels.l, inchannels.l, inchannel_hop.l)
Prototype.l __proto_FMOD_DSPConnection_GetMixMatrix       (*dspconnection, *matrix, *outchannels, *inchannels, inchannel_hop.l)
Prototype.l __proto_FMOD_DSPConnection_GetType            (*dspconnection, *type)
;--------------------------------------------------------------------------
; * Userdata set/get.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_DSPConnection_SetUserData        (*dspconnection, *userdata)
Prototype.l __proto_FMOD_DSPConnection_GetUserData        (*dspconnection, *purebasic_doublepointer_userdata)
;--------------------------------------------------------------------------
;    'Geometry' API
Prototype.l __proto_FMOD_Geometry_Release                 (*geometry)
;--------------------------------------------------------------------------
; * Polygon manipulation.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_Geometry_AddPolygon              (*geometry, directocclusion.f, reverbocclusion.f, doublesided.l, numvertices.l, *vertices, *polygonindex)
Prototype.l __proto_FMOD_Geometry_GetNumPolygons          (*geometry, *numpolygons)
Prototype.l __proto_FMOD_Geometry_GetMaxPolygons          (*geometry, *maxpolygons, *maxvertices)
Prototype.l __proto_FMOD_Geometry_GetPolygonNumVertices   (*geometry, index.l, *numvertices)
Prototype.l __proto_FMOD_Geometry_SetPolygonVertex        (*geometry, index.l, vertexindex.l, *vertex.FMOD_VECTOR)
Prototype.l __proto_FMOD_Geometry_GetPolygonVertex        (*geometry, index.l, vertexindex.l, *vertex.FMOD_VECTOR)
Prototype.l __proto_FMOD_Geometry_SetPolygonAttributes    (*geometry, index.l, directocclusion.f, reverbocclusion.f, doublesided.l)
Prototype.l __proto_FMOD_Geometry_GetPolygonAttributes    (*geometry, index.l, *directocclusion, *reverbocclusion, *doublesided)
;--------------------------------------------------------------------------
; * Object manipulation.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_Geometry_SetActive               (*geometry, active.l)
Prototype.l __proto_FMOD_Geometry_GetActive               (*geometry, *active)
Prototype.l __proto_FMOD_Geometry_SetRotation             (*geometry, *forward.FMOD_VECTOR, *up.FMOD_VECTOR)
Prototype.l __proto_FMOD_Geometry_GetRotation             (*geometry, *forward.FMOD_VECTOR, *up.FMOD_VECTOR)
Prototype.l __proto_FMOD_Geometry_SetPosition             (*geometry, *position.FMOD_VECTOR)
Prototype.l __proto_FMOD_Geometry_GetPosition             (*geometry, *position.FMOD_VECTOR)
Prototype.l __proto_FMOD_Geometry_SetScale                (*geometry, *scale.FMOD_VECTOR)
Prototype.l __proto_FMOD_Geometry_GetScale                (*geometry, *scale.FMOD_VECTOR)
Prototype.l __proto_FMOD_Geometry_Save                    (*geometry, *data, *datasize)
;--------------------------------------------------------------------------
; * Userdata set/get.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_Geometry_SetUserData             (*geometry, *userdata)
Prototype.l __proto_FMOD_Geometry_GetUserData             (*geometry, *purebasic_doublepointer_userdata)
;--------------------------------------------------------------------------
;    'Reverb3D' API
Prototype.l __proto_FMOD_Reverb3D_Release                 (*reverb3d)
;--------------------------------------------------------------------------
; * Reverb manipulation.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_Reverb3D_Set3DAttributes         (*reverb3d, *position.FMOD_VECTOR, mindistance.f, maxdistance.f)
Prototype.l __proto_FMOD_Reverb3D_Get3DAttributes         (*reverb3d, *position.FMOD_VECTOR, *mindistance, *maxdistance)
Prototype.l __proto_FMOD_Reverb3D_SetProperties           (*reverb3d, *properties.FMOD_REVERB_PROPERTIES)
Prototype.l __proto_FMOD_Reverb3D_GetProperties           (*reverb3d, *properties.FMOD_REVERB_PROPERTIES)
Prototype.l __proto_FMOD_Reverb3D_SetActive               (*reverb3d, active.l)
Prototype.l __proto_FMOD_Reverb3D_GetActive               (*reverb3d, *active)
;--------------------------------------------------------------------------
; * Userdata set/get.
;--------------------------------------------------------------------------
Prototype.l __proto_FMOD_Reverb3D_SetUserData             (*reverb3d, *userdata)
Prototype.l __proto_FMOD_Reverb3D_GetUserData             (*reverb3d, *purebasic_doublepointer_userdata)
;--------------------------------------------------------------------------

Procedure FMOD_Initialize()
  Debug "FMOD Initializing"
  CompilerIf #PB_Compiler_Processor = #PB_Processor_x64
    DLL_FMOD = OpenLibrary(#PB_Any, "x64/fmod.dll")
  CompilerElse
    DLL_FMOD = OpenLibrary(#PB_Any, "x86/fmod.dll")
  CompilerEndIf
  Global FMOD_Memory_Initialize.__proto_FMOD_Memory_Initialize = GetFunction(DLL_FMOD, "FMOD_Memory_Initialize")
  Global FMOD_Memory_GetStats.__proto_FMOD_Memory_GetStats = GetFunction(DLL_FMOD, "FMOD_Memory_GetStats")
  Global FMOD_Debug_Initialize.__proto_FMOD_Debug_Initialize = GetFunction(DLL_FMOD, "FMOD_Debug_Initialize")
  Global FMOD_File_SetDiskBusy.__proto_FMOD_File_SetDiskBusy = GetFunction(DLL_FMOD, "FMOD_File_SetDiskBusy")
  Global FMOD_File_GetDiskBusy.__proto_FMOD_File_GetDiskBusy = GetFunction(DLL_FMOD, "FMOD_File_GetDiskBusy")
  Global FMOD_System_Create.__proto_FMOD_System_Create = GetFunction(DLL_FMOD, "FMOD_System_Create")
  Global FMOD_System_Release.__proto_FMOD_System_Release = GetFunction(DLL_FMOD, "FMOD_System_Release")
  Global FMOD_System_SetOutput.__proto_FMOD_System_SetOutput = GetFunction(DLL_FMOD, "FMOD_System_SetOutput")
  Global FMOD_System_GetOutput.__proto_FMOD_System_GetOutput = GetFunction(DLL_FMOD, "FMOD_System_GetOutput")
  Global FMOD_System_GetNumDrivers.__proto_FMOD_System_GetNumDrivers = GetFunction(DLL_FMOD, "FMOD_System_GetNumDrivers")
  Global FMOD_System_GetDriverInfo.__proto_FMOD_System_GetDriverInfo = GetFunction(DLL_FMOD, "FMOD_System_GetDriverInfo")
  Global FMOD_System_SetDriver.__proto_FMOD_System_SetDriver = GetFunction(DLL_FMOD, "FMOD_System_SetDriver")
  Global FMOD_System_GetDriver.__proto_FMOD_System_GetDriver = GetFunction(DLL_FMOD, "FMOD_System_GetDriver")
  Global FMOD_System_SetSoftwareChannels.__proto_FMOD_System_SetSoftwareChannels = GetFunction(DLL_FMOD, "FMOD_System_SetSoftwareChannels")
  Global FMOD_System_GetSoftwareChannels.__proto_FMOD_System_GetSoftwareChannels = GetFunction(DLL_FMOD, "FMOD_System_GetSoftwareChannels")
  Global FMOD_System_SetSoftwareFormat.__proto_FMOD_System_SetSoftwareFormat = GetFunction(DLL_FMOD, "FMOD_System_SetSoftwareFormat")
  Global FMOD_System_GetSoftwareFormat.__proto_FMOD_System_GetSoftwareFormat = GetFunction(DLL_FMOD, "FMOD_System_GetSoftwareFormat")
  Global FMOD_System_SetDSPBufferSize.__proto_FMOD_System_SetDSPBufferSize = GetFunction(DLL_FMOD, "FMOD_System_SetDSPBufferSize")
  Global FMOD_System_GetDSPBufferSize.__proto_FMOD_System_GetDSPBufferSize = GetFunction(DLL_FMOD, "FMOD_System_GetDSPBufferSize")
  Global FMOD_System_SetFileSystem.__proto_FMOD_System_SetFileSystem = GetFunction(DLL_FMOD, "FMOD_System_SetFileSystem")
  Global FMOD_System_AttachFileSystem.__proto_FMOD_System_AttachFileSystem = GetFunction(DLL_FMOD, "FMOD_System_AttachFileSystem")
  Global FMOD_System_SetAdvancedSettings.__proto_FMOD_System_SetAdvancedSettings = GetFunction(DLL_FMOD, "FMOD_System_SetAdvancedSettings")
  Global FMOD_System_GetAdvancedSettings.__proto_FMOD_System_GetAdvancedSettings = GetFunction(DLL_FMOD, "FMOD_System_GetAdvancedSettings")
  Global FMOD_System_SetCallback.__proto_FMOD_System_SetCallback = GetFunction(DLL_FMOD, "FMOD_System_SetCallback")
  Global FMOD_System_SetPluginPath.__proto_FMOD_System_SetPluginPath = GetFunction(DLL_FMOD, "FMOD_System_SetPluginPath")
  Global FMOD_System_LoadPlugin.__proto_FMOD_System_LoadPlugin = GetFunction(DLL_FMOD, "FMOD_System_LoadPlugin")
  Global FMOD_System_UnloadPlugin.__proto_FMOD_System_UnloadPlugin = GetFunction(DLL_FMOD, "FMOD_System_UnloadPlugin")
  Global FMOD_System_GetNumPlugins.__proto_FMOD_System_GetNumPlugins = GetFunction(DLL_FMOD, "FMOD_System_GetNumPlugins")
  Global FMOD_System_GetPluginHandle.__proto_FMOD_System_GetPluginHandle = GetFunction(DLL_FMOD, "FMOD_System_GetPluginHandle")
  Global FMOD_System_GetPluginInfo.__proto_FMOD_System_GetPluginInfo = GetFunction(DLL_FMOD, "FMOD_System_GetPluginInfo")
  Global FMOD_System_SetOutputByPlugin.__proto_FMOD_System_SetOutputByPlugin = GetFunction(DLL_FMOD, "FMOD_System_SetOutputByPlugin")
  Global FMOD_System_GetOutputByPlugin.__proto_FMOD_System_GetOutputByPlugin = GetFunction(DLL_FMOD, "FMOD_System_GetOutputByPlugin")
  Global FMOD_System_CreateDSPByPlugin.__proto_FMOD_System_CreateDSPByPlugin = GetFunction(DLL_FMOD, "FMOD_System_CreateDSPByPlugin")
  Global FMOD_System_GetDSPInfoByPlugin.__proto_FMOD_System_GetDSPInfoByPlugin = GetFunction(DLL_FMOD, "FMOD_System_GetDSPInfoByPlugin")
  Global FMOD_System_RegisterCodec.__proto_FMOD_System_RegisterCodec = GetFunction(DLL_FMOD, "FMOD_System_RegisterCodec")
  Global FMOD_System_RegisterDSP.__proto_FMOD_System_RegisterDSP = GetFunction(DLL_FMOD, "FMOD_System_RegisterDSP")
  Global FMOD_System_RegisterOutput.__proto_FMOD_System_RegisterOutput = GetFunction(DLL_FMOD, "FMOD_System_RegisterOutput")
  Global FMOD_System_Init.__proto_FMOD_System_Init = GetFunction(DLL_FMOD, "FMOD_System_Init")
  Global FMOD_System_Close.__proto_FMOD_System_Close = GetFunction(DLL_FMOD, "FMOD_System_Close")
  Global FMOD_System_Update.__proto_FMOD_System_Update = GetFunction(DLL_FMOD, "FMOD_System_Update")
  Global FMOD_System_SetSpeakerPosition.__proto_FMOD_System_SetSpeakerPosition = GetFunction(DLL_FMOD, "FMOD_System_SetSpeakerPosition")
  Global FMOD_System_GetSpeakerPosition.__proto_FMOD_System_GetSpeakerPosition = GetFunction(DLL_FMOD, "FMOD_System_GetSpeakerPosition")
  Global FMOD_System_SetStreamBufferSize.__proto_FMOD_System_SetStreamBufferSize = GetFunction(DLL_FMOD, "FMOD_System_SetStreamBufferSize")
  Global FMOD_System_GetStreamBufferSize.__proto_FMOD_System_GetStreamBufferSize = GetFunction(DLL_FMOD, "FMOD_System_GetStreamBufferSize")
  Global FMOD_System_Set3DSettings.__proto_FMOD_System_Set3DSettings = GetFunction(DLL_FMOD, "FMOD_System_Set3DSettings")
  Global FMOD_System_Get3DSettings.__proto_FMOD_System_Get3DSettings = GetFunction(DLL_FMOD, "FMOD_System_Get3DSettings")
  Global FMOD_System_Set3DNumListeners.__proto_FMOD_System_Set3DNumListeners = GetFunction(DLL_FMOD, "FMOD_System_Set3DNumListeners")
  Global FMOD_System_Get3DNumListeners.__proto_FMOD_System_Get3DNumListeners = GetFunction(DLL_FMOD, "FMOD_System_Get3DNumListeners")
  Global FMOD_System_Set3DListenerAttributes.__proto_FMOD_System_Set3DListenerAttributes = GetFunction(DLL_FMOD, "FMOD_System_Set3DListenerAttributes")
  Global FMOD_System_Get3DListenerAttributes.__proto_FMOD_System_Get3DListenerAttributes = GetFunction(DLL_FMOD, "FMOD_System_Get3DListenerAttributes")
  Global FMOD_System_Set3DRolloffCallback.__proto_FMOD_System_Set3DRolloffCallback = GetFunction(DLL_FMOD, "FMOD_System_Set3DRolloffCallback")
  Global FMOD_System_MixerSuspend.__proto_FMOD_System_MixerSuspend = GetFunction(DLL_FMOD, "FMOD_System_MixerSuspend")
  Global FMOD_System_MixerResume.__proto_FMOD_System_MixerResume = GetFunction(DLL_FMOD, "FMOD_System_MixerResume")
  Global FMOD_System_GetVersion.__proto_FMOD_System_GetVersion = GetFunction(DLL_FMOD, "FMOD_System_GetVersion")
  Global FMOD_System_GetOutputHandle.__proto_FMOD_System_GetOutputHandle = GetFunction(DLL_FMOD, "FMOD_System_GetOutputHandle")
  Global FMOD_System_GetChannelsPlaying.__proto_FMOD_System_GetChannelsPlaying = GetFunction(DLL_FMOD, "FMOD_System_GetChannelsPlaying")
  Global FMOD_System_GetCPUUsage.__proto_FMOD_System_GetCPUUsage = GetFunction(DLL_FMOD, "FMOD_System_GetCPUUsage")
  Global FMOD_System_GetSoundRAM.__proto_FMOD_System_GetSoundRAM = GetFunction(DLL_FMOD, "FMOD_System_GetSoundRAM")
  Global FMOD_System_CreateSound.__proto_FMOD_System_CreateSound = GetFunction(DLL_FMOD, "FMOD_System_CreateSound")
  Global FMOD_System_CreateStream.__proto_FMOD_System_CreateStream = GetFunction(DLL_FMOD, "FMOD_System_CreateStream")
  Global FMOD_System_CreateDSP.__proto_FMOD_System_CreateDSP = GetFunction(DLL_FMOD, "FMOD_System_CreateDSP")
  Global FMOD_System_CreateDSPByType.__proto_FMOD_System_CreateDSPByType = GetFunction(DLL_FMOD, "FMOD_System_CreateDSPByType")
  Global FMOD_System_CreateChannelGroup.__proto_FMOD_System_CreateChannelGroup = GetFunction(DLL_FMOD, "FMOD_System_CreateChannelGroup")
  Global FMOD_System_CreateSoundGroup.__proto_FMOD_System_CreateSoundGroup = GetFunction(DLL_FMOD, "FMOD_System_CreateSoundGroup")
  Global FMOD_System_CreateReverb3D.__proto_FMOD_System_CreateReverb3D = GetFunction(DLL_FMOD, "FMOD_System_CreateReverb3D")
  Global FMOD_System_PlaySound.__proto_FMOD_System_PlaySound = GetFunction(DLL_FMOD, "FMOD_System_PlaySound")
  Global FMOD_System_PlayDSP.__proto_FMOD_System_PlayDSP = GetFunction(DLL_FMOD, "FMOD_System_PlayDSP")
  Global FMOD_System_GetChannel.__proto_FMOD_System_GetChannel = GetFunction(DLL_FMOD, "FMOD_System_GetChannel")
  Global FMOD_System_GetMasterChannelGroup.__proto_FMOD_System_GetMasterChannelGroup = GetFunction(DLL_FMOD, "FMOD_System_GetMasterChannelGroup")
  Global FMOD_System_GetMasterSoundGroup.__proto_FMOD_System_GetMasterSoundGroup = GetFunction(DLL_FMOD, "FMOD_System_GetMasterSoundGroup")
  Global FMOD_System_AttachChannelGroupToPort.__proto_FMOD_System_AttachChannelGroupToPort = GetFunction(DLL_FMOD, "FMOD_System_AttachChannelGroupToPort")
  Global FMOD_System_DetachChannelGroupFromPort.__proto_FMOD_System_DetachChannelGroupFromPort = GetFunction(DLL_FMOD, "FMOD_System_DetachChannelGroupFromPort")
  Global FMOD_System_SetReverbProperties.__proto_FMOD_System_SetReverbProperties = GetFunction(DLL_FMOD, "FMOD_System_SetReverbProperties")
  Global FMOD_System_GetReverbProperties.__proto_FMOD_System_GetReverbProperties = GetFunction(DLL_FMOD, "FMOD_System_GetReverbProperties")
  Global FMOD_System_LockDSP.__proto_FMOD_System_LockDSP = GetFunction(DLL_FMOD, "FMOD_System_LockDSP")
  Global FMOD_System_UnlockDSP.__proto_FMOD_System_UnlockDSP = GetFunction(DLL_FMOD, "FMOD_System_UnlockDSP")
  Global FMOD_System_GetRecordNumDrivers.__proto_FMOD_System_GetRecordNumDrivers = GetFunction(DLL_FMOD, "FMOD_System_GetRecordNumDrivers")
  Global FMOD_System_GetRecordDriverInfo.__proto_FMOD_System_GetRecordDriverInfo = GetFunction(DLL_FMOD, "FMOD_System_GetRecordDriverInfo")
  Global FMOD_System_GetRecordPosition.__proto_FMOD_System_GetRecordPosition = GetFunction(DLL_FMOD, "FMOD_System_GetRecordPosition")
  Global FMOD_System_RecordStart.__proto_FMOD_System_RecordStart = GetFunction(DLL_FMOD, "FMOD_System_RecordStart")
  Global FMOD_System_RecordStop.__proto_FMOD_System_RecordStop = GetFunction(DLL_FMOD, "FMOD_System_RecordStop")
  Global FMOD_System_IsRecording.__proto_FMOD_System_IsRecording = GetFunction(DLL_FMOD, "FMOD_System_IsRecording")
  Global FMOD_System_CreateGeometry.__proto_FMOD_System_CreateGeometry = GetFunction(DLL_FMOD, "FMOD_System_CreateGeometry")
  Global FMOD_System_SetGeometrySettings.__proto_FMOD_System_SetGeometrySettings = GetFunction(DLL_FMOD, "FMOD_System_SetGeometrySettings")
  Global FMOD_System_GetGeometrySettings.__proto_FMOD_System_GetGeometrySettings = GetFunction(DLL_FMOD, "FMOD_System_GetGeometrySettings")
  Global FMOD_System_LoadGeometry.__proto_FMOD_System_LoadGeometry = GetFunction(DLL_FMOD, "FMOD_System_LoadGeometry")
  Global FMOD_System_GetGeometryOcclusion.__proto_FMOD_System_GetGeometryOcclusion = GetFunction(DLL_FMOD, "FMOD_System_GetGeometryOcclusion")
  Global FMOD_System_SetNetworkProxy.__proto_FMOD_System_SetNetworkProxy = GetFunction(DLL_FMOD, "FMOD_System_SetNetworkProxy")
  Global FMOD_System_GetNetworkProxy.__proto_FMOD_System_GetNetworkProxy = GetFunction(DLL_FMOD, "FMOD_System_GetNetworkProxy")
  Global FMOD_System_SetNetworkTimeout.__proto_FMOD_System_SetNetworkTimeout = GetFunction(DLL_FMOD, "FMOD_System_SetNetworkTimeout")
  Global FMOD_System_GetNetworkTimeout.__proto_FMOD_System_GetNetworkTimeout = GetFunction(DLL_FMOD, "FMOD_System_GetNetworkTimeout")
  Global FMOD_System_SetUserData.__proto_FMOD_System_SetUserData = GetFunction(DLL_FMOD, "FMOD_System_SetUserData")
  Global FMOD_System_GetUserData.__proto_FMOD_System_GetUserData = GetFunction(DLL_FMOD, "FMOD_System_GetUserData")
  Global FMOD_Sound_Release.__proto_FMOD_Sound_Release = GetFunction(DLL_FMOD, "FMOD_Sound_Release")
  Global FMOD_Sound_GetSystemObject.__proto_FMOD_Sound_GetSystemObject = GetFunction(DLL_FMOD, "FMOD_Sound_GetSystemObject")
  Global FMOD_Sound_Lock.__proto_FMOD_Sound_Lock = GetFunction(DLL_FMOD, "FMOD_Sound_Lock")
  Global FMOD_Sound_Unlock.__proto_FMOD_Sound_Unlock = GetFunction(DLL_FMOD, "FMOD_Sound_Unlock")
  Global FMOD_Sound_SetDefaults.__proto_FMOD_Sound_SetDefaults = GetFunction(DLL_FMOD, "FMOD_Sound_SetDefaults")
  Global FMOD_Sound_GetDefaults.__proto_FMOD_Sound_GetDefaults = GetFunction(DLL_FMOD, "FMOD_Sound_GetDefaults")
  Global FMOD_Sound_Set3DMinMaxDistance.__proto_FMOD_Sound_Set3DMinMaxDistance = GetFunction(DLL_FMOD, "FMOD_Sound_Set3DMinMaxDistance")
  Global FMOD_Sound_Get3DMinMaxDistance.__proto_FMOD_Sound_Get3DMinMaxDistance = GetFunction(DLL_FMOD, "FMOD_Sound_Get3DMinMaxDistance")
  Global FMOD_Sound_Set3DConeSettings.__proto_FMOD_Sound_Set3DConeSettings = GetFunction(DLL_FMOD, "FMOD_Sound_Set3DConeSettings")
  Global FMOD_Sound_Get3DConeSettings.__proto_FMOD_Sound_Get3DConeSettings = GetFunction(DLL_FMOD, "FMOD_Sound_Get3DConeSettings")
  Global FMOD_Sound_Set3DCustomRolloff.__proto_FMOD_Sound_Set3DCustomRolloff = GetFunction(DLL_FMOD, "FMOD_Sound_Set3DCustomRolloff")
  Global FMOD_Sound_Get3DCustomRolloff.__proto_FMOD_Sound_Get3DCustomRolloff = GetFunction(DLL_FMOD, "FMOD_Sound_Get3DCustomRolloff")
  Global FMOD_Sound_SetSubSound.__proto_FMOD_Sound_SetSubSound = GetFunction(DLL_FMOD, "FMOD_Sound_SetSubSound")
  Global FMOD_Sound_GetSubSound.__proto_FMOD_Sound_GetSubSound = GetFunction(DLL_FMOD, "FMOD_Sound_GetSubSound")
  Global FMOD_Sound_GetSubSoundParent.__proto_FMOD_Sound_GetSubSoundParent = GetFunction(DLL_FMOD, "FMOD_Sound_GetSubSoundParent")
  Global FMOD_Sound_GetName.__proto_FMOD_Sound_GetName = GetFunction(DLL_FMOD, "FMOD_Sound_GetName")
  Global FMOD_Sound_GetLength.__proto_FMOD_Sound_GetLength = GetFunction(DLL_FMOD, "FMOD_Sound_GetLength")
  Global FMOD_Sound_GetFormat.__proto_FMOD_Sound_GetFormat = GetFunction(DLL_FMOD, "FMOD_Sound_GetFormat")
  Global FMOD_Sound_GetNumSubSounds.__proto_FMOD_Sound_GetNumSubSounds = GetFunction(DLL_FMOD, "FMOD_Sound_GetNumSubSounds")
  Global FMOD_Sound_GetNumTags.__proto_FMOD_Sound_GetNumTags = GetFunction(DLL_FMOD, "FMOD_Sound_GetNumTags")
  Global FMOD_Sound_GetTag.__proto_FMOD_Sound_GetTag = GetFunction(DLL_FMOD, "FMOD_Sound_GetTag")
  Global FMOD_Sound_GetOpenState.__proto_FMOD_Sound_GetOpenState = GetFunction(DLL_FMOD, "FMOD_Sound_GetOpenState")
  Global FMOD_Sound_ReadData.__proto_FMOD_Sound_ReadData = GetFunction(DLL_FMOD, "FMOD_Sound_ReadData")
  Global FMOD_Sound_SeekData.__proto_FMOD_Sound_SeekData = GetFunction(DLL_FMOD, "FMOD_Sound_SeekData")
  Global FMOD_Sound_SetSoundGroup.__proto_FMOD_Sound_SetSoundGroup = GetFunction(DLL_FMOD, "FMOD_Sound_SetSoundGroup")
  Global FMOD_Sound_GetSoundGroup.__proto_FMOD_Sound_GetSoundGroup = GetFunction(DLL_FMOD, "FMOD_Sound_GetSoundGroup")
  Global FMOD_Sound_GetNumSyncPoints.__proto_FMOD_Sound_GetNumSyncPoints = GetFunction(DLL_FMOD, "FMOD_Sound_GetNumSyncPoints")
  Global FMOD_Sound_GetSyncPoint.__proto_FMOD_Sound_GetSyncPoint = GetFunction(DLL_FMOD, "FMOD_Sound_GetSyncPoint")
  Global FMOD_Sound_GetSyncPointInfo.__proto_FMOD_Sound_GetSyncPointInfo = GetFunction(DLL_FMOD, "FMOD_Sound_GetSyncPointInfo")
  Global FMOD_Sound_AddSyncPoint.__proto_FMOD_Sound_AddSyncPoint = GetFunction(DLL_FMOD, "FMOD_Sound_AddSyncPoint")
  Global FMOD_Sound_DeleteSyncPoint.__proto_FMOD_Sound_DeleteSyncPoint = GetFunction(DLL_FMOD, "FMOD_Sound_DeleteSyncPoint")
  Global FMOD_Sound_SetMode.__proto_FMOD_Sound_SetMode = GetFunction(DLL_FMOD, "FMOD_Sound_SetMode")
  Global FMOD_Sound_GetMode.__proto_FMOD_Sound_GetMode = GetFunction(DLL_FMOD, "FMOD_Sound_GetMode")
  Global FMOD_Sound_SetLoopCount.__proto_FMOD_Sound_SetLoopCount = GetFunction(DLL_FMOD, "FMOD_Sound_SetLoopCount")
  Global FMOD_Sound_GetLoopCount.__proto_FMOD_Sound_GetLoopCount = GetFunction(DLL_FMOD, "FMOD_Sound_GetLoopCount")
  Global FMOD_Sound_SetLoopPoints.__proto_FMOD_Sound_SetLoopPoints = GetFunction(DLL_FMOD, "FMOD_Sound_SetLoopPoints")
  Global FMOD_Sound_GetLoopPoints.__proto_FMOD_Sound_GetLoopPoints = GetFunction(DLL_FMOD, "FMOD_Sound_GetLoopPoints")
  Global FMOD_Sound_GetMusicNumChannels.__proto_FMOD_Sound_GetMusicNumChannels = GetFunction(DLL_FMOD, "FMOD_Sound_GetMusicNumChannels")
  Global FMOD_Sound_SetMusicChannelVolume.__proto_FMOD_Sound_SetMusicChannelVolume = GetFunction(DLL_FMOD, "FMOD_Sound_SetMusicChannelVolume")
  Global FMOD_Sound_GetMusicChannelVolume.__proto_FMOD_Sound_GetMusicChannelVolume = GetFunction(DLL_FMOD, "FMOD_Sound_GetMusicChannelVolume")
  Global FMOD_Sound_SetMusicSpeed.__proto_FMOD_Sound_SetMusicSpeed = GetFunction(DLL_FMOD, "FMOD_Sound_SetMusicSpeed")
  Global FMOD_Sound_GetMusicSpeed.__proto_FMOD_Sound_GetMusicSpeed = GetFunction(DLL_FMOD, "FMOD_Sound_GetMusicSpeed")
  Global FMOD_Sound_SetUserData.__proto_FMOD_Sound_SetUserData = GetFunction(DLL_FMOD, "FMOD_Sound_SetUserData")
  Global FMOD_Sound_GetUserData.__proto_FMOD_Sound_GetUserData = GetFunction(DLL_FMOD, "FMOD_Sound_GetUserData")
  Global FMOD_Channel_GetSystemObject.__proto_FMOD_Channel_GetSystemObject = GetFunction(DLL_FMOD, "FMOD_Channel_GetSystemObject")
  Global FMOD_Channel_Stop.__proto_FMOD_Channel_Stop = GetFunction(DLL_FMOD, "FMOD_Channel_Stop")
  Global FMOD_Channel_SetPaused.__proto_FMOD_Channel_SetPaused = GetFunction(DLL_FMOD, "FMOD_Channel_SetPaused")
  Global FMOD_Channel_GetPaused.__proto_FMOD_Channel_GetPaused = GetFunction(DLL_FMOD, "FMOD_Channel_GetPaused")
  Global FMOD_Channel_SetVolume.__proto_FMOD_Channel_SetVolume = GetFunction(DLL_FMOD, "FMOD_Channel_SetVolume")
  Global FMOD_Channel_GetVolume.__proto_FMOD_Channel_GetVolume = GetFunction(DLL_FMOD, "FMOD_Channel_GetVolume")
  Global FMOD_Channel_SetVolumeRamp.__proto_FMOD_Channel_SetVolumeRamp = GetFunction(DLL_FMOD, "FMOD_Channel_SetVolumeRamp")
  Global FMOD_Channel_GetVolumeRamp.__proto_FMOD_Channel_GetVolumeRamp = GetFunction(DLL_FMOD, "FMOD_Channel_GetVolumeRamp")
  Global FMOD_Channel_GetAudibility.__proto_FMOD_Channel_GetAudibility = GetFunction(DLL_FMOD, "FMOD_Channel_GetAudibility")
  Global FMOD_Channel_SetPitch.__proto_FMOD_Channel_SetPitch = GetFunction(DLL_FMOD, "FMOD_Channel_SetPitch")
  Global FMOD_Channel_GetPitch.__proto_FMOD_Channel_GetPitch = GetFunction(DLL_FMOD, "FMOD_Channel_GetPitch")
  Global FMOD_Channel_SetMute.__proto_FMOD_Channel_SetMute = GetFunction(DLL_FMOD, "FMOD_Channel_SetMute")
  Global FMOD_Channel_GetMute.__proto_FMOD_Channel_GetMute = GetFunction(DLL_FMOD, "FMOD_Channel_GetMute")
  Global FMOD_Channel_SetReverbProperties.__proto_FMOD_Channel_SetReverbProperties = GetFunction(DLL_FMOD, "FMOD_Channel_SetReverbProperties")
  Global FMOD_Channel_GetReverbProperties.__proto_FMOD_Channel_GetReverbProperties = GetFunction(DLL_FMOD, "FMOD_Channel_GetReverbProperties")
  Global FMOD_Channel_SetLowPassGain.__proto_FMOD_Channel_SetLowPassGain = GetFunction(DLL_FMOD, "FMOD_Channel_SetLowPassGain")
  Global FMOD_Channel_GetLowPassGain.__proto_FMOD_Channel_GetLowPassGain = GetFunction(DLL_FMOD, "FMOD_Channel_GetLowPassGain")
  Global FMOD_Channel_SetMode.__proto_FMOD_Channel_SetMode = GetFunction(DLL_FMOD, "FMOD_Channel_SetMode")
  Global FMOD_Channel_GetMode.__proto_FMOD_Channel_GetMode = GetFunction(DLL_FMOD, "FMOD_Channel_GetMode")
  Global FMOD_Channel_SetCallback.__proto_FMOD_Channel_SetCallback = GetFunction(DLL_FMOD, "FMOD_Channel_SetCallback")
  Global FMOD_Channel_IsPlaying.__proto_FMOD_Channel_IsPlaying = GetFunction(DLL_FMOD, "FMOD_Channel_IsPlaying")
  Global FMOD_Channel_SetPan.__proto_FMOD_Channel_SetPan = GetFunction(DLL_FMOD, "FMOD_Channel_SetPan")
  Global FMOD_Channel_SetMixLevelsOutput.__proto_FMOD_Channel_SetMixLevelsOutput = GetFunction(DLL_FMOD, "FMOD_Channel_SetMixLevelsOutput")
  Global FMOD_Channel_SetMixLevelsInput.__proto_FMOD_Channel_SetMixLevelsInput = GetFunction(DLL_FMOD, "FMOD_Channel_SetMixLevelsInput")
  Global FMOD_Channel_SetMixMatrix.__proto_FMOD_Channel_SetMixMatrix = GetFunction(DLL_FMOD, "FMOD_Channel_SetMixMatrix")
  Global FMOD_Channel_GetMixMatrix.__proto_FMOD_Channel_GetMixMatrix = GetFunction(DLL_FMOD, "FMOD_Channel_GetMixMatrix")
  Global FMOD_Channel_GetDSPClock.__proto_FMOD_Channel_GetDSPClock = GetFunction(DLL_FMOD, "FMOD_Channel_GetDSPClock")
  Global FMOD_Channel_SetDelay.__proto_FMOD_Channel_SetDelay = GetFunction(DLL_FMOD, "FMOD_Channel_SetDelay")
  Global FMOD_Channel_GetDelay.__proto_FMOD_Channel_GetDelay = GetFunction(DLL_FMOD, "FMOD_Channel_GetDelay")
  Global FMOD_Channel_AddFadePoint.__proto_FMOD_Channel_AddFadePoint = GetFunction(DLL_FMOD, "FMOD_Channel_AddFadePoint")
  Global FMOD_Channel_SetFadePointRamp.__proto_FMOD_Channel_SetFadePointRamp = GetFunction(DLL_FMOD, "FMOD_Channel_SetFadePointRamp")
  Global FMOD_Channel_RemoveFadePoints.__proto_FMOD_Channel_RemoveFadePoints = GetFunction(DLL_FMOD, "FMOD_Channel_RemoveFadePoints")
  Global FMOD_Channel_GetFadePoints.__proto_FMOD_Channel_GetFadePoints = GetFunction(DLL_FMOD, "FMOD_Channel_GetFadePoints")
  Global FMOD_Channel_GetDSP.__proto_FMOD_Channel_GetDSP = GetFunction(DLL_FMOD, "FMOD_Channel_GetDSP")
  Global FMOD_Channel_AddDSP.__proto_FMOD_Channel_AddDSP = GetFunction(DLL_FMOD, "FMOD_Channel_AddDSP")
  Global FMOD_Channel_RemoveDSP.__proto_FMOD_Channel_RemoveDSP = GetFunction(DLL_FMOD, "FMOD_Channel_RemoveDSP")
  Global FMOD_Channel_GetNumDSPs.__proto_FMOD_Channel_GetNumDSPs = GetFunction(DLL_FMOD, "FMOD_Channel_GetNumDSPs")
  Global FMOD_Channel_SetDSPIndex.__proto_FMOD_Channel_SetDSPIndex = GetFunction(DLL_FMOD, "FMOD_Channel_SetDSPIndex")
  Global FMOD_Channel_GetDSPIndex.__proto_FMOD_Channel_GetDSPIndex = GetFunction(DLL_FMOD, "FMOD_Channel_GetDSPIndex")
  Global FMOD_Channel_OverridePanDSP.__proto_FMOD_Channel_OverridePanDSP = GetFunction(DLL_FMOD, "FMOD_Channel_OverridePanDSP")
  Global FMOD_Channel_Set3DAttributes.__proto_FMOD_Channel_Set3DAttributes = GetFunction(DLL_FMOD, "FMOD_Channel_Set3DAttributes")
  Global FMOD_Channel_Get3DAttributes.__proto_FMOD_Channel_Get3DAttributes = GetFunction(DLL_FMOD, "FMOD_Channel_Get3DAttributes")
  Global FMOD_Channel_Set3DMinMaxDistance.__proto_FMOD_Channel_Set3DMinMaxDistance = GetFunction(DLL_FMOD, "FMOD_Channel_Set3DMinMaxDistance")
  Global FMOD_Channel_Get3DMinMaxDistance.__proto_FMOD_Channel_Get3DMinMaxDistance = GetFunction(DLL_FMOD, "FMOD_Channel_Get3DMinMaxDistance")
  Global FMOD_Channel_Set3DConeSettings.__proto_FMOD_Channel_Set3DConeSettings = GetFunction(DLL_FMOD, "FMOD_Channel_Set3DConeSettings")
  Global FMOD_Channel_Get3DConeSettings.__proto_FMOD_Channel_Get3DConeSettings = GetFunction(DLL_FMOD, "FMOD_Channel_Get3DConeSettings")
  Global FMOD_Channel_Set3DConeOrientation.__proto_FMOD_Channel_Set3DConeOrientation = GetFunction(DLL_FMOD, "FMOD_Channel_Set3DConeOrientation")
  Global FMOD_Channel_Get3DConeOrientation.__proto_FMOD_Channel_Get3DConeOrientation = GetFunction(DLL_FMOD, "FMOD_Channel_Get3DConeOrientation")
  Global FMOD_Channel_Set3DCustomRolloff.__proto_FMOD_Channel_Set3DCustomRolloff = GetFunction(DLL_FMOD, "FMOD_Channel_Set3DCustomRolloff")
  Global FMOD_Channel_Get3DCustomRolloff.__proto_FMOD_Channel_Get3DCustomRolloff = GetFunction(DLL_FMOD, "FMOD_Channel_Get3DCustomRolloff")
  Global FMOD_Channel_Set3DOcclusion.__proto_FMOD_Channel_Set3DOcclusion = GetFunction(DLL_FMOD, "FMOD_Channel_Set3DOcclusion")
  Global FMOD_Channel_Get3DOcclusion.__proto_FMOD_Channel_Get3DOcclusion = GetFunction(DLL_FMOD, "FMOD_Channel_Get3DOcclusion")
  Global FMOD_Channel_Set3DSpread.__proto_FMOD_Channel_Set3DSpread = GetFunction(DLL_FMOD, "FMOD_Channel_Set3DSpread")
  Global FMOD_Channel_Get3DSpread.__proto_FMOD_Channel_Get3DSpread = GetFunction(DLL_FMOD, "FMOD_Channel_Get3DSpread")
  Global FMOD_Channel_Set3DLevel.__proto_FMOD_Channel_Set3DLevel = GetFunction(DLL_FMOD, "FMOD_Channel_Set3DLevel")
  Global FMOD_Channel_Get3DLevel.__proto_FMOD_Channel_Get3DLevel = GetFunction(DLL_FMOD, "FMOD_Channel_Get3DLevel")
  Global FMOD_Channel_Set3DDopplerLevel.__proto_FMOD_Channel_Set3DDopplerLevel = GetFunction(DLL_FMOD, "FMOD_Channel_Set3DDopplerLevel")
  Global FMOD_Channel_Get3DDopplerLevel.__proto_FMOD_Channel_Get3DDopplerLevel = GetFunction(DLL_FMOD, "FMOD_Channel_Get3DDopplerLevel")
  Global FMOD_Channel_Set3DDistanceFilter.__proto_FMOD_Channel_Set3DDistanceFilter = GetFunction(DLL_FMOD, "FMOD_Channel_Set3DDistanceFilter")
  Global FMOD_Channel_Get3DDistanceFilter.__proto_FMOD_Channel_Get3DDistanceFilter = GetFunction(DLL_FMOD, "FMOD_Channel_Get3DDistanceFilter")
  Global FMOD_Channel_SetUserData.__proto_FMOD_Channel_SetUserData = GetFunction(DLL_FMOD, "FMOD_Channel_SetUserData")
  Global FMOD_Channel_GetUserData.__proto_FMOD_Channel_GetUserData = GetFunction(DLL_FMOD, "FMOD_Channel_GetUserData")
  Global FMOD_Channel_SetFrequency.__proto_FMOD_Channel_SetFrequency = GetFunction(DLL_FMOD, "FMOD_Channel_SetFrequency")
  Global FMOD_Channel_GetFrequency.__proto_FMOD_Channel_GetFrequency = GetFunction(DLL_FMOD, "FMOD_Channel_GetFrequency")
  Global FMOD_Channel_SetPriority.__proto_FMOD_Channel_SetPriority = GetFunction(DLL_FMOD, "FMOD_Channel_SetPriority")
  Global FMOD_Channel_GetPriority.__proto_FMOD_Channel_GetPriority = GetFunction(DLL_FMOD, "FMOD_Channel_GetPriority")
  Global FMOD_Channel_SetPosition.__proto_FMOD_Channel_SetPosition = GetFunction(DLL_FMOD, "FMOD_Channel_SetPosition")
  Global FMOD_Channel_GetPosition.__proto_FMOD_Channel_GetPosition = GetFunction(DLL_FMOD, "FMOD_Channel_GetPosition")
  Global FMOD_Channel_SetChannelGroup.__proto_FMOD_Channel_SetChannelGroup = GetFunction(DLL_FMOD, "FMOD_Channel_SetChannelGroup")
  Global FMOD_Channel_GetChannelGroup.__proto_FMOD_Channel_GetChannelGroup = GetFunction(DLL_FMOD, "FMOD_Channel_GetChannelGroup")
  Global FMOD_Channel_SetLoopCount.__proto_FMOD_Channel_SetLoopCount = GetFunction(DLL_FMOD, "FMOD_Channel_SetLoopCount")
  Global FMOD_Channel_GetLoopCount.__proto_FMOD_Channel_GetLoopCount = GetFunction(DLL_FMOD, "FMOD_Channel_GetLoopCount")
  Global FMOD_Channel_SetLoopPoints.__proto_FMOD_Channel_SetLoopPoints = GetFunction(DLL_FMOD, "FMOD_Channel_SetLoopPoints")
  Global FMOD_Channel_GetLoopPoints.__proto_FMOD_Channel_GetLoopPoints = GetFunction(DLL_FMOD, "FMOD_Channel_GetLoopPoints")
  Global FMOD_Channel_IsVirtual.__proto_FMOD_Channel_IsVirtual = GetFunction(DLL_FMOD, "FMOD_Channel_IsVirtual")
  Global FMOD_Channel_GetCurrentSound.__proto_FMOD_Channel_GetCurrentSound = GetFunction(DLL_FMOD, "FMOD_Channel_GetCurrentSound")
  Global FMOD_Channel_GetIndex.__proto_FMOD_Channel_GetIndex = GetFunction(DLL_FMOD, "FMOD_Channel_GetIndex")
  Global FMOD_ChannelGroup_GetSystemObject.__proto_FMOD_ChannelGroup_GetSystemObject = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetSystemObject")
  Global FMOD_ChannelGroup_Stop.__proto_FMOD_ChannelGroup_Stop = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Stop")
  Global FMOD_ChannelGroup_SetPaused.__proto_FMOD_ChannelGroup_SetPaused = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_SetPaused")
  Global FMOD_ChannelGroup_GetPaused.__proto_FMOD_ChannelGroup_GetPaused = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetPaused")
  Global FMOD_ChannelGroup_SetVolume.__proto_FMOD_ChannelGroup_SetVolume = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_SetVolume")
  Global FMOD_ChannelGroup_GetVolume.__proto_FMOD_ChannelGroup_GetVolume = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetVolume")
  Global FMOD_ChannelGroup_SetVolumeRamp.__proto_FMOD_ChannelGroup_SetVolumeRamp = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_SetVolumeRamp")
  Global FMOD_ChannelGroup_GetVolumeRamp.__proto_FMOD_ChannelGroup_GetVolumeRamp = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetVolumeRamp")
  Global FMOD_ChannelGroup_GetAudibility.__proto_FMOD_ChannelGroup_GetAudibility = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetAudibility")
  Global FMOD_ChannelGroup_SetPitch.__proto_FMOD_ChannelGroup_SetPitch = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_SetPitch")
  Global FMOD_ChannelGroup_GetPitch.__proto_FMOD_ChannelGroup_GetPitch = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetPitch")
  Global FMOD_ChannelGroup_SetMute.__proto_FMOD_ChannelGroup_SetMute = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_SetMute")
  Global FMOD_ChannelGroup_GetMute.__proto_FMOD_ChannelGroup_GetMute = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetMute")
  Global FMOD_ChannelGroup_SetReverbProperties.__proto_FMOD_ChannelGroup_SetReverbProperties = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_SetReverbProperties")
  Global FMOD_ChannelGroup_GetReverbProperties.__proto_FMOD_ChannelGroup_GetReverbProperties = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetReverbProperties")
  Global FMOD_ChannelGroup_SetLowPassGain.__proto_FMOD_ChannelGroup_SetLowPassGain = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_SetLowPassGain")
  Global FMOD_ChannelGroup_GetLowPassGain.__proto_FMOD_ChannelGroup_GetLowPassGain = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetLowPassGain")
  Global FMOD_ChannelGroup_SetMode.__proto_FMOD_ChannelGroup_SetMode = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_SetMode")
  Global FMOD_ChannelGroup_GetMode.__proto_FMOD_ChannelGroup_GetMode = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetMode")
  Global FMOD_ChannelGroup_SetCallback.__proto_FMOD_ChannelGroup_SetCallback = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_SetCallback")
  Global FMOD_ChannelGroup_IsPlaying.__proto_FMOD_ChannelGroup_IsPlaying = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_IsPlaying")
  Global FMOD_ChannelGroup_SetPan.__proto_FMOD_ChannelGroup_SetPan = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_SetPan")
  Global FMOD_ChannelGroup_SetMixLevelsOutput.__proto_FMOD_ChannelGroup_SetMixLevelsOutput = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_SetMixLevelsOutput")
  Global FMOD_ChannelGroup_SetMixLevelsInput.__proto_FMOD_ChannelGroup_SetMixLevelsInput = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_SetMixLevelsInput")
  Global FMOD_ChannelGroup_SetMixMatrix.__proto_FMOD_ChannelGroup_SetMixMatrix = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_SetMixMatrix")
  Global FMOD_ChannelGroup_GetMixMatrix.__proto_FMOD_ChannelGroup_GetMixMatrix = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetMixMatrix")
  Global FMOD_ChannelGroup_GetDSPClock.__proto_FMOD_ChannelGroup_GetDSPClock = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetDSPClock")
  Global FMOD_ChannelGroup_SetDelay.__proto_FMOD_ChannelGroup_SetDelay = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_SetDelay")
  Global FMOD_ChannelGroup_GetDelay.__proto_FMOD_ChannelGroup_GetDelay = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetDelay")
  Global FMOD_ChannelGroup_AddFadePoint.__proto_FMOD_ChannelGroup_AddFadePoint = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_AddFadePoint")
  Global FMOD_ChannelGroup_SetFadePointRamp.__proto_FMOD_ChannelGroup_SetFadePointRamp = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_SetFadePointRamp")
  Global FMOD_ChannelGroup_RemoveFadePoints.__proto_FMOD_ChannelGroup_RemoveFadePoints = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_RemoveFadePoints")
  Global FMOD_ChannelGroup_GetFadePoints.__proto_FMOD_ChannelGroup_GetFadePoints = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetFadePoints")
  Global FMOD_ChannelGroup_GetDSP.__proto_FMOD_ChannelGroup_GetDSP = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetDSP")
  Global FMOD_ChannelGroup_AddDSP.__proto_FMOD_ChannelGroup_AddDSP = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_AddDSP")
  Global FMOD_ChannelGroup_RemoveDSP.__proto_FMOD_ChannelGroup_RemoveDSP = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_RemoveDSP")
  Global FMOD_ChannelGroup_GetNumDSPs.__proto_FMOD_ChannelGroup_GetNumDSPs = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetNumDSPs")
  Global FMOD_ChannelGroup_SetDSPIndex.__proto_FMOD_ChannelGroup_SetDSPIndex = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_SetDSPIndex")
  Global FMOD_ChannelGroup_GetDSPIndex.__proto_FMOD_ChannelGroup_GetDSPIndex = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetDSPIndex")
  Global FMOD_ChannelGroup_OverridePanDSP.__proto_FMOD_ChannelGroup_OverridePanDSP = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_OverridePanDSP")
  Global FMOD_ChannelGroup_Set3DAttributes.__proto_FMOD_ChannelGroup_Set3DAttributes = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Set3DAttributes")
  Global FMOD_ChannelGroup_Get3DAttributes.__proto_FMOD_ChannelGroup_Get3DAttributes = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Get3DAttributes")
  Global FMOD_ChannelGroup_Set3DMinMaxDistance.__proto_FMOD_ChannelGroup_Set3DMinMaxDistance = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Set3DMinMaxDistance")
  Global FMOD_ChannelGroup_Get3DMinMaxDistance.__proto_FMOD_ChannelGroup_Get3DMinMaxDistance = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Get3DMinMaxDistance")
  Global FMOD_ChannelGroup_Set3DConeSettings.__proto_FMOD_ChannelGroup_Set3DConeSettings = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Set3DConeSettings")
  Global FMOD_ChannelGroup_Get3DConeSettings.__proto_FMOD_ChannelGroup_Get3DConeSettings = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Get3DConeSettings")
  Global FMOD_ChannelGroup_Set3DConeOrientation.__proto_FMOD_ChannelGroup_Set3DConeOrientation = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Set3DConeOrientation")
  Global FMOD_ChannelGroup_Get3DConeOrientation.__proto_FMOD_ChannelGroup_Get3DConeOrientation = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Get3DConeOrientation")
  Global FMOD_ChannelGroup_Set3DCustomRolloff.__proto_FMOD_ChannelGroup_Set3DCustomRolloff = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Set3DCustomRolloff")
  Global FMOD_ChannelGroup_Get3DCustomRolloff.__proto_FMOD_ChannelGroup_Get3DCustomRolloff = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Get3DCustomRolloff")
  Global FMOD_ChannelGroup_Set3DOcclusion.__proto_FMOD_ChannelGroup_Set3DOcclusion = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Set3DOcclusion")
  Global FMOD_ChannelGroup_Get3DOcclusion.__proto_FMOD_ChannelGroup_Get3DOcclusion = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Get3DOcclusion")
  Global FMOD_ChannelGroup_Set3DSpread.__proto_FMOD_ChannelGroup_Set3DSpread = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Set3DSpread")
  Global FMOD_ChannelGroup_Get3DSpread.__proto_FMOD_ChannelGroup_Get3DSpread = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Get3DSpread")
  Global FMOD_ChannelGroup_Set3DLevel.__proto_FMOD_ChannelGroup_Set3DLevel = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Set3DLevel")
  Global FMOD_ChannelGroup_Get3DLevel.__proto_FMOD_ChannelGroup_Get3DLevel = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Get3DLevel")
  Global FMOD_ChannelGroup_Set3DDopplerLevel.__proto_FMOD_ChannelGroup_Set3DDopplerLevel = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Set3DDopplerLevel")
  Global FMOD_ChannelGroup_Get3DDopplerLevel.__proto_FMOD_ChannelGroup_Get3DDopplerLevel = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Get3DDopplerLevel")
  Global FMOD_ChannelGroup_Set3DDistanceFilter.__proto_FMOD_ChannelGroup_Set3DDistanceFilter = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Set3DDistanceFilter")
  Global FMOD_ChannelGroup_Get3DDistanceFilter.__proto_FMOD_ChannelGroup_Get3DDistanceFilter = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Get3DDistanceFilter")
  Global FMOD_ChannelGroup_SetUserData.__proto_FMOD_ChannelGroup_SetUserData = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_SetUserData")
  Global FMOD_ChannelGroup_GetUserData.__proto_FMOD_ChannelGroup_GetUserData = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetUserData")
  Global FMOD_ChannelGroup_Release.__proto_FMOD_ChannelGroup_Release = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_Release")
  Global FMOD_ChannelGroup_AddGroup.__proto_FMOD_ChannelGroup_AddGroup = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_AddGroup")
  Global FMOD_ChannelGroup_GetNumGroups.__proto_FMOD_ChannelGroup_GetNumGroups = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetNumGroups")
  Global FMOD_ChannelGroup_GetGroup.__proto_FMOD_ChannelGroup_GetGroup = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetGroup")
  Global FMOD_ChannelGroup_GetParentGroup.__proto_FMOD_ChannelGroup_GetParentGroup = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetParentGroup")
  Global FMOD_ChannelGroup_GetName.__proto_FMOD_ChannelGroup_GetName = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetName")
  Global FMOD_ChannelGroup_GetNumChannels.__proto_FMOD_ChannelGroup_GetNumChannels = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetNumChannels")
  Global FMOD_ChannelGroup_GetChannel.__proto_FMOD_ChannelGroup_GetChannel = GetFunction(DLL_FMOD, "FMOD_ChannelGroup_GetChannel")
  Global FMOD_SoundGroup_Release.__proto_FMOD_SoundGroup_Release = GetFunction(DLL_FMOD, "FMOD_SoundGroup_Release")
  Global FMOD_SoundGroup_GetSystemObject.__proto_FMOD_SoundGroup_GetSystemObject = GetFunction(DLL_FMOD, "FMOD_SoundGroup_GetSystemObject")
  Global FMOD_SoundGroup_SetMaxAudible.__proto_FMOD_SoundGroup_SetMaxAudible = GetFunction(DLL_FMOD, "FMOD_SoundGroup_SetMaxAudible")
  Global FMOD_SoundGroup_GetMaxAudible.__proto_FMOD_SoundGroup_GetMaxAudible = GetFunction(DLL_FMOD, "FMOD_SoundGroup_GetMaxAudible")
  Global FMOD_SoundGroup_SetMaxAudibleBehavior.__proto_FMOD_SoundGroup_SetMaxAudibleBehavior = GetFunction(DLL_FMOD, "FMOD_SoundGroup_SetMaxAudibleBehavior")
  Global FMOD_SoundGroup_GetMaxAudibleBehavior.__proto_FMOD_SoundGroup_GetMaxAudibleBehavior = GetFunction(DLL_FMOD, "FMOD_SoundGroup_GetMaxAudibleBehavior")
  Global FMOD_SoundGroup_SetMuteFadeSpeed.__proto_FMOD_SoundGroup_SetMuteFadeSpeed = GetFunction(DLL_FMOD, "FMOD_SoundGroup_SetMuteFadeSpeed")
  Global FMOD_SoundGroup_GetMuteFadeSpeed.__proto_FMOD_SoundGroup_GetMuteFadeSpeed = GetFunction(DLL_FMOD, "FMOD_SoundGroup_GetMuteFadeSpeed")
  Global FMOD_SoundGroup_SetVolume.__proto_FMOD_SoundGroup_SetVolume = GetFunction(DLL_FMOD, "FMOD_SoundGroup_SetVolume")
  Global FMOD_SoundGroup_GetVolume.__proto_FMOD_SoundGroup_GetVolume = GetFunction(DLL_FMOD, "FMOD_SoundGroup_GetVolume")
  Global FMOD_SoundGroup_Stop.__proto_FMOD_SoundGroup_Stop = GetFunction(DLL_FMOD, "FMOD_SoundGroup_Stop")
  Global FMOD_SoundGroup_GetName.__proto_FMOD_SoundGroup_GetName = GetFunction(DLL_FMOD, "FMOD_SoundGroup_GetName")
  Global FMOD_SoundGroup_GetNumSounds.__proto_FMOD_SoundGroup_GetNumSounds = GetFunction(DLL_FMOD, "FMOD_SoundGroup_GetNumSounds")
  Global FMOD_SoundGroup_GetSound.__proto_FMOD_SoundGroup_GetSound = GetFunction(DLL_FMOD, "FMOD_SoundGroup_GetSound")
  Global FMOD_SoundGroup_GetNumPlaying.__proto_FMOD_SoundGroup_GetNumPlaying = GetFunction(DLL_FMOD, "FMOD_SoundGroup_GetNumPlaying")
  Global FMOD_SoundGroup_SetUserData.__proto_FMOD_SoundGroup_SetUserData = GetFunction(DLL_FMOD, "FMOD_SoundGroup_SetUserData")
  Global FMOD_SoundGroup_GetUserData.__proto_FMOD_SoundGroup_GetUserData = GetFunction(DLL_FMOD, "FMOD_SoundGroup_GetUserData")
  Global FMOD_DSP_Release.__proto_FMOD_DSP_Release = GetFunction(DLL_FMOD, "FMOD_DSP_Release")
  Global FMOD_DSP_GetSystemObject.__proto_FMOD_DSP_GetSystemObject = GetFunction(DLL_FMOD, "FMOD_DSP_GetSystemObject")
  Global FMOD_DSP_AddInput.__proto_FMOD_DSP_AddInput = GetFunction(DLL_FMOD, "FMOD_DSP_AddInput")
  Global FMOD_DSP_DisconnectFrom.__proto_FMOD_DSP_DisconnectFrom = GetFunction(DLL_FMOD, "FMOD_DSP_DisconnectFrom")
  Global FMOD_DSP_DisconnectAll.__proto_FMOD_DSP_DisconnectAll = GetFunction(DLL_FMOD, "FMOD_DSP_DisconnectAll")
  Global FMOD_DSP_GetNumInputs.__proto_FMOD_DSP_GetNumInputs = GetFunction(DLL_FMOD, "FMOD_DSP_GetNumInputs")
  Global FMOD_DSP_GetNumOutputs.__proto_FMOD_DSP_GetNumOutputs = GetFunction(DLL_FMOD, "FMOD_DSP_GetNumOutputs")
  Global FMOD_DSP_GetInput.__proto_FMOD_DSP_GetInput = GetFunction(DLL_FMOD, "FMOD_DSP_GetInput")
  Global FMOD_DSP_GetOutput.__proto_FMOD_DSP_GetOutput = GetFunction(DLL_FMOD, "FMOD_DSP_GetOutput")
  Global FMOD_DSP_SetActive.__proto_FMOD_DSP_SetActive = GetFunction(DLL_FMOD, "FMOD_DSP_SetActive")
  Global FMOD_DSP_GetActive.__proto_FMOD_DSP_GetActive = GetFunction(DLL_FMOD, "FMOD_DSP_GetActive")
  Global FMOD_DSP_SetBypass.__proto_FMOD_DSP_SetBypass = GetFunction(DLL_FMOD, "FMOD_DSP_SetBypass")
  Global FMOD_DSP_GetBypass.__proto_FMOD_DSP_GetBypass = GetFunction(DLL_FMOD, "FMOD_DSP_GetBypass")
  Global FMOD_DSP_SetWetDryMix.__proto_FMOD_DSP_SetWetDryMix = GetFunction(DLL_FMOD, "FMOD_DSP_SetWetDryMix")
  Global FMOD_DSP_GetWetDryMix.__proto_FMOD_DSP_GetWetDryMix = GetFunction(DLL_FMOD, "FMOD_DSP_GetWetDryMix")
  Global FMOD_DSP_SetChannelFormat.__proto_FMOD_DSP_SetChannelFormat = GetFunction(DLL_FMOD, "FMOD_DSP_SetChannelFormat")
  Global FMOD_DSP_GetChannelFormat.__proto_FMOD_DSP_GetChannelFormat = GetFunction(DLL_FMOD, "FMOD_DSP_GetChannelFormat")
  Global FMOD_DSP_GetOutputChannelFormat.__proto_FMOD_DSP_GetOutputChannelFormat = GetFunction(DLL_FMOD, "FMOD_DSP_GetOutputChannelFormat")
  Global FMOD_DSP_Reset.__proto_FMOD_DSP_Reset = GetFunction(DLL_FMOD, "FMOD_DSP_Reset")
  Global FMOD_DSP_SetParameterFloat.__proto_FMOD_DSP_SetParameterFloat = GetFunction(DLL_FMOD, "FMOD_DSP_SetParameterFloat")
  Global FMOD_DSP_SetParameterInt.__proto_FMOD_DSP_SetParameterInt = GetFunction(DLL_FMOD, "FMOD_DSP_SetParameterInt")
  Global FMOD_DSP_SetParameterBool.__proto_FMOD_DSP_SetParameterBool = GetFunction(DLL_FMOD, "FMOD_DSP_SetParameterBool")
  Global FMOD_DSP_SetParameterData.__proto_FMOD_DSP_SetParameterData = GetFunction(DLL_FMOD, "FMOD_DSP_SetParameterData")
  Global FMOD_DSP_GetParameterFloat.__proto_FMOD_DSP_GetParameterFloat = GetFunction(DLL_FMOD, "FMOD_DSP_GetParameterFloat")
  Global FMOD_DSP_GetParameterInt.__proto_FMOD_DSP_GetParameterInt = GetFunction(DLL_FMOD, "FMOD_DSP_GetParameterInt")
  Global FMOD_DSP_GetParameterBool.__proto_FMOD_DSP_GetParameterBool = GetFunction(DLL_FMOD, "FMOD_DSP_GetParameterBool")
  Global FMOD_DSP_GetParameterData.__proto_FMOD_DSP_GetParameterData = GetFunction(DLL_FMOD, "FMOD_DSP_GetParameterData")
  Global FMOD_DSP_GetNumParameters.__proto_FMOD_DSP_GetNumParameters = GetFunction(DLL_FMOD, "FMOD_DSP_GetNumParameters")
  Global FMOD_DSP_GetParameterInfo.__proto_FMOD_DSP_GetParameterInfo = GetFunction(DLL_FMOD, "FMOD_DSP_GetParameterInfo")
  Global FMOD_DSP_GetDataParameterIndex.__proto_FMOD_DSP_GetDataParameterIndex = GetFunction(DLL_FMOD, "FMOD_DSP_GetDataParameterIndex")
  Global FMOD_DSP_ShowConfigDialog.__proto_FMOD_DSP_ShowConfigDialog = GetFunction(DLL_FMOD, "FMOD_DSP_ShowConfigDialog")
  Global FMOD_DSP_GetInfo.__proto_FMOD_DSP_GetInfo = GetFunction(DLL_FMOD, "FMOD_DSP_GetInfo")
  Global FMOD_DSP_GetType.__proto_FMOD_DSP_GetType = GetFunction(DLL_FMOD, "FMOD_DSP_GetType")
  Global FMOD_DSP_GetIdle.__proto_FMOD_DSP_GetIdle = GetFunction(DLL_FMOD, "FMOD_DSP_GetIdle")
  Global FMOD_DSP_SetUserData.__proto_FMOD_DSP_SetUserData = GetFunction(DLL_FMOD, "FMOD_DSP_SetUserData")
  Global FMOD_DSP_GetUserData.__proto_FMOD_DSP_GetUserData = GetFunction(DLL_FMOD, "FMOD_DSP_GetUserData")
  Global FMOD_DSP_SetMeteringEnabled.__proto_FMOD_DSP_SetMeteringEnabled = GetFunction(DLL_FMOD, "FMOD_DSP_SetMeteringEnabled")
  Global FMOD_DSP_GetMeteringEnabled.__proto_FMOD_DSP_GetMeteringEnabled = GetFunction(DLL_FMOD, "FMOD_DSP_GetMeteringEnabled")
  Global FMOD_DSP_GetMeteringInfo.__proto_FMOD_DSP_GetMeteringInfo = GetFunction(DLL_FMOD, "FMOD_DSP_GetMeteringInfo")
  Global FMOD_DSPConnection_GetInput.__proto_FMOD_DSPConnection_GetInput = GetFunction(DLL_FMOD, "FMOD_DSPConnection_GetInput")
  Global FMOD_DSPConnection_GetOutput.__proto_FMOD_DSPConnection_GetOutput = GetFunction(DLL_FMOD, "FMOD_DSPConnection_GetOutput")
  Global FMOD_DSPConnection_SetMix.__proto_FMOD_DSPConnection_SetMix = GetFunction(DLL_FMOD, "FMOD_DSPConnection_SetMix")
  Global FMOD_DSPConnection_GetMix.__proto_FMOD_DSPConnection_GetMix = GetFunction(DLL_FMOD, "FMOD_DSPConnection_GetMix")
  Global FMOD_DSPConnection_SetMixMatrix.__proto_FMOD_DSPConnection_SetMixMatrix = GetFunction(DLL_FMOD, "FMOD_DSPConnection_SetMixMatrix")
  Global FMOD_DSPConnection_GetMixMatrix.__proto_FMOD_DSPConnection_GetMixMatrix = GetFunction(DLL_FMOD, "FMOD_DSPConnection_GetMixMatrix")
  Global FMOD_DSPConnection_GetType.__proto_FMOD_DSPConnection_GetType = GetFunction(DLL_FMOD, "FMOD_DSPConnection_GetType")
  Global FMOD_DSPConnection_SetUserData.__proto_FMOD_DSPConnection_SetUserData = GetFunction(DLL_FMOD, "FMOD_DSPConnection_SetUserData")
  Global FMOD_DSPConnection_GetUserData.__proto_FMOD_DSPConnection_GetUserData = GetFunction(DLL_FMOD, "FMOD_DSPConnection_GetUserData")
  Global FMOD_Geometry_Release.__proto_FMOD_Geometry_Release = GetFunction(DLL_FMOD, "FMOD_Geometry_Release")
  Global FMOD_Geometry_AddPolygon.__proto_FMOD_Geometry_AddPolygon = GetFunction(DLL_FMOD, "FMOD_Geometry_AddPolygon")
  Global FMOD_Geometry_GetNumPolygons.__proto_FMOD_Geometry_GetNumPolygons = GetFunction(DLL_FMOD, "FMOD_Geometry_GetNumPolygons")
  Global FMOD_Geometry_GetMaxPolygons.__proto_FMOD_Geometry_GetMaxPolygons = GetFunction(DLL_FMOD, "FMOD_Geometry_GetMaxPolygons")
  Global FMOD_Geometry_GetPolygonNumVertices.__proto_FMOD_Geometry_GetPolygonNumVertices = GetFunction(DLL_FMOD, "FMOD_Geometry_GetPolygonNumVertices")
  Global FMOD_Geometry_SetPolygonVertex.__proto_FMOD_Geometry_SetPolygonVertex = GetFunction(DLL_FMOD, "FMOD_Geometry_SetPolygonVertex")
  Global FMOD_Geometry_GetPolygonVertex.__proto_FMOD_Geometry_GetPolygonVertex = GetFunction(DLL_FMOD, "FMOD_Geometry_GetPolygonVertex")
  Global FMOD_Geometry_SetPolygonAttributes.__proto_FMOD_Geometry_SetPolygonAttributes = GetFunction(DLL_FMOD, "FMOD_Geometry_SetPolygonAttributes")
  Global FMOD_Geometry_GetPolygonAttributes.__proto_FMOD_Geometry_GetPolygonAttributes = GetFunction(DLL_FMOD, "FMOD_Geometry_GetPolygonAttributes")
  Global FMOD_Geometry_SetActive.__proto_FMOD_Geometry_SetActive = GetFunction(DLL_FMOD, "FMOD_Geometry_SetActive")
  Global FMOD_Geometry_GetActive.__proto_FMOD_Geometry_GetActive = GetFunction(DLL_FMOD, "FMOD_Geometry_GetActive")
  Global FMOD_Geometry_SetRotation.__proto_FMOD_Geometry_SetRotation = GetFunction(DLL_FMOD, "FMOD_Geometry_SetRotation")
  Global FMOD_Geometry_GetRotation.__proto_FMOD_Geometry_GetRotation = GetFunction(DLL_FMOD, "FMOD_Geometry_GetRotation")
  Global FMOD_Geometry_SetPosition.__proto_FMOD_Geometry_SetPosition = GetFunction(DLL_FMOD, "FMOD_Geometry_SetPosition")
  Global FMOD_Geometry_GetPosition.__proto_FMOD_Geometry_GetPosition = GetFunction(DLL_FMOD, "FMOD_Geometry_GetPosition")
  Global FMOD_Geometry_SetScale.__proto_FMOD_Geometry_SetScale = GetFunction(DLL_FMOD, "FMOD_Geometry_SetScale")
  Global FMOD_Geometry_GetScale.__proto_FMOD_Geometry_GetScale = GetFunction(DLL_FMOD, "FMOD_Geometry_GetScale")
  Global FMOD_Geometry_Save.__proto_FMOD_Geometry_Save = GetFunction(DLL_FMOD, "FMOD_Geometry_Save")
  Global FMOD_Geometry_SetUserData.__proto_FMOD_Geometry_SetUserData = GetFunction(DLL_FMOD, "FMOD_Geometry_SetUserData")
  Global FMOD_Geometry_GetUserData.__proto_FMOD_Geometry_GetUserData = GetFunction(DLL_FMOD, "FMOD_Geometry_GetUserData")
  Global FMOD_Reverb3D_Release.__proto_FMOD_Reverb3D_Release = GetFunction(DLL_FMOD, "FMOD_Reverb3D_Release")
  Global FMOD_Reverb3D_Set3DAttributes.__proto_FMOD_Reverb3D_Set3DAttributes = GetFunction(DLL_FMOD, "FMOD_Reverb3D_Set3DAttributes")
  Global FMOD_Reverb3D_Get3DAttributes.__proto_FMOD_Reverb3D_Get3DAttributes = GetFunction(DLL_FMOD, "FMOD_Reverb3D_Get3DAttributes")
  Global FMOD_Reverb3D_SetProperties.__proto_FMOD_Reverb3D_SetProperties = GetFunction(DLL_FMOD, "FMOD_Reverb3D_SetProperties")
  Global FMOD_Reverb3D_GetProperties.__proto_FMOD_Reverb3D_GetProperties = GetFunction(DLL_FMOD, "FMOD_Reverb3D_GetProperties")
  Global FMOD_Reverb3D_SetActive.__proto_FMOD_Reverb3D_SetActive = GetFunction(DLL_FMOD, "FMOD_Reverb3D_SetActive")
  Global FMOD_Reverb3D_GetActive.__proto_FMOD_Reverb3D_GetActive = GetFunction(DLL_FMOD, "FMOD_Reverb3D_GetActive")
  Global FMOD_Reverb3D_SetUserData.__proto_FMOD_Reverb3D_SetUserData = GetFunction(DLL_FMOD, "FMOD_Reverb3D_SetUserData")
  Global FMOD_Reverb3D_GetUserData.__proto_FMOD_Reverb3D_GetUserData = GetFunction(DLL_FMOD, "FMOD_Reverb3D_GetUserData")
EndProcedure

Procedure FMOD_Dispose()
  Debug "FMOD Closing"
  CloseLibrary(DLL_FMOD)
EndProcedure
; IDE Options = PureBasic 5.71 LTS (Windows - x86)
; CursorPosition = 7
; Folding = -
; EnableXP