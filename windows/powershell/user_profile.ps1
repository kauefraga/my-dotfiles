# Set powershell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Initialize fast node manager
fnm env --use-on-cd | Out-String | Invoke-Expression

# Initialize starship
Invoke-Expression (&starship init powershell)

# Aliases
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
