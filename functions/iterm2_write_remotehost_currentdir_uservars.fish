# If hostname -f is slow for you, set iterm2_hostname in your fish config
set -q iterm2_hostname ||
    # hostname -f is fast on macOS so don't cache it. This lets us get an updated version when
    # it changes, such as if you attach to a VPN.
    test (uname) != Darwin &&
    # some flavors of BSD (i.e. NetBSD and OpenBSD) don't have the -f option
    set -l iterm2_hostname (hostname -f 2>/dev/null) ||
    set -l iterm2_hostname (hostname)

function iterm2_write_remotehost_currentdir_uservars -V iterm2_hostname
    if set -q iterm2_hostname
        printf "\033]1337;RemoteHost=%s@%s\007\033]1337;CurrentDir=%s\007" $USER $iterm2_hostname $PWD
    else
        printf "\033]1337;RemoteHost=%s@%s\007\033]1337;CurrentDir=%s\007" $USER (hostname -f 2>/dev/null) $PWD
    end

    # Users can define a function called iterm2_print_user_vars.
    # It should call iterm2_set_user_var and produce no other output.
    if functions -q -- iterm2_print_user_vars
        iterm2_print_user_vars
    end
end
