@echo off

rem make symbolic link for .vim directory
setlocal enabledelayedexpansion
	set path_to_link=%userprofile%\.vim
	rem path_to_target is the path from path_to_target to path_to_link
	mklink /D %path_to_link% Documents\dotfiles\.vim
endlocal

mkdir .vim\plugin_settings

rem make symbolic link for plugin settings
setlocal enabledelayedexpansion
for /F %%A in ('dir /b .\vimenvs\plugin_settings\*.vim') do (
	set path_to_link=.vim\plugin_settings\%%A
	set path_to_target=..\..\vimenvs\plugin_settings\%%A
	rem mklink %path_to_link% %path_to_target%
	echo mklink %path_to_link% %path_to_target%
)
endlocal

