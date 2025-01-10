echo off

rem Clean all untracked content in Install and Builds. Useful when switching between OCCT releases

git clean -df ./Install/
git clean -df ./Builds/