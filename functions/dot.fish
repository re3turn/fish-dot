function dot --description "dotfiles manager 'dot' for fish-shell"
    if test -z $DOT_SCR
        echo "Please 'set -U DOT_SCR <dot_source_ource_clone_repository>'"
        return 1
    end

    if not test -e $DOT_SCR/dot.sh
        echo "dot is not installed."
        return 1
    end

    if not type -fq bash
        echo "bash is not executed."
        return 1
    end

    command bash -c "source \"$DOT_SCR/dot.sh\" && dot_main $argv"
end

