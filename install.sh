#!/bin/bash

# Install chezmoi
if ! command -v chezmoi &> /dev/null; then
  echo "Installing chezmoi..."
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin
fi
