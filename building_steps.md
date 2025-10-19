# Quick Start - Simple Build Steps

## First time setup (already done!)
uv sync                                    # Install all dependencies

## Build documentation once (for production)
unset VIRTUAL_ENV && uv run sphinx-build -b html content _build

## Build with live reload (for development - auto-refreshes in browser)
unset VIRTUAL_ENV && uv run sphinx-autobuild content _build

## View your built documentation
# After building, open _build/index.html in your browser
# Or if using autobuild, go to http://127.0.0.1:8000

## Note:
# The 'unset VIRTUAL_ENV' ensures no pyenv conflicts
# In a fresh terminal window, you can omit it (pyenv won't auto-activate anymore)


---

# Steps to update GitHub Pages with new content:
unset VIRTUAL_ENV && uv run sphinx-build -b html content _build    # Build static HTML
git add .
git commit -m "Update documentation: describe your changes"
git push origin main                                                # Push to trigger GitHub Pages deployment



# Run commands with uv (manages virtual environment automatically)
unset VIRTUAL_ENV && uv run sphinx-build -b html content _build     # Build documentation
unset VIRTUAL_ENV && uv run sphinx-autobuild content _build         # Live reload for development
unset VIRTUAL_ENV && uv run python -c "import sphinx; print(sphinx.__version__)"  # Run any Python command

# Add new dependencies
uv add jupyter                               # Add a new dependency
uv add --dev pytest                         # Add a development dependency

# Update dependencies
unset VIRTUAL_ENV && uv sync                # Install/update all dependencies
uv lock                                     # Update the lock file


# Check what's installed
uv pip list                                  # List installed packages
uv pip show sphinx                          # Show package info

# Python version management
uv python list                              # List available Python versions
uv python pin 3.13.5                       # Pin to specific Python version

