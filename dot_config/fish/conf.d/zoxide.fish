if type -q zoxide
    # Init

    if status is-interactive
        zoxide init fish | source
    end

    # Alias

    alias cd z
else
    echo "🟡 zoxide not found, skipping..."
end

# Alias
