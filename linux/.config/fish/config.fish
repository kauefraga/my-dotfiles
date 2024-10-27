# -- asdf
source ~/.asdf/asdf.fish

# -- bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# -- jdk
# set --export JAVA_HOME /usr/lib/jvm/jdk-21-oracle-x64

# -- gatling
# set --export GATLING_HOME $HOME/gatling

# -- ruby
# set --export GEM_HOME "$HOME/.gems"
# set --export PATH $HOME/.gems/bin $PATH

# -- $path
set --export PATH /opt/nvim-linux64/bin $PATH # neovim
set --export PATH /usr/local/go/bin $PATH # go
set --export PATH $HOME/.cargo/bin $PATH # rust
set --export PATH $HOME/.bun/bin $PATH # bun
# set --export PATH $JAVA_HOME $PATH # java

set --export PATH $HOME/go/bin $PATH # go binaries
set --export PATH $HOME/.local/bin $PATH
# set --export PATH $HOME/www/anime-archive/bin/linux $PATH # anime archive

set --export FLYCTL_INSTALL "$HOME/.fly"
set --export PATH "$FLYCTL_INSTALL/bin:$PATH" $PATH

# -- configs
set --export GPG_TTY $(tty)

starship init fish | source

zoxide init fish | source

# -- aliases
alias vim='nvim'
alias python='python3'
alias pip='pip3'
alias ca='cargo'
alias bat='batcat'

# -- git aliases
alias g='git'
alias ga='git add'
alias gc='git commit'
alias up='git push'
alias down='git pull'
alias gcm='git commit -m'
alias gs='git status'
alias gssb='git status -sb'
alias gl='git log --oneline'
alias gb='git branch'
alias gch='git checkout'
alias co='git checkout'

# -- functions
function gitsetup
    git config --global user.email "88486000+kauefraga@users.noreply.github.com"
    git config --global user.name "Kauê Fraga Rodrigues"
    git config --global core.editor nvim

    git config --global commit.gpgsign true

    echo "Remember to configure ssh and gpg ^^"
end

function sshkrl
    eval $(ssh-agent -c)
    ssh-add ~/.ssh/id_ed25519
end

function openproject -d "open vscode in a specific profile"
    z $argv[1]
    code . --profile $argv[2]
end

alias opr='openproject'
