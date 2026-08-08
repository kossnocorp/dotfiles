# Initialize mise

if type -q mise
    if status is-interactive
        mise activate fish | source
    else
        mise activate fish --shims | source
    end
else
    echo "🟡 mise-en-place not found, skipping..."
end
