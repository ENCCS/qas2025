#!/bin/bash
# build.sh - Build the site for production (static HTML)
# Output will be in _build/

echo "Building site..."

unset VIRTUAL_ENV && uv run sphinx-build -b html content _build

if [ $? -eq 0 ]; then
    echo ""
    echo "✓ Build succeeded!"
    echo "HTML files are in _build/"
    echo ""
    echo "To view locally, you can run:"
    echo "  open _build/index.html"
else
    echo ""
    echo "✗ Build failed!"
    exit 1
fi
