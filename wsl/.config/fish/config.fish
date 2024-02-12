starship init fish | source

# Aliases
alias bat='batcat'

# Functions
function gitsetup
    git config --global user.email "kauefragarodrigues456@gmail.com"
    git config --global user.name "Kauê Fraga Rodrigues"

    git config --global commit.gpgsign true

    echo "Remember to configure ssh and gpg ^^"  
end

