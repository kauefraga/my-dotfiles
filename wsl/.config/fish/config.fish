# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# jdk
set --export JAVA_HOME /usr/lib/jvm/jdk-21-oracle-x64

# gatling
set --export GATLING_HOME $HOME/gatling

# PATH
set --export PATH /opt/nvim-linux64/bin $PATH # neovim
set --export PATH /usr/local/go/bin $PATH # golang
set --export PATH $HOME/.cargo/bin $PATH # rust
set --export PATH $HOME/.bun/bin $PATH # bun
set --export PATH $JAVA_HOME $PATH # java

set --export PATH $HOME/www/anime-archive/bin/linux $PATH # anime archive

# Configs
set --export GPG_TTY $(tty)

starship init fish | source

# Aliases
alias bat='batcat'
alias vim='nvim'
alias python='python3'
alias pip='pip3'

alias g='git'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gs='git status'
alias gssb='git status -sb'
alias gl='git log --oneline'

# Functions
function gitsetup
    git config --global user.email "rkauefraga@gmail.com"
    git config --global user.name "Kauê Fraga Rodrigues"
    git config --global core.editor "vim"

    git config --global commit.gpgsign true

    echo "Remember to configure ssh and gpg ^^"
end

function sshkrl
    eval $(ssh-agent -c)
    ssh-add ~/.ssh/id_ed25519
end
