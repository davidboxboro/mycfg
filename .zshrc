# add local bin to PATH
export PATH="$PATH:/storage/davidlu/bin"
export PATH="$PATH:/storage/davidlu/scripts"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/storage/davidlu/lib/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/storage/davidlu/lib/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/storage/davidlu/lib/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/storage/davidlu/lib/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# shell prompt
autoload -U colors && colors
envstr=""
if [ ! -z "$CONDA_DEFAULT_ENV" ]; then 
  envstr="($CONDA_DEFAULT_ENV) "
fi
c1=%{$fg[white]%}
c2=%{$fg[red]%}
c3=%{$fg[cyan]%}
PS1="$c1$envstr$c2%n@%m ${c3}[%2d] $c1$ "

# zsh autocomplete
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

# fasd
eval "$(fasd --init auto)"
alias v='f -e nvim' # quick opening files with vim
alias m='f -e more'
alias t='f -e tail'

# alias for nvim
alias vim="nvim"
alias vi="nvim"

# view markdown file
md() {
    if [ "$#" != "1" ]; then
        echo "Usage: md [some_file.md]"
        return 1
    fi
    pandoc $1 | lynx -stdin
}
