;==============================================================================
; ** DevIL.pb
;------------------------------------------------------------------------------
;  This module represents a DevIL header to import Development Image Library.
;  http://00laboratories.com/
;==============================================================================

;--------------------------------------------------------------------------
; * DevIL Constants
;--------------------------------------------------------------------------
#IL_FALSE = 0
#IL_TRUE  = 1
;--------------------------------------------------------------------------
; * Data Formats
;--------------------------------------------------------------------------
#IL_COLOUR_INDEX    = $1900
#IL_COLOR_INDEX     = $1900
#IL_ALPHA           = $1906
#IL_RGB             = $1907
#IL_RGBA            = $1908
#IL_BGR             = $80E0
#IL_BGRA            = $80E1
#IL_LUMINANCE       = $1909
#IL_LUMINANCE_ALPHA = $190A
;--------------------------------------------------------------------------
; * Data Types
;--------------------------------------------------------------------------
#IL_BYTE            = $1400
#IL_UNSIGNED_BYTE   = $1401
#IL_SHORT           = $1402
#IL_UNSIGNED_SHORT  = $1403
#IL_INT             = $1404
#IL_UNSIGNED_INT    = $1405
#IL_FLOAT           = $1406
#IL_DOUBLE          = $140A
#IL_HALF            = $140B
;--------------------------------------------------------------------------
; * Miscellaneous
;--------------------------------------------------------------------------
#IL_VENDOR          = $1F00
#IL_LOAD_EXT        = $1F01
#IL_SAVE_EXT        = $1F02
;--------------------------------------------------------------------------
; * Library Specific
;--------------------------------------------------------------------------
#IL_VERSION_1_7_8   = 1
#IL_VERSION         = 178
;--------------------------------------------------------------------------
; * Attribute Bits
;--------------------------------------------------------------------------
#IL_ORIGIN_BIT          = $00000001
#IL_FILE_BIT            = $00000002
#IL_PAL_BIT             = $00000004
#IL_FORMAT_BIT          = $00000008
#IL_TYPE_BIT            = $00000010
#IL_COMPRESS_BIT        = $00000020
#IL_LOADFAIL_BIT        = $00000040
#IL_FORMAT_SPECIFIC_BIT = $00000080
#IL_ALL_ATTRIB_BITS     = $000FFFFF
;--------------------------------------------------------------------------
; * Palette Types
;--------------------------------------------------------------------------
#IL_PAL_NONE   = $0400
#IL_PAL_RGB24  = $0401
#IL_PAL_RGB32  = $0402
#IL_PAL_RGBA32 = $0403
#IL_PAL_BGR24  = $0404
#IL_PAL_BGR32  = $0405
#IL_PAL_BGRA32 = $0406
;--------------------------------------------------------------------------
; * Image Types
;--------------------------------------------------------------------------
#IL_TYPE_UNKNOWN  = $0000  ; Unknown Type
#IL_BMP           = $0420  ; Microsoft Windows Bitmap - .bmp extension
#IL_CUT           = $0421  ; Dr. Halo - .cut extension
#IL_DOOM          = $0422  ; DooM walls - no specific extension
#IL_DOOM_FLAT     = $0423  ; DooM flats - no specific extension
#IL_ICO           = $0424  ; Microsoft Windows Icons And Cursors - .ico And .cur extensions
#IL_JPG           = $0425  ; JPEG - .jpg, .jpe And .jpeg extensions
#IL_JFIF          = $0425  ;
#IL_ILBM          = $0426  ; Amiga IFF (FORM ILBM) - .iff, .ilbm, .lbm extensions
#IL_PCD           = $0427  ; Kodak PhotoCD - .pcd extension
#IL_PCX           = $0428  ; ZSoft PCX - .pcx extension
#IL_PIC           = $0429  ; PIC - .pic extension
#IL_PNG           = $042A  ; Portable Network Graphics - .png extension
#IL_PNM           = $042B  ; Portable Any Map - .pbm, .pgm, .ppm And .pnm extensions
#IL_SGI           = $042C  ; Silicon Graphics - .sgi, .bw, .rgb And .rgba extensions
#IL_TGA           = $042D  ; TrueVision Targa File - .tga, .vda, .icb And .vst extensions
#IL_TIF           = $042E  ; Tagged Image File Format - .tif And .tiff extensions
#IL_CHEAD         = $042F  ; C-Style Header - .h extension
#IL_RAW           = $0430  ; Raw Image Data - any extension
#IL_MDL           = $0431  ; Half-Life Model Texture - .mdl extension
#IL_WAL           = $0432  ; Quake 2 Texture - .wal extension
#IL_LIF           = $0434  ; Homeworld Texture - .lif extension
#IL_MNG           = $0435  ; Multiple-image Network Graphics - .mng extension
#IL_JNG           = $0435  ; 
#IL_GIF           = $0436  ; Graphics Interchange Format - .gif extension
#IL_DDS           = $0437  ; DirectDraw Surface - .dds extension
#IL_DCX           = $0438  ; ZSoft Multi-PCX - .dcx extension
#IL_PSD           = $0439  ; Adobe PhotoShop - .psd extension
#IL_EXIF          = $043A  ; 
#IL_PSP           = $043B  ; PaintShop Pro - .psp extension
#IL_PIX           = $043C  ; PIX - .pix extension
#IL_PXR           = $043D  ; Pixar - .pxr extension
#IL_XPM           = $043E  ; X Pixel Map - .xpm extension
#IL_HDR           = $043F  ; Radiance High Dynamic Range - .hdr extension
#IL_ICNS          = $0440  ; Macintosh Icon - .icns extension
#IL_JP2           = $0441  ; Jpeg 2000 - .jp2 extension
#IL_EXR           = $0442  ; OpenEXR - .exr extension
#IL_WDP           = $0443  ; Microsoft HD Photo - .wdp And .hdp extension
#IL_VTF           = $0444  ; Valve Texture Format - .vtf extension
#IL_WBMP          = $0445  ; Wireless Bitmap - .wbmp extension
#IL_SUN           = $0446  ; Sun Raster - .sun, .ras, .rs, .im1, .im8, .im24 And .im32 extensions
#IL_IFF           = $0447  ; Interchange File Format - .iff extension
#IL_TPL           = $0448  ; Gamecube Texture - .tpl extension
#IL_FITS          = $0449  ; Flexible Image Transport System - .fit And .fits extensions
#IL_DICOM         = $044A  ; Digital Imaging And Communications in Medicine (DICOM) - .dcm And .dicom extensions
#IL_IWI           = $044B  ; Call of Duty Infinity Ward Image - .iwi extension
#IL_BLP           = $044C  ; Blizzard Texture Format - .blp extension
#IL_FTX           = $044D  ; Heavy Metal: FAKK2 Texture - .ftx extension
#IL_ROT           = $044E  ; Homeworld 2 - Relic Texture - .rot extension
#IL_TEXTURE       = $044F  ; Medieval II: Total War Texture - .texture extension
#IL_DPX           = $0450  ; Digital Picture Exchange - .dpx extension
#IL_UTX           = $0451  ; Unreal (And Unreal Tournament) Texture - .utx extension
#IL_MP3           = $0452  ; MPEG-1 Audio Layer 3 - .mp3 extension
#IL_JASC_PAL      = $0475  ; PaintShop Pro Palette
;--------------------------------------------------------------------------
; * Error Types
;--------------------------------------------------------------------------
#IL_NO_ERROR             = $0000
#IL_INVALID_ENUM         = $0501
#IL_OUT_OF_MEMORY        = $0502
#IL_FORMAT_NOT_SUPPORTED = $0503
#IL_INTERNAL_ERROR       = $0504
#IL_INVALID_VALUE        = $0505
#IL_ILLEGAL_OPERATION    = $0506
#IL_ILLEGAL_FILE_VALUE   = $0507
#IL_INVALID_FILE_HEADER  = $0508
#IL_INVALID_PARAM        = $0509
#IL_COULD_NOT_OPEN_FILE  = $050A
#IL_INVALID_EXTENSION    = $050B
#IL_FILE_ALREADY_EXISTS  = $050C
#IL_OUT_FORMAT_SAME      = $050D
#IL_STACK_OVERFLOW       = $050E
#IL_STACK_UNDERFLOW      = $050F
#IL_INVALID_CONVERSION   = $0510
#IL_BAD_DIMENSIONS       = $0511
#IL_FILE_READ_ERROR      = $0512
#IL_FILE_WRITE_ERROR     = $0512
;--------------------------------------------------------------------------
#IL_LIB_GIF_ERROR  = $05E1
#IL_LIB_JPEG_ERROR = $05E2
#IL_LIB_PNG_ERROR  = $05E3
#IL_LIB_TIFF_ERROR = $05E4
#IL_LIB_MNG_ERROR  = $05E5
#IL_LIB_JP2_ERROR  = $05E6
#IL_LIB_EXR_ERROR  = $05E7
#IL_UNKNOWN_ERROR  = $05FF
;--------------------------------------------------------------------------
; * Origin Definitions
;--------------------------------------------------------------------------
#IL_ORIGIN_SET        = $0600
#IL_ORIGIN_LOWER_LEFT = $0601
#IL_ORIGIN_UPPER_LEFT = $0602
#IL_ORIGIN_MODE       = $0603
;--------------------------------------------------------------------------
; * Format and Type Mode Definitions
;--------------------------------------------------------------------------
#IL_FORMAT_SET  = $0610
#IL_FORMAT_MODE = $0611
#IL_TYPE_SET    = $0612
#IL_TYPE_MODE   = $0613
;--------------------------------------------------------------------------
; * File Definitions
;--------------------------------------------------------------------------
#IL_FILE_OVERWRITE = $0620
#IL_FILE_MODE      = $0621
;--------------------------------------------------------------------------
; * Palette Definitions
;--------------------------------------------------------------------------
#IL_CONV_PAL = $0630
;--------------------------------------------------------------------------
; * Load Fail Definitons
;--------------------------------------------------------------------------
#IL_DEFAULT_ON_FAIL = $0632
;--------------------------------------------------------------------------
; * Key Colour and Alpha Definitons
;--------------------------------------------------------------------------
#IL_USE_KEY_COLOUR  = $0635
#IL_USE_KEY_COLOR   = $0635
#IL_BLIT_BLEND      = $0636
;--------------------------------------------------------------------------
; * Interlace Definitions
;--------------------------------------------------------------------------
#IL_SAVE_INTERLACED = $0639
#IL_INTERLACE_MODE  = $063A
;--------------------------------------------------------------------------
; * Quantization Definitoons
;--------------------------------------------------------------------------
#IL_QUANTIZATION_MODE = $0640
#IL_WU_QUANT          = $0641
#IL_NEU_QUANT         = $0642
#IL_NEU_QUANT_SAMPLE  = $0643
#IL_MAX_QUANT_INDEXS  = $0644
#IL_MAX_QUANT_INDICES = $0644
;--------------------------------------------------------------------------
; * Hints
;--------------------------------------------------------------------------
#IL_FASTEST          = $0660
#IL_LESS_MEM         = $0661
#IL_DONT_CARE        = $0662
#IL_MEM_SPEED_HINT   = $0665
#IL_USE_COMPRESSION  = $0666
#IL_NO_COMPRESSION   = $0667
#IL_COMPRESSION_HINT = $0668
;--------------------------------------------------------------------------
; * Compression
;--------------------------------------------------------------------------
#IL_NVIDIA_COMPRESS  = $0670
#IL_SQUISH_COMPRESS  = $0671
;--------------------------------------------------------------------------
; * Subimage Types
;--------------------------------------------------------------------------
#IL_SUB_NEXT   = $0680
#IL_SUB_MIPMAP = $0681
#IL_SUB_LAYER  = $0682
;--------------------------------------------------------------------------
; * Compression Definitions
;--------------------------------------------------------------------------
#IL_COMPRESS_MODE = $0700
#IL_COMPRESS_NONE = $0701
#IL_COMPRESS_RLE  = $0702
#IL_COMPRESS_LZO  = $0703
#IL_COMPRESS_ZLIB = $0704
;--------------------------------------------------------------------------
; * File Format Specific Values
;--------------------------------------------------------------------------
#IL_TGA_CREATE_STAMP        = $0710
#IL_JPG_QUALITY             = $0711
#IL_PNG_INTERLACE           = $0712
#IL_TGA_RLE                 = $0713
#IL_BMP_RLE                 = $0714
#IL_SGI_RLE                 = $0715
#IL_TGA_ID_STRING           = $0717
#IL_TGA_AUTHNAME_STRING     = $0718
#IL_TGA_AUTHCOMMENT_STRING  = $0719
#IL_PNG_AUTHNAME_STRING     = $071A
#IL_PNG_TITLE_STRING        = $071B
#IL_PNG_DESCRIPTION_STRING  = $071C
#IL_TIF_DESCRIPTION_STRING  = $071D
#IL_TIF_HOSTCOMPUTER_STRING = $071E
#IL_TIF_DOCUMENTNAME_STRING = $071F
#IL_TIF_AUTHNAME_STRING     = $0720
#IL_JPG_SAVE_FORMAT         = $0721
#IL_CHEAD_HEADER_STRING     = $0722
#IL_PCD_PICNUM              = $0723
#IL_PNG_ALPHA_INDEX         = $0724
#IL_JPG_PROGRESSIVE         = $0725
#IL_VTF_COMP                = $0726
;--------------------------------------------------------------------------
; * DXTC Definitions
;--------------------------------------------------------------------------
#IL_DXTC_FORMAT      = $0705
#IL_DXT1             = $0706
#IL_DXT2             = $0707
#IL_DXT3             = $0708
#IL_DXT4             = $0709
#IL_DXT5             = $070A
#IL_DXT_NO_COMP      = $070B
#IL_KEEP_DXTC_DATA   = $070C
#IL_DXTC_DATA_FORMAT = $070D
#IL_3DC              = $070E
#IL_RXGB             = $070F
#IL_ATI1N            = $0710
#IL_DXT1A            = $0711
;--------------------------------------------------------------------------
; * Environment Map Definitions
;--------------------------------------------------------------------------
#IL_CUBEMAP_POSITIVEX = $00000400
#IL_CUBEMAP_NEGATIVEX = $00000800
#IL_CUBEMAP_POSITIVEY = $00001000
#IL_CUBEMAP_NEGATIVEY = $00002000
#IL_CUBEMAP_POSITIVEZ = $00004000
#IL_CUBEMAP_NEGATIVEZ = $00008000
#IL_SPHEREMAP         = $00010000
;--------------------------------------------------------------------------
; * Miscellaneous Values
;--------------------------------------------------------------------------
#IL_VERSION_NUM           = $0DE2
#IL_IMAGE_WIDTH           = $0DE4
#IL_IMAGE_HEIGHT          = $0DE5
#IL_IMAGE_DEPTH           = $0DE6
#IL_IMAGE_SIZE_OF_DATA    = $0DE7
#IL_IMAGE_BPP             = $0DE8
#IL_IMAGE_BYTES_PER_PIXEL = $0DE8
#IL_IMAGE_BPP             = $0DE8
#IL_IMAGE_BITS_PER_PIXEL  = $0DE9
#IL_IMAGE_FORMAT          = $0DEA
#IL_IMAGE_TYPE            = $0DEB
#IL_PALETTE_TYPE          = $0DEC
#IL_PALETTE_SIZE          = $0DED
#IL_PALETTE_BPP           = $0DEE
#IL_PALETTE_NUM_COLS      = $0DEF
#IL_PALETTE_BASE_TYPE     = $0DF0
#IL_NUM_FACES             = $0DE1
#IL_NUM_IMAGES            = $0DF1
#IL_NUM_MIPMAPS           = $0DF2
#IL_NUM_LAYERS            = $0DF3
#IL_ACTIVE_IMAGE          = $0DF4
#IL_ACTIVE_MIPMAP         = $0DF5
#IL_ACTIVE_LAYER          = $0DF6
#IL_ACTIVE_FACE           = $0E00
#IL_CUR_IMAGE             = $0DF7
#IL_IMAGE_DURATION        = $0DF8
#IL_IMAGE_PLANESIZE       = $0DF9
#IL_IMAGE_BPC             = $0DFA
#IL_IMAGE_OFFX            = $0DFB
#IL_IMAGE_OFFY            = $0DFC
#IL_IMAGE_CUBEFLAGS       = $0DFD
#IL_IMAGE_ORIGIN          = $0DFE
#IL_IMAGE_CHANNELS        = $0DFF
;--------------------------------------------------------------------------
; * DevIL Methods
;--------------------------------------------------------------------------
Import "DevIL.lib"
  ilActiveFace.a(Number.i)
  ilActiveImage.a(Number.i)
  ilActiveLayer.a(Number.i)
  ilActiveMipmap.a(Number.i)
  ilApplyPal.a(FileName$)
  ilApplyProfile.a(*InProfile, *OutProfile)
  ilBindImage(Image.i)
  ilBlit.a(Source.i, DestX.i, DestY.i, DestZ.i, SrcX.i, SrcY.i, SrcZ.i, Width.i, Height.i, Depth.i)
  ilClampNTSC.a()
  ilClearColour.a(Red.f, Green.f, Blue.f, Alpha.f)
  ilClearImage()
  ilCloneCurImage.i()
  ilCompressDXT.l(*pData, Width.i, Height.i, Depth.i, DXTCFormat.i, *DXTCSize)
  ilCompressFunc.a(Mode.i)
  ilConvertImage.a(DestFormat.i, DestType.i)
  ilConvertPal.a(DestFormat.i)
  ilCopyImage.a(Src.i)
  ilCopyPixels.i(XOff.i, YOff.i, ZOff.i, Width.i, Height.i, Depth.i, Format.i, Type.i,  *pData)
  ilCreateSubImage.i(Type.i, Num.i)
  ilDefaultImage.a()
  ilDeleteImage(Num.i)
  ilDeleteImages(Num.i, *Images)
  ilDetermineType.i(FileName$)
  ilDetermineTypeF.i(File.l)
  ilDetermineTypeL.i(*Lump, Size.i)
  ilDisable.a(Mode.i)
  ilDxtcDataToImage.a()
  ilDxtcDataToSurface.a()
  ilEnable.a(Mode.i)
  ilFlipSurfaceDxtcData()
  ilFormatFunc.a(Mode.i)
  ilGenImages(Num.i, *Images)
  ilGenImage.i()
  ilGetAlpha.l(Type.i)
  ilGetBoolean.a(Mode.i)
  ilGetBooleanv(Mode.i, *Param)
  ilGetData.a()
  ilGetDXTCData.i( *Buffer, BufferSize.i, DXTCFormat.i)
  ilGetError.i()
  ilGetInteger.i(Mode.i)
  ilGetIntegerv(Mode.i, *Param)
  ilGetLumpPos.i()
  ilGetPalette.l()
  ilGetString.l(StringName.i)
  ilHint(Target.i, Mode.i)
  ilInvertSurfaceDxtcDataAlpha.a()
  ilInit()
  ilImageToDxtcData.a(Format.i)
  ilIsDisabled.a(Mode.i)
  ilIsEnabled.a(Mode.i)
  ilIsImage.a(Image.i)
  ilIsValid.a(Type.i, FileName$)
  ilIsValidF.a(Type.i, File.l)
  ilIsValidL.a(Type.i, *Lump, Size.i)
  ilKeyColour(Red.f, Green.f, Blue.f, Alpha.f)
  ilLoad.a(Type.i, FileName$)
  ilLoadF.a(Type.i, File.l)
  ilLoadImage.a(FileName$)
  ilLoadL.a(Type.i, *Lump, Size.i)
  ilLoadPal.a(FileName$)
  ilModAlpha(AlphaValue.d)
  ilOriginFunc.a(Mode.i)
  ilOverlayImage.a(Source.i, XCoord.i, YCoord.i, ZCoord.i)
  ilPopAttrib()
  ilPushAttrib(Bits.i)
  ilRegisterFormat(Format.i)
  ilRegisterLoad.a(Ext$, *LoadProcedure)
  ilRegisterMipNum.a(Num.i)
  ilRegisterNumFaces.a(Num.i)
  ilRegisterNumImages.a(Num.i)
  ilRegisterOrigin(Origin.i)
  ilRegisterPal(*Pal, Size.i, Type.i)
  ilRegisterSave.a(Ext$, *SaveProcedure)
  ilRegisterType(Type.i)
  ilRemoveLoad.a(Ext$)
  ilRemoveSave.a(Ext$)
  ilResetRead()
  ilResetWrite()
  ilSave.a(Type.i, FileName$)
  ilSaveF.i(Type.i, File.l)
  ilSaveImage.a(FileName$)
  ilSaveL.i(Type.i, *Lump, Size.i)
  ilSavePal.a(FileName$)
  ilSetAlpha.a(AlphaValue.d)
  ilSetData.a(*pData)
  ilSetDuration.a(Duration.i)
  ilSetInteger(Mode.i, Param.i)
  ilSetMemory(*mAlloc, *mFree)
  ilSetPixels(XOff.i, YOff.i, ZOff.i, Width.i, Height.i, Depth.i, Format.i, Type.i,  *pData)
  ilSetRead(*fOpenRProc, *fCloseRProc, *fEofProc, *fGetcProc, *fReadProc, *fSeekRProc, *fTellRProc)
  ilSetString(Mode.i, *String)
  ilSetWrite(*fOpenWProc, *fCloseWProc, *fPutcProc, *fSeekWProc, *fTellWProc, *fWriteProc)
  ilShutDown()
  ilSurfaceToDxtcData.a(Format.i)
  ilTexImage.a(Width.i, Height.i, Depth.i, NumChannels.a, Format.i, Type.i, *pData)
  ilTexImageDxtc.a(w.i, h.i, d.i, DxtFormat.i, *pData)
  ilTypeFromExt.i(FileName$)
  ilTypeFunc.a(Mode.i)
  ilLoadData.a(FileName$, Width.i, Height.i, Depth.i, Bpp.a)
  ilLoadDataF.a(File.l, Width.i, Height.i, Depth.i, Bpp.a)
  ilLoadDataL.a(*Lump, Size.i, Width.i, Height.i, Depth.i, Bpp.a)
  ilSaveData.a(FileName$)
EndImport
; IDE Options = PureBasic 5.71 LTS (Windows - x86)
; CursorPosition = 3
; EnableXP