function iterm2_has_fish_mode_prompt -d "Returns true iff fish_mode_prompt is defined and non-empty"
    if test (functions fish_mode_prompt | grep -vE '^ *(#|function |end$|$)' | wc -l) = 0
        echo -n false
    else
        echo -n true
    end
end