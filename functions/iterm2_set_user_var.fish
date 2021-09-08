function iterm2_set_user_var
    printf "\033]1337;SetUserVar=%s=%s\007" "$argv[1]" (printf "%s" "$argv[2]" | base64 | tr -d "\n")
end
