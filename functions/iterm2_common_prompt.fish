function iterm2_common_prompt
    set -l last_status $status

    iterm2_status $last_status
    iterm2_write_remotehost_currentdir_uservars
    if not functions iterm2_fish_prompt | grep iterm2_prompt_mark >/dev/null
        iterm2_prompt_mark
    end
    sh -c "exit $last_status"
end
