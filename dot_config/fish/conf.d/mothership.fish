# Config

function envsource
    for line in (cat $argv | grep -v '^#' |  grep -v '^\s*$' | sed -e 's/=/ /' -e "s/'//g" -e 's/"//g' )
        set export (string split ' ' $line)
        set -gx $export[1] $export[2]
    end
end

# Test if running in a dev container
if test (whoami) = vscode
    envsource $HOME/.config/mothership/.env
end
