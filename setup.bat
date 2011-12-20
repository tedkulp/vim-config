@rem Do not use "echo off" to not affect any child calls.
@setlocal

@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

mklink /D "%HOME%\vimfiles" "%HOME%\vim-config\.vim"
mklink /D "%HOME%\.vim" "%HOME%\vim-config\.vim"
mklink "%HOME%\_vimrc" "%HOME%\vim-config\.vimrc"
mklink "%HOME%\_gvimrc" "%HOME%\vim-config\.gvimrc"

@if exist "%HOME%\.vim\vundle.git" goto vundleexists
@goto vundlenotexists
:vundleexists
  cd "%HOME%\.vim\vundle.git"
  git pull origin master
  goto end
:vundlenotexists
	git clone "http://github.com/gmarik/vundle.git" "%HOME%\.vim\vundle.git"
  goto end
:end

@echo.
@echo "If this is your first installation, open gvim and type ':BundleInstall' to install necessary plugins."
@echo.
