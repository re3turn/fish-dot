function dot --description "dotfiles manager 'dot' for fish-shell"

    if not test -e $DOT_SCR/dot.sh
        echo "dot is not installed."
        return 1
    end

    if not type -fq bash
        echo "bash is not executed."
        return 1
    end

    bash -c "source \"$DOT_SCR/dot.sh\" && dot_main $argv"
end

