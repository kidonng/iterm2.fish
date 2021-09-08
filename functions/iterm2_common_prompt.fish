function iterm2_common_prompt
    set -l last_status $status

    iterm2_status $last_status
    iterm2_write_remotehost_currentdir_uservars

    if ! functions iterm2_fish_prompt | string match -q "*iterm2_prompt_mark*"
        iterm2_prompt_mark
    end

    return $last_status
end
