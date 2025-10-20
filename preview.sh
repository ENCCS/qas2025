#!/bin/bash
# preview.sh - Start live preview server with auto-reload
# The server will automatically rebuild when you edit files in content/

echo "Starting live preview server..."
echo "Visit http://127.0.0.1:8000 in your browser"
echo "Press Ctrl+C to stop the server"
echo ""

unset VIRTUAL_ENV && uv run sphinx-autobuild content _build --port 8000
