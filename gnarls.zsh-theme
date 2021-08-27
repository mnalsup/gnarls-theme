
_git_prompt () {
  if ! __git_prompt_git rev-parse --git-dir &> /dev/null \
     || [[ "$(__git_prompt_git config --get oh-my-zsh.hide-info 2>/dev/null)" == 1 ]]; then
    return 0
  fi
  echo "${ZSH_THEME_GIT_PROMPT_PREFIX}%15>~>$(current_branch)%>>$(parse_git_dirty)${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

vcs_status() {
    if [[ $(whence in_svn) != "" ]] && in_svn; then
        svn_prompt_info
    elif [[ $(whence in_hg) != "" ]] && in_hg; then
        hg_prompt_info
    else
        _git_prompt 
    fi
}

BASE_COLOR=green
GIT_COLOR=gray
PROMPT='%{$fg_bold[$BASE_COLOR]%}%2~$(vcs_status)%{$fg_bold[$BASE_COLOR]%}%B $ %b'
RPROMPT='[%*]'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[$BASE_COLOR]%} [ %{$reset_color%}%{$fg[$GIT_COLOR]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[$BASE_COLOR]%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●%{$fg[$GIT_COLOR]%}%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%} "
ZSH_THEME_SVN_PROMPT_PREFIX=$ZSH_THEME_GIT_PROMPT_PREFIX
ZSH_THEME_SVN_PROMPT_SUFFIX=$ZSH_THEME_GIT_PROMPT_SUFFIX
ZSH_THEME_SVN_PROMPT_DIRTY=$ZSH_THEME_GIT_PROMPT_DIRTY
ZSH_THEME_SVN_PROMPT_CLEAN=$ZSH_THEME_GIT_PROMPT_CLEAN
ZSH_THEME_HG_PROMPT_PREFIX=$ZSH_THEME_GIT_PROMPT_PREFIX
ZSH_THEME_HG_PROMPT_SUFFIX=$ZSH_THEME_GIT_PROMPT_SUFFIX
ZSH_THEME_HG_PROMPT_DIRTY=$ZSH_THEME_GIT_PROMPT_DIRTY
ZSH_THEME_HG_PROMPT_CLEAN=$ZSH_THEME_GIT_PROMPT_CLEAN

