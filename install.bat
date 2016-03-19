@echo off

rem system environment dependent settings
setlocal 
for /F %%A in ('dir /b envs\win7\*') do (
	set env_path="envs\win7\"
	set file_name=%%A
	echo %%A 
	echo %file_name%
	echo %env_path%
rem 	set path_to_link=%env_path%%file_name%
rem 	set path_to_target=%userprofile%%file_name%
rem 	mklink /D %path_to_link% %path_to_target%
rem 	echo "%path_to_target%"
rem 	echo "mklink /D %path_to_link% %path_to_target%"
)
endlocal

rem rem make symbolic link for .vim director
rem setlocal enabledelayedexpansion
rem 	set relative_pat_to_dot_vim=.vim
rem 	set path_to_link=%userprofile%\.vim
rem 	rem path_to_target is the path from path_to_target to path_to_link
rem 	mklink /D %path_to_link% .vim
rem endlocal
rem 
rem rem vim environment dependent settings
rem setlocal
rem 	set path_to_link=
rem 	set path_to_target=
rem 	mklink %path_to_link% %path_to_target%
rem endlocal
rem 
rem rem plugin settings
rem mkdir %userprofile%\.vim\plugin_settings
rem rem make symbolic link for plugin settings
rem setlocal enabledelayedexpansion
rem for /F %%A in ('dir /b .\vimenvs\plugin_settings\*.vim') do (
rem 	set path_to_link=.vim\plugin_settings\%%A
rem 	set path_to_target=..\..\vimenvs\plugin_settings\%%A
rem 	rem mklink %path_to_link% %path_to_target%
rem 	echo mklink %path_to_link% %path_to_target%
rem )
rem endlocal

