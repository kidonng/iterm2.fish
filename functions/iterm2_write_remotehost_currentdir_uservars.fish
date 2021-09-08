function iterm2_write_remotehost_currentdir_uservars
    if not set -q -g iterm2_hostname
        printf "\033]1337;RemoteHost=%s@%s\007\033]1337;CurrentDir=%s\007" $USER (hostname -f 2> /dev/null) $PWD
    else
        printf "\033]1337;RemoteHost=%s@%s\007\033]1337;CurrentDir=%s\007" $USER $iterm2_hostname $PWD
    end

    # Users can define a function called iterm2_print_user_vars.
    # It should call iterm2_set_user_var and produce no other output.
    if functions -q -- iterm2_print_user_vars
        iterm2_print_user_vars
    end
end
