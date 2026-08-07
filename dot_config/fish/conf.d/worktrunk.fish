if type -q wt
    wt config shell init fish | source
else
    echo "🟡 worktrunk not found, skipping..."
end
