echo off

setlocal

rem Configures the OCCT source for a platform
rem Usage: xbim-configure.bat <OCCT-SourcePath> <OCCT-BinariesPath> x64|Win32

set "VC_TOOLS=v143"


if ["%1"]    == [""] (
	GOTO usage
)
if ["%2"]    == [""] (
	GOTO usage
)
if ["%3"]    == [""] (
	GOTO usage
)


set "OCCT_SOURCEDIR=%1"
set "OCCT_BUILDDIR=%2"
set "OCCT_ARCH=%3"

set "SCRIPTROOT=%~dp0"
set "SCRIPTROOT=%SCRIPTROOT:~0,-1%"

echo Running cmake for %OCCT_ARCH% platform generating /%OCCT_BUILDDIR% from /%OCCT_SOURCEDIR%

cmake -G "Visual Studio 17 2022" -A %OCCT_ARCH% -T %VC_TOOLS% ^
 -D3RDPARTY_DIR=%SCRIPTROOT%/ThirdParty ^
 -DINSTALL_DIR=%SCRIPTROOT%/Install ^
 -DBUILD_MODULE_DETools=OFF ^
 -DBUILD_MODULE_Draw=OFF ^
 -DBUILD_MODULE_Visualization=OFF ^
 -DBUILD_RELEASE_DISABLE_EXCEPTIONS=OFF ^
 -DUSE_FREETYPE=OFF ^
 -DUSE_OPENGL=OFF ^
 -DUSE_TK=OFF ^
 -S %OCCT_SOURCEDIR% ^
 -B %OCCT_BUILDDIR% ^
 --fresh

endlocal

goto:eof

:usage
	echo Usage: xbim-configure.bat ^<OCCT-SourcePath^> ^<OCCT-BinariesPath^> x64^|Win32
	exit /B -1
goto:eof

	