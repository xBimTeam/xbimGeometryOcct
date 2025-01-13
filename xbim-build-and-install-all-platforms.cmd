echo off

rem Builds all supported platforms to the Install folder. Use this command to rebuild x86 and x64 versions of any Open Cascade source
rem This one command will generate each platforms source, build and deploy the binaries to the appropriate folders under Install.

rem Note: this needs to be run from a x64 Native Tools Command Window

rem Usage: xbim-build-and-install-all-platforms.cmd

rem Config
rem Path to the master OCCT version as downloaded from https://dev.opencascade.org/release
set "OCCT_SOURCEDIR=OCCT"

rem Path to Binaries folder (used by each platform)
set "OCCT_BUILDDIR=Builds"

rem No further edits below unless adding new platforms (e.g. Arm64)

set "SCRIPTROOT=%~dp0"
set "SCRIPTROOT=%SCRIPTROOT:~0,-1%"

rem ======= x86 Platform ========
:win32
echo Build solution for x86

CALL .\xbim-configure.cmd %OCCT_SOURCEDIR% %OCCT_BUILDDIR% Win32

echo Building Win32 projects with msbuild
CALL %SCRIPTROOT%/%OCCT_BUILDDIR%/build.bat vc143 32
echo deploying Win32 projects with msbuild
CALL %SCRIPTROOT%/%OCCT_BUILDDIR%/install.bat vc143 32

rem ======= x64 Platform ========
:win64
echo Generating solution for x64 with cmake
CALL .\xbim-configure.cmd %OCCT_SOURCEDIR% %OCCT_BUILDDIR% x64

echo Building x64 projects with msbuild
CALL %SCRIPTROOT%/%OCCT_BUILDDIR%/build.bat vc143 64
echo deploying x64 projects with msbuild
CALL %SCRIPTROOT%/%OCCT_BUILDDIR%/install.bat vc143 64



