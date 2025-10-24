eval "$(starship init zsh)"

alias ls='lsd --group-dirs first'
alias ll='ls -Alh'
alias nv='nvim'
alias cl='clear'
alias mux="tmuxinator"
alias dotnetx64="/usr/local/share/dotnet/x64/dotnet"
alias spotify="spotify_player"

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="/Users/sbrewer/.config/scripts:$PATH"
export WEZTERM_CONFIG_FILE="/Users/sbrewer/.config/wezterm/wezterm.lua"
export STARSHIP_CONFIG="/Users/sbrewer/.config/starship/starship.toml"
export EDITOR="nvim"
export NVIM_APPNAME="nvchad"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function sesh-sessions()
{
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -t -T -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    [[ -z "$session" ]] && return
    sesh connect $session
}

zle     -N             sesh-sessions
bindkey -M emacs '\eg' sesh-sessions
bindkey -M vicmd '\eg' sesh-sessions
bindkey -M viins '\eg' sesh-sessions
