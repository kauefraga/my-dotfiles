::   /$$   /$$ /$$$$$$$$
::  | $$  /$$/| $$_____/
::  | $$ /$$/ | $$
::  | $$$$$/  | $$$$$
::  | $$  $$  | $$__/
::  | $$\  $$ | $$
::  | $$ \  $$| $$      Author: Kauê Fraga Rodrigues
::  |__/  \__/|__/      github.com/kauefraga/my-dotfiles
@echo off
color 2
cd %userprofile%
cls

echo "DEPRECATED: use ~$ iex win.ps1 instead"
pause
exit /b 0

:: verify if the user is admin
net session > NUL 2>&1
if %errorlevel% == 0 (
  goto init
) else (
  color 4
  echo [ script ] You are not an admin, please run this script as an admin.
  pause
  exit /b 1
)


:init
echo [ script ] Running...

if not exist "%userprofile%\scoop" (
  powershell -Command "& {Set-ExecutionPolicy RemoteSigned -Scope CurrentUser; irm get.scoop.sh | iex}"
)

:: Create CLI
:: ask for buckets -> scoop bucket add nerd-fonts extras

:: Installations
echo [ script ] Installing basics (git, text editor, langs, runtimes...)
scoop install git pwsh llvm mingw mingw-winlibs mingw-nuwen fd ripgrep python nvm go neovim starship neofetch

echo [ script ] Installing extras (browser, terminal, etc...)
scoop install vivaldi notion openvpn openssh openssl alacritty vcredist2022 terminal-icons fzf psfzf meow

echo [ script ] Sorry! you will need to install some apps manually.
echo [ script ] try `scoop install spotify`
echo [ script ] https://discord.gg
echo [ script ] https://rarlab.com/rar/winrar-x64-611br.exe

echo [ script ] Installing fonts...
scoop install Office-Code-Pro FiraCode

:: Settings
echo [ script ] Configuring dev environment
echo [ script ] Installing dotfiles...
git clone https://github.com/kauefraga/my-dotfiles.git
cd my-dotfiles

powershell -Command "& {mv .\.config\nvim          ..\AppData\Local}"
powershell -Command "& {mv .\.config\alacritty     ..\AppData\Roaming}"
powershell -Command "& {mv .\.config\neofetch      ..\.config}"
powershell -Command "& {mv .\.config\starship.toml ..\.config}"
powershell -Command "& {mv .\powershell            ..\.config}"

echo [ script ] Configuring powershell...
powershell -Command "& {mv -Force ..\.config\powershell\Microsoft.PowerShell_profile.ps1 $env:USERPROFILE\scoop\apps\pwsh\current}"

echo [ script ] Configuring neovim with vim-plug
:: NVIM_HOME = $env:USERPROFILE\AppData\Local\nvim
echo [ script ] Sorry! you will need to install vim-plug manually.
echo [ script ] https://github.com/junegunn/vim-plug
nvim -c "PlugInstall" -c "qall"
nvim -c "LspInstall jedi_language_server tsserver jsonls gopls html cssls tailwindcss " -c "qall"

echo [ script ] Configuring nodejs env...
nvm install lts
nvm use lts
npm i -g yarn pnpm
