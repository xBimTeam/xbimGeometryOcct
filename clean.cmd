echo off

rem Clean all untracked content in Install and Builds. Useful when switching between OCCT releases

git clean -dfX ./Install/
git clean -dfX ./Builds/