# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding


# Install oh-my-posh with chocolatey

# Configuration
$omp_config = Join-Path $PSScriptRoot ".\kauef.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

# Imports
# Import-Module -Name z
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
