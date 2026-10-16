source /etc/environment
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/IronKommander/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt autocd beep notify
# End of lines configured by zsh-newuser-install
eval "$(starship init zsh)"
export EDITOR="nvim"
export VISUAL="$EDITOR"
alias rm='sudo rm -i'
alias config='/usr/bin/git --git-dir=/home/IronKommander/.cfg/ --work-tree=/home/IronKommander'
PROMPT_EOL_MARK=''
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/home/IronKommander/.cargo/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/home/IronKommander/spring-4.0.2/bin"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gs='git status'
alias ga='git add .'
alias gp='git push'
alias vim='nvim'
alias v='nvim .'
alias c='clear'
alias ff='fastfetch'
alias clock='tty-clock -C 7 -b -B -c'
alias yt-music='yt-dlp -x --audio-format opus --add-metadata --embed-thumbnail'
alias sybau='yay -Syu'
bindkey "\e[3~" delete-char
bindkey -v
export KEYTIMEOUT=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

wallpaper() {
  [[ -z $1 ]] && return 1
  local img=$1

  if ! command -v hyprctl >/dev/null; then
    echo "wallpaper: hyprctl not found in PATH" >&2
    return 1
  fi

  local tries=0
  while ! hyprctl monitors >/dev/null 2>&1; do
    ((tries++)) || true
    (( tries > 12 )) && { echo "wallpaper: hyprland not responding" >&2; return 1; }
    sleep 0.25
  done

  hyprctl hyprpaper unload all || echo "unload failed" >&2
  hyprctl hyprpaper preload "$img" || echo "preload failed" >&2

  local -a MONITORS
  MONITORS=("${(@f)$(hyprctl monitors | awk '/Monitor/ {print $2}')}")
  if (( ${#MONITORS[@]} == 0 )); then
    MONITORS=("${(@f)$(hyprctl monitors | awk '/Monitor/ {print $NF}')}")
  fi

  if (( ${#MONITORS[@]} == 0 )); then
    echo "wallpaper: couldn't parse monitors output" >&2
    hyprctl monitors | sed -n '1,20p' >&2
    return 1
  fi

  for m in "${MONITORS[@]}"; do
    hyprctl hyprpaper wallpaper "$m,$img" || echo "set wallpaper for $m failed" >&2
  done

  return 0
}

#GAMES
alias hk="WINEPREFIX=~/Games/HK_PREF PROTONPATH=GE-Proton umu-run ~/Games/Hollow\ Knight/hollow_knight.exe"
alias uk="WINEPREFIX=~/Games/UK_PREF PROTONPATH=GE-Proton umu-run ~/Games/ULTRAKILL/ULTRAKILL.exe"
alias gta4='WINEPREFIX=~/Games/GTA4_PREF/ PROTONPATH=GE-Proton umu-run "~/Games/Grand Theft Auto IV - The Complete Edition/GTAIV.exe"'
alias mw3='WINEPREFIX=~/Games/MW3_PREF PROTONPATH=GE-Proton umu-run "~/Games/Call of Duty - Modern Warfare 3/iw5sp.exe"'
# alias sekiro='cd ~/Games/Sekiro/ && LD_PRELOAD="" WINEPREFIX=~/Games/SEKIRO_PREF PROTONPATH=GE-Proton DXVK_ASYNC=1 MESA_VK_WSI_PRESENT_MODE=immediate gamemoderun gamescope -W 1920 -H 1200 -w 576 -h 360 -r 60 -f -F fsr --force-grab-cursor -- umu-run "~/Games/Sekiro/sekiro.exe"'
alias eldenring="WINEPREFIX=~/Games/ELDENRING PROTONPATH=GE-Proton umu-run '/mnt/windows/Games/ELDEN RING/Game/eldenring.exe'"
# alias sekiro = "cd ~/Games/Sekiro/ && LD_PRELOAD="" WINEPREFIX=~/Games/SEKIRO_PREF GAMEID=umu-814380 PROTONPATH=GE-Proton gamemoderun umu-run sekiro.exe"
