# Configs
set GPG_TTY $(tty)
export GPG_TTY

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

function sshkrl
    ssh-add ~/.ssh/id_ed25519d
end
