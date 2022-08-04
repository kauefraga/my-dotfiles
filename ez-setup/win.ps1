#   /$$   /$$ /$$$$$$$$
#  | $$  /$$/| $$_____/
#  | $$ /$$/ | $$
#  | $$$$$/  | $$$$$
#  | $$  $$  | $$__/
#  | $$\  $$ | $$
#  | $$ \  $$| $$      Author: Kauê Fraga Rodrigues
#  |__/  \__/|__/      github.com/kauefraga/my-dotfiles
Clear-Host

Write-Host "[ script ] Starting..."

if (-Not (Test-Path "$env:userprofile/scoop"))
{
  Invoke-RestMethod "get.scoop.sh" | Invoke-Expression
  # irm get.scoop.sh | iex -> same as above
}

<# TODO
  ask the user about which packages he wants to install
  parse the list of packages and install them
#>

# Install packages :: initializing
$option = Read-Host "[ script ] Do you want to install apps? [y/n] "

if ($option -eq "y")
{
  $packages = Get-Content "./packages.json" | ConvertFrom-Json

  Write-Host "[ script ] Installing packages..."
  scoop install $packages.basics
  scoop install $packages.compilers
  scoop install $packages.terminal
  scoop install $packages.langs
  scoop install $packages.frufru
  scoop install $packages.extras
}
# Install packages :: finishing

# ...
# Config alacritty
# Run spotify script

# Invoke-WebRequest -UseBasicParsing "raw.githubusercontent.com/amd64fox/SpotX/main/Install.ps1" | Invoke-Expression
iwr -useb "raw.githubusercontent.com/amd64fox/SpotX/main/Install.ps1" | iex
