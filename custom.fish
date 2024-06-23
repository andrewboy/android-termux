#if [ -f /usr/bin/screenfetch ]; then screenfetch; fi
if test -f /data/data/com.termux/files/usr/bin/fastfetch
  fastfetch
end

function youtube_download_video
  set -l url $argv[1]
  set -l download_path "$HOME/storage/downloads/youtube-dl"
  set -l file_name "%(title)s.%(ext)s"

  yt-dlp -c -i "$url" -o "$download_path/$file_name"
end

function youtube_download_audio
  set -l url $argv[1]
  set -l download_path "$HOME/storage/downloads/youtube-dl"
  set -l file_name "%(title)s.%(ext)s"

  yt-dlp -x --audio-format "mp3" -c -i "$url" -o "$download_path/$file_name"
end

function download_youtube_video
  set -l url=$argv[1]
  # set -l download_path="$HOME/storage/downloads/youtube-dl"
  set -l file_name="%(title)s.%(ext)s"

  # yt-dlp -c -i "$url" -o "$download_path/$file_name"
  yt-dlp -c -i "$url" -o "$file_name"

starship init fish | source

alias cat="bat"
alias lsx="eza --icons --octal-permissions"
alias ll="lsx -la"
alias pn="pnpm"
alias ytdlv="youtube_download_video"
alias ytdla="youtube_download_audio"
