function tmux_new_pane_with_path
    if test -n "$TMUX"
        # Use the environment variable to change the directory of the new pane
        if set -q TMUX_PANE_PATH
            cd $TMUX_PANE_PATH
        end
    end
end
