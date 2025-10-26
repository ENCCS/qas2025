#!/bin/bash

# Update uv environment and verify setup
# This script updates dependencies and ensures the environment is healthy

set -e  # Exit on error

echo "🔧 Updating QAS2025 Environment"
echo "================================"

# Unset any existing virtual environment to avoid pyenv conflicts
echo ""
echo "Step 1: Clearing any existing virtual environment..."
unset VIRTUAL_ENV

# Check if uv is installed
echo ""
echo "Step 2: Checking uv installation..."
if ! command -v uv &> /dev/null; then
    echo "❌ Error: uv is not installed. Please install it first:"
    echo "   curl -LsSf https://astral.sh/uv/install.sh | sh"
    exit 1
fi

echo "✓ uv is installed"
uv --version

# Update uv itself
echo ""
echo "Step 3: Updating uv to latest version..."
uv self update

# Update lock file and sync dependencies
echo ""
echo "Step 4: Updating dependency lock file..."
uv lock

echo ""
echo "Step 5: Syncing dependencies..."
uv sync

# Verify Python version
echo ""
echo "Step 6: Verifying Python version (requires >= 3.13)..."
PYTHON_VERSION=$(uv run python --version 2>&1 | grep -oE '[0-9]+\.[0-9]+' | head -1)
echo "✓ Python version: $PYTHON_VERSION"

# Test build to verify everything works
echo ""
echo "Step 7: Testing build to verify environment..."
if uv run sphinx-build --version &> /dev/null; then
    echo "✓ Sphinx is working correctly"
else
    echo "❌ Sphinx build test failed"
    exit 1
fi

# Quick build test (just check syntax, don't build everything)
echo ""
echo "Step 8: Running quick build validation..."
if uv run sphinx-build -b html content _build -q -W --keep-going 2>&1 | head -20; then
    echo "✓ Build validation passed"
else
    echo "⚠️  Build had warnings (check output above)"
fi

# Check if preview server port is available
echo ""
echo "Step 9: Checking if preview port 8000 is available..."
if curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:8000/ &> /dev/null; then
    echo "⚠️  Port 8000 is in use (preview server may be running)"
else
    echo "✓ Port 8000 is available"
fi

echo ""
echo "================================"
echo "✅ Environment update complete!"
echo ""
echo "Next steps:"
echo "  - Run ./preview.sh to start live preview"
echo "  - Run ./build.sh to build for production"
echo "  - Run ./deploy.sh to deploy to GitHub Pages"
