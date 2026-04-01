#!/usr/bin/env bash

# This script automatically creates a fixup commit and rebases the last two commits.

git commit --fixup HEAD
git rebase -i --autosquash HEAD~2
