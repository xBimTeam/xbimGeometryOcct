# xbim's OpenCascade library generator

This repo enables OpenCascade libraries to be compiled as DLLs and .lib files for x86 and x64 platforms (and others as required) 
so as to be compatible with xbim.Geometry, and appropriate for .NET nuget packaging in a fully repeatable manner for any OpenCascade release.

It's a simple wrapper around the standard 'cmake' mechanism which simple ensures that we configure the builds appropriately e.g.

1. Disabling OCCT Modules we don't need (such as Visualisation)
2. Ensuring exceptions are raised in Release builds
3. Removing dependencies on unnecessary 3rd party packages such as FreeType

It does exactly the same as the cmake GUI but is a repeatable scripted process which should avoid mis-steps when regenerating OCCT libraries
in future. Building and 'Installing' are done automatically.

## How to run

The main entry point is `xbim-build-and-install-all-platforms.cmd`

This will configure each platform in turn with _cmake_, compile for Release configuration, and deploy the binaries to the _Install_ folder under the 
appropriate platform folder.

The Install folder can then be used as the source when packing a Nuget package.

## How to upgrade OCCT

Simply download the latest OCCT zip/tar to this folder, unpack and update _OCCT_SOURCEDIR_ `xbim-build-and-install-all-platforms.cmd`.

Run `xbim-configure.cmd` manually and open the cmake GUI to check all settings are as expected. Update `xbim-configure.cmd` as appropriate
if there are new _cmake_ flags to set.

## Legacy

The _Building OpenCascade from Source using CMake and Visual Studio 2022_ Word document is obsolete and for reference only

## Note

There are no OCCT third party dependencies needed, but the ThirdParty folder is left in case this changes.

This repo does not version the Open Casade source, but it does version the Build folders (which is largely .vcxproj, .sln and cmake files). This is useful to determine any 
environmental changes between releases. 