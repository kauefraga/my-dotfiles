# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# jdk
set --export JAVA_HOME /usr/lib/jvm/jdk-21-oracle-x64

# gatling
set --export GATLING_HOME $HOME/gatling

# ruby
set --export GEM_HOME "$HOME/.gems"
set --export PATH $HOME/.gems/bin $PATH

# neovim
set --export PATH /opt/nvim-linux64/bin $PATH

# golang
set --export PATH /usr/local/go/bin $PATH

# rust
set --export PATH $HOME/.cargo/bin $PATH

# java
set --export PATH $JAVA_HOME $PATH

# anime archive
set --export PATH $HOME/www/anime-archive/bin/linux $PATH

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
alias gb='git branch'

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

if set -q ZELLIJ
else
  zellij
end
