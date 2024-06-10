if status is-interactive
    # Commands to run in interactive sessions can go here
    alias n "nvim"
    alias lvim "/home/adonis/.local/bin/lvim"
    set -U fish_mode_cursor block

    alias ll "ls -alF"

# GitHub Aliases
    alias gst "git status"
    alias gcm "git commit -m"
    alias gcz "git cz commit"
    alias gaa "git add --all"
    alias ga "git add"
    alias gp "git push"
    alias gpf "git push --force"
    alias gpl "git pull"
    alias gsm "git switch main"
    alias gsmp "git switch main && git pull"
    alias gcb "git checkout -b"
    # Add Homebrew to PATH
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    # > /dev/null 2>&1;
 end

function g
    switch $argv[1]
        case "*"
            git $argv
            return
    end
end


set fish_greeting

# pnpm
set -gx PNPM_HOME "/home/adonis/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
