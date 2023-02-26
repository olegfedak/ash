# name: ash.zsh-theme
# author: Oleg Fedak, olegfedak.com
# description: My optimised oh-my-zsh theme breaking the prompt lines and setting gaps

# break the line for readability
PROMPT='%m ✧ %3d $(git_super_status)
✧ '
RPROMPT=''

# git info
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" *"
ZSH_THEME_GIT_PROMPT_CLEAN=" "

# git status
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[magenta]%}°"
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_STAGED=" %{$fg[green]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS=" %{$fg[red]%}%{×%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED=" %{$fg[yellow]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[yellow]%}-"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[cyan]%}%{…%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD=" %{↑%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND=" %{↓%G%}"
ZSH_THEME_GIT_PROMPT_STASHED=" %{$fg_bold[cyan]%}%{⚑%G%}"

# define the colours to be used for commands
# default
ZSH_HIGHLIGHT_STYLES[default]='fg=blue' 
# unknown
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
# commands
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[alias]='fg=blue'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=magenta'              # function like 'echo'
ZSH_HIGHLIGHT_STYLES[function]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[command]='fg=blue'                 # just simple command
ZSH_HIGHLIGHT_STYLES[precommand]='fg=magenta'           # for example, sudo in sudo cp ...
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=magenta'     # && || ;
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=blue'          # command in the paths (hashed)
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=cyan'
# path
ZSH_HIGHLIGHT_STYLES[path]='fg=blue'                            
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=blue'                     
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=blue'                          
# shell
ZSH_HIGHLIGHT_STYLES[globbing]='fg=cyan'                 # template like /dev/sda*
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=blue'
ZSH_HIGHLIGHT_STYLES[assign]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan'   # "$VARIABLE"
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'     # \"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=blue'            # `command`
ZSH_HIGHLIGHT_STYLES[arg0]='fg=blue'

# quotes
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=green' 
# pattern
# ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
# root
# ZSH_HIGHLIGHT_STYLES[root]='bg=red'

# empty line as a gap
# before new promptline starting the second
function precmd_blank() {
  precmd() {
    echo ''
  } 
}
precmd_functions+=precmd_blank

# empty line after the command's enter
function preexec_blank() {
  echo 
}
preexec_functions+=preexec_blank

# remove the blanks when it's needing
# before new promptline
function remove_blank() {
  precmd() {} 
}
# 1 correct 'clear' without blank
alias clear="remove_blank && clear"
# 2  
alias cd="remove_blank && cd"
