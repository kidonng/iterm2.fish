if ! status -i || test "$ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX$TERM" = screen || test "$TERM" = dumb || test "$TERM" = linux
    exit
end

function iterm2_preexec -e fish_preexec
    # For other shells we would output status here but we can't do that in fish.
    printf "\033]133;C;\007"
end

functions -c fish_prompt iterm2_fish_prompt

if iterm2_has_fish_mode_prompt
    # Only override fish_mode_prompt if it is non-empty. This works around a problem created by a
    # workaround in starship: https://github.com/starship/starship/issues/1283
    functions -c fish_mode_prompt iterm2_fish_mode_prompt
    function fish_mode_prompt -d 'Write out the mode prompt; do not replace this. Instead, change fish_mode_prompt before sourcing .iterm2_shell_integration.fish, or modify iterm2_fish_mode_prompt instead.'
        iterm2_common_prompt
        iterm2_fish_mode_prompt
    end

    function fish_prompt -d 'Write out the prompt; do not replace this. Instead, change fish_prompt before sourcing .iterm2_shell_integration.fish, or modify iterm2_fish_prompt instead.'
        # Remove the trailing newline from the original prompt. This is done
        # using the string builtin from fish, but to make sure any escape codes
        # are correctly interpreted, use %b for printf.
        printf "%b" (string join "\n" (iterm2_fish_prompt))

        iterm2_prompt_end
    end
else
    # fish_mode_prompt is empty or unset.
    function fish_prompt -d 'Write out the mode prompt; do not replace this. Instead, change fish_mode_prompt before sourcing .iterm2_shell_integration.fish, or modify iterm2_fish_mode_prompt instead.'
        iterm2_common_prompt

        # Remove the trailing newline from the original prompt. This is done
        # using the string builtin from fish, but to make sure any escape codes
        # are correctly interpreted, use %b for printf.
        printf "%b" (string join "\n" (iterm2_fish_prompt))

        iterm2_prompt_end
    end
end

iterm2_write_remotehost_currentdir_uservars
printf "\033]1337;ShellIntegrationVersion=15;shell=fish\007"
