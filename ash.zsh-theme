# name: ash.zsh-theme
# author: Oleg Fedak, olegfedak.com
# description: My optimised oh-my-zsh theme breaking the prompt lines and setting gaps

# experimental naming art:                                  
#                            ✧ ✧   ✧ ✧
#                           ✧  ✧  ✧  ✧                  ✧ 
#                          ✧     ✧  ✧                    
#                     ✧ ✧ ✧ ✧   ✧ ✧   ✧ ✧     ✧ ✧   ✧ ✧    ✧ ✧  
#                        ✧     ✧    ✧    ✧  ✧    ✧   ✧   ✧    ✧
#                       ✧   ✧ ✧    ✧ ✧ ✧   ✧     ✧  ✧   ✧   ✧
#                   ✧  ✧     ✧    ✧       ✧     ✧  ✧   ✧     
#                 ✧   ✧     ✧     ✧    ✧  ✧    ✧  ✧    ✧    ✧
#                 ✧ ✧        ✧ ✧   ✧ ✧     ✧  ✧    ✧ ✧  ✧ ✧
#                                       ✧    ✧
#                                        ✧ ✧  

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
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[cyan]%}%{…%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD=" %{↑%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND=" %{↓%G%}"
ZSH_THEME_GIT_PROMPT_STASHED=" %{$fg_bold[cyan]%}%{⚑%G%}"

# define the colours to be used for commands
ZSH_HIGHLIGHT_STYLES[default]='fg=blue'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=blue'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=blue'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=cyan'

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
