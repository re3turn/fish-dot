@test "Check syntax" \
    0 = (
        fish -n functions/dot.fish
        echo $status
    )

@test "Not set DOT_SCR" \
    "1" = (
        set -l PREV_DOT_SCR $DOT_SCR
        set -e DOT_SCR
        dot > /dev/null 2>&1
        echo $status
        set DOT_SCR $PREV_DOT_SCR
    )

@test "Not install dot" \
    "1" = (
        set -l PREV_DOT_SCR $DOT_SCR
        set DOT_SCR /not_exist_path.....
        dot > /dev/null 2>&1
        echo $status
        set DOT_SCR $PREV_DOT_SCR
    )

@test "Bash is not executed" \
    "1" = (
        set -l PREV_PATH $PATH
        set -l INDEX (contains -i (dirname (which bash)) $PATH)
        set -e PATH[$INDEX]
        dot > /dev/null 2>&1
        echo $status
        set PATH $PREV_PATH
    )

