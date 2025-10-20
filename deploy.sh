#!/bin/bash
# deploy.sh - Build, commit, and deploy to GitHub Pages
# This will build the site and push to main branch, triggering automatic deployment

echo "Building site for deployment..."
echo ""

# Build the site
unset VIRTUAL_ENV && uv run sphinx-build -b html content _build

if [ $? -ne 0 ]; then
    echo ""
    echo "✗ Build failed! Deployment aborted."
    exit 1
fi

echo ""
echo "✓ Build succeeded!"
echo ""

# Ask for commit message
read -p "Enter commit message (or press Enter for default): " COMMIT_MSG

if [ -z "$COMMIT_MSG" ]; then
    COMMIT_MSG="Update documentation"
fi

echo ""
echo "Committing changes..."
git add .
git commit -m "$COMMIT_MSG"

if [ $? -ne 0 ]; then
    echo ""
    echo "No changes to commit, or commit failed."
    echo "Attempting to push existing commits..."
fi

echo ""
echo "Pushing to GitHub..."
git push origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✓ Successfully pushed to GitHub!"
    echo "GitHub Actions will automatically deploy your site."
    echo "Check deployment status at: https://github.com/ENCCS/qas2025/actions"
else
    echo ""
    echo "✗ Push failed! Please check your git configuration."
    exit 1
fi
