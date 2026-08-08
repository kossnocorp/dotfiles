# Init

if type -q starship
    starship init fish | source
else
    echo "🟡 Starship not found, skipping..."
end
