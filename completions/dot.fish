function __fish_dot_needs_command
    set cmd (commandline -opc)
    if test (count $cmd) -eq 1 -a $cmd[1] = "dot"
        return 0
    end
    return 1
end

function __fish_dot_using_command
    set cmd (commandline -opc)
    if test (count $cmd) -gt 1
        if test $argv[1] = $cmd[2]
            return 0
        end
    end
    return 1
end

complete -f -c dot -n '__fish_dot_needs_command' -s h -l help -d "Show the help message"
complete -f -c dot -n '__fish_dot_needs_command' -s H -l help-all -d "Show man page"
complete -f -c dot -n '__fish_dot_needs_command' -s c -l config -d "Specify configuration file to overload"

complete -f -c dot -n '__fish_use_subcommand' -a clone -d "Clone dotfile repository on your computer with git"
complete -f -c dot -n "__fish_dot_using_command clone" -s f -l force -d "Never prompt"

complete -f -c dot -n '__fish_use_subcommand' -a pull -d "Pull the directory from the remote dotfiles repository"
complete -f -c dot -n "__fish_dot_using_command pull" -l self -d "Update 'dot' itself"

complete -f -c dot -n '__fish_use_subcommand' -a cd -d "Change directory to 'dotdir'"

complete -f -c dot -n '__fish_use_subcommand' -a list -d "Show the list which files will be managed by dot"

complete -f -c dot -n '__fish_use_subcommand' -a check -d "Check the files are correctly linked to the right places"

complete -f -c dot -n '__fish_use_subcommand' -a set -d "Set the symbolic links interactively"
complete -f -c dot -n "__fish_dot_using_command set" -s i -l ignore -d "No interaction mode (skip all conflicts and do nothing)"
complete -f -c dot -n "__fish_dot_using_command set" -s f -l force -d "Ignore conflicts and force make symbolic links"
complete -f -c dot -n "__fish_dot_using_command set" -s b -l backup -d "Ignore conflicts, make symbolic links and create its original backup"
complete -f -c dot -n "__fish_dot_using_command set" -s v -l verbose -d "Print verbose messages"

complete -f -c dot -n '__fish_use_subcommand' -a update -d "Combined command of 'pull' and 'set' commands"
complete -f -c dot -n "__fish_dot_using_command update" -s i -l ignore -d "No interaction mode (skip all conflicts and do nothing)"
complete -f -c dot -n "__fish_dot_using_command update" -s f -l force -d "Ignore conflicts and force make symbolic links"
complete -f -c dot -n "__fish_dot_using_command update" -s b -l backup -d "Ignore conflicts, make symbolic links and create its original backup"
complete -f -c dot -n "__fish_dot_using_command update" -s v -l verbose -d "Print verbose messages"

complete -f -c dot -n '__fish_use_subcommand' -a add -d "Move the file to the dotfiles directory and make its symbolic link to that place"
complete -f -c dot -n "__fish_dot_using_command add" -s m -d "Add your comment for dotlink file"

complete -f -c dot -n '__fish_use_subcommand' -a edit -d "Edit dotlink file"

complete -f -c dot -n '__fish_use_subcommand' -a unlink -d "Unlink the selected symbolic links and copy from its original"

complete -f -c dot -n '__fish_use_subcommand' -a clear -d "Remove the all symbolic links in 'dotlink'"
complete -f -c dot -n '__fish_use_subcommand' -a config -d "Edit (or create if it does not exist) rcfile 'dotrc'"

