function iterm2_has_fish_mode_prompt -d "Returns true iff fish_mode_prompt is defined and non-empty"
    test (functions fish_mode_prompt | string match -rv '^ *(#|function |end$|$)' | count) = 0
end
