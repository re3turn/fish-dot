test "Check syntax"
    0 = (
        fish -n functions/dot.fish
        echo $status
    )
end

test "not install dot"
    1 = (
        set -l PREV_DOT_SCR $DOT_SCR
        set -e DOT_SCR
        dot
        echo $status
        set DOT_SCR $PREV_DOT_SCR
    )
end

test "bash is not executed"
    1 = (
        set -l PREV_PATH $PATH
        set -l INDEX (contains -i (dirname (which bash)) $PATH)
        set -e PATH[$INDEX]
        dot
        echo $status
        set PATH $PREV_PATH
    )
end

