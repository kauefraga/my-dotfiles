#   /$$   /$$ /$$$$$$$$
#  | $$  /$$/| $$_____/
#  | $$ /$$/ | $$
#  | $$$$$/  | $$$$$
#  | $$  $$  | $$__/
#  | $$\  $$ | $$
#  | $$ \  $$| $$      Author: Kauê Fraga Rodrigues
#  |__/  \__/|__/      github.com/kauefraga/my-dotfiles
Clear-Host

If (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
  Write-Warning "You don't have Administrator rights"
  exit
}

Write-Host "[script] Starting..."

# Install Chocolatey package manager
#Set-ExecutionPolicy AllSigned
#Set-ExecutionPolicy Bypass -Scope Process -Force
#iwr -useb "https://community.chocolatey.org/install.ps1" | Invoke-Expression

Write-Host "[script] Installing..."
# Install general stuff
[void]choco install -y winrar git openssh mingw ccls 

# Install lang and runtimes
[void]choco install -y python go nvm

# Install utils and prettiers
[void]choco install -y neovim alacritty starship
[void]Install-Module -Name Terminal-Icons -Repository PSGallery

# Install main apps
[void]choco install -y vivaldi discord
Write-Host "[script] Downloads finished"


Write-Host "[script] Configuring..."
cd $env:USERPROFILE

git clone https://github.com/kauefraga/my-dotfiles.git dotfiles

# Powershell config
mkdir .\.config\powershell
iwr -Outfile .\powershell\user_profile.ps1 -useb "https://raw.githubusercontent.com/kauefraga/my-dotfiles/main/powershell/user_profile.ps1"

# Powershell init
mkdir .\Documents\WindowsPowerShell
". $env:USERPROFILE\.config\powershell\user_profile.ps1" > .\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

# Nvim config
mkdir $env:LOCALAPPDATA\nvim
mv .\dotfiles\.config\nvim\* $env:LOCALAPPDATA\nvim

# Install vim-plug
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
  ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

nvim +PlugInstall

# ...
# Config alacritty
# Run spotify script





