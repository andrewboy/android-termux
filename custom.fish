#if [ -f /usr/bin/screenfetch ]; then screenfetch; fi
if test -f /data/data/com.termux/files/usr/bin/fastfetch
  fastfetch
end

starship init fish | source

alias cat="bat"
alias lsx="eza --icons --octal-permissions"
alias ll="lsx -la"
alias pn="pnpm"
