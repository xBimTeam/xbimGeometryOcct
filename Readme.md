# xbim's OpenCascade library generator

This repo enables OpenCascade libraries to be compiled as DLLs and .lib files for x86 and x64 platforms (and others as required) 
so as to be compatible with xbim.Geometry, and appropriate for .NET nuget packaging in a fully repeatable manner for any OpenCascade release.

It's a simple wrapper around the standard 'cmake' mechanism which just ensures that we drive cmake to configure the builds consistently e.g.

1. Disabling OCCT Modules we don't need (such as Visualisation)
2. Ensuring exceptions are raised in Release builds
3. Removing dependencies on unnecessary 3rd party packages such as FreeType

It does exactly the same as the cmake GUI but is a repeatable scripted process which should avoid mis-steps when regenerating OCCT libraries
in future. Building and 'Installing' are done automatically after cmake has run.

The Nuget packaging project is also provided in [Xbim.Geometry.Occt](./Xbim.Geometry.Occt.sln)

## How to build and package Xbim.Geometry.Occt

There are then 3 steps to build a package:


	1. Acquire the OCCT source for the version 
	2. Build & Compile OCCT for the desired platforms
	3. Package as nuget with targets to deploy native binaries

### 1. Acquire OCCT source

This repo doesn't include the OpenCASCADE source so you need to download it. There are two ways to do this:

Either

	a. Use the supplied _git submodule_ to https://github.com/Open-Cascade-SAS/ in `OCCT` 
		`git submodule update --init`
		(and change to the desired branch/tag)
	_or_ 
	b. Manually download the appropriate OCCT zip/tar to this folder, unpack and update _OCCT_SOURCEDIR_ in `xbim-build-and-install-all-platforms.cmd` to point at the new OCCT source folder.


### 2. Build OCCT binaries

Pre-requisities: You'll need Visual Studio 2022 installed with the C++ desktop development environment component, and the C++/CLI v143 build tools.

The main entry point to build OpenCASCADE is to run `xbim-build-and-install-all-platforms.cmd`. 

> Note: you **must** run this command from a 'Native x64' console so the correct VC paths are available. 

This command will:

1. configure each platform in turn with _cmake_
2. compile for Release configuration
3. deploy the binaries to the _Install_ folder under the appropriate platform's bin/lib folder.
4. Copy the headers to the _Install_ folder.

### 3. Generate the Nuget package

The Install will contain all the artefacts to package to a Nuget package. To create a nuget package of the resulting libs & dlls, simply build the 
_Xbim.Geometry.Occt.sln_ solution and the nuget package will be produced in the 'bin' folder. 

## How to upgrade OCCT

Clean the _Builds_ and _Installs_ folders to avoid any inclusion of deleted content from other prior releases.



Update the OCCT source to the desired branch/tag/commit - or download the OCCT source to a folder as per _Acquire OCCT source_

To check all settings are as expected, run `xbim-configure.cmd` manually and open the cmake GUI. Update `xbim-configure.cmd` as appropriate
if there are new _cmake_  `-DBUILD_SomeFlag` flags to set. Now run `xbim-build-and-install-all-platforms.cmd` to build and compile all platforms into the _Install_ folder

After OCCT has been built, review [Occt.lib.targets](./Xbim.Geometry.Occt/Occt.lib.targets) in case any new or deprecated OCCT libs have been added, removed
or renamed, and update Occt.lib.targets where needed. Update the Xbim.Geometry.Occt package and version information.

## Package deployment / CI

There are currently no CI builds for this project given the infrequency of OCCT releases. Deployment to nuget its is currently manual.

## Legacy

The _Building OpenCascade from Source using CMake and Visual Studio 2022_ Word document is obsolete and for reference only

## Note

There are no OCCT third party dependencies needed, but the ThirdParty folder is left in case this changes.

This repo does not itself version the Open Casade source, but it does version the Build folders (which is largely .vcxproj, .sln and cmake files).
This is useful to determine any  environmental changes between releases - or to track the impact of `cmake` changes.
The OCCT submodule is designed to track the desired source OCCT from the official Github repo.