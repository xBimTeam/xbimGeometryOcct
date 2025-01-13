echo off

if /I "%VCVER%" == "vc14" (
  if "%ARCH%" == "64" (
    rem set environment variables used by OCCT
    set CSF_FPE=0

    set "TCL_DIR="
    set "TK_DIR="
    set "FREETYPE_DIR="
    set "FREEIMAGE_DIR="
    set "EGL_DIR="
    set "GLES2_DIR="
    set "TBB_DIR="
    set "VTK_DIR="
    set "FFMPEG_DIR="
    set "OPENVR_DIR="

    if not "" == "" (
      set "QTDIR="
    )
    set "TCL_VERSION_WITH_DOT="
    set "TK_VERSION_WITH_DOT="

    rem CSF_OCCTBinPath and CSF_OCCTLibPath are defined differently for 
    rem multiple and single configuration builds
    set "CSF_OCCTBinPath="
    if [""] == [""] (
      set "CSF_OCCTBinPath=C:/OCCT-Build/Builds/win%ARCH%/%VCVER%/bin%3"
    )
    set "CSF_OCCTLibPath="
    if [""] == [""] (
      set "CSF_OCCTLibPath=C:/OCCT-Build/Builds/win%ARCH%/%VCVER%/lib%3"
    )

    set "CSF_OCCTIncludePath=C:/OCCT-Build/Builds/inc"
    set "CSF_OCCTResourcePath=C:/OCCT-Build/OCCT/src"
    set "CSF_OCCTDataPath=C:/OCCT-Build/OCCT/data"
    set "CSF_OCCTSamplesPath=C:/OCCT-Build/OCCT/samples"
    set "CSF_OCCTTestsPath=C:/OCCT-Build/OCCT/tests"
    set "CSF_OCCTDocPath=C:/OCCT-Build/OCCT/doc"

    rem for compatibility with external application using CASROOT
    set "CASROOT=C:/OCCT-Build/OCCT"
  ) 
)
