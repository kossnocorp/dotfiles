# Init

if type -q atuin
    if status is-interactive
        # NOTE: Figure out how to disable up key handling
        # atuin init fish | source
    end
else
    echo "🟡 atuin not found, skipping..."
end
