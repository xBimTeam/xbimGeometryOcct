# Xbim.Geometry.Occt

This Nuget package contains Open CASCADE 7.8.1 libraries used by xbim Geometry Engine v6+ which are dynamically linked into
the xbim software.

## Building

You must build the OpenCascade libraries first as per the [Solution Readme](../Readme.md)

Note: Due to the inclusion of the 8000+ header files in the nuget pack, building can take a few minutes. 
During test builds, setting `OcctSkipHeaders=true` can be used to test more quickly

Note: There is no distinction between Release and Debug builds of this project. The Nuget packages always contains Release
OCCT binaries - although there is provision for deploying Debug binaries - see the _DeployDebugDlls_ setting in the csproj.
