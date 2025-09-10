steps with new content:
uv run sphinx-build -b html content _build
git add .
git commit -m "Update documentation: describe your changes"



# Activate the virtual environment and run commands
uv run sphinx-build content _build          # Build documentation
uv run sphinx-autobuild content _build      # Live reload for development
uv run python -c "import sphinx; print(sphinx.__version__)"  # Run any Python command

# Add new dependencies
uv add jupyter                               # Add a new dependency
uv add --dev pytest                         # Add a development dependency

# Update dependencies
uv sync                                      # Install/update all dependencies
uv lock                                     # Update the lock file


# Check what's installed
uv pip list                                  # List installed packages
uv pip show sphinx                          # Show package info

# Python version management
uv python list                              # List available Python versions
uv python pin 3.13.5                       # Pin to specific Python version

