#   /$$   /$$ /$$$$$$$$
#  | $$  /$$/| $$_____/
#  | $$ /$$/ | $$
#  | $$$$$/  | $$$$$
#  | $$  $$  | $$__/
#  | $$\  $$ | $$
#  | $$ \  $$| $$      Author: Kauê Fraga Rodrigues
#  |__/  \__/|__/      github.com/kauefraga/my-dotfiles
Clear-Host

function Print {
  param (
    [string] $message,
    [string] $color = "green"
  )
  Write-Host $message -ForegroundColor $color
}

Print "[script] author: @github.com/kauefraga"

if (-Not (Test-Path "$env:userprofile/scoop"))
{
  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
  Invoke-RestMethod "get.scoop.sh" | Invoke-Expression
  # irm get.scoop.sh | iex -> same as above
}

<# TODO
  ask the user about which packages he wants to install
  parse the list of packages and install them
#>

# q = question
$qInstallPackages = Read-Host "[script] Do you want to install apps? [y/n] "
$qConfigPackages = Read-Host "[script] Do you want to config apps? [y/n] "
$qSpotifyP = Read-Host "[script] Do you want to run spotify script? [y/n] "

# Install packages :: initializing
if ($qInstallPackages -eq "y")
{
  $packages = Get-Content "./packages.json" | ConvertFrom-Json

  Print "[script] Installing packages..."
  scoop install $packages.basics
  scoop install $packages.compilers
  scoop install $packages.terminal
  scoop install $packages.langs
  scoop install $packages.frufru
  scoop install $packages.extras

  Print "[script] Installing packages... done"
}
# Install packages :: finished

# Config packages :: initializing
if ($qConfigPackages -eq "y")
{
  # Set-Location = cd = chdir
  Set-Location "$env:userprofile"
  git clone "https://github.com/kauefraga/my-dotfiles.git"
  Set-Location "./my-dotfiles"

  Print "[script] Configuring packages..."
  Move-Item -Path "./.config/nvim" -Destination "$env:LOCALAPPDATA"

  Move-Item -Path "./.config/alacritty" -Destination "$env:APPDATA"

  Move-Item -Path "./.config/neofetch" -Destination "../.config"

  Move-Item -Path "./.config/starship.toml" -Destination "../.config"

  Move-Item -Path "./powershell" -Destination "../.config"

  Move-Item -Force -Path "../.config/powershell/Microsoft.PowerShell_profile.ps1" -Destination "$env:USERPROFILE/scoop/apps/pwsh/current"

  # TODO: config and install lsp nvim (vim-plug)

  # nodejs env
  nvm install lts
  nvm use lts
  npm i -g yarn pnpm

  Print "[script] Configuring packages... done"
}
# Config packages :: finished



# Run spotify script
iwr -useb "raw.githubusercontent.com/amd64fox/SpotX/main/Install.ps1" | iex
# Invoke-WebRequest -UseBasicParsing "raw.githubusercontent.com/amd64fox/SpotX/main/Install.ps1" | Invoke-Expression
