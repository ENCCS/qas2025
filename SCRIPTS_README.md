# QAS2025 Build Scripts

Quick reference for the shell scripts to build and preview your documentation site.

## Available Scripts

### 🔍 `preview.sh` - Live Preview Server

Start a development server with automatic reload. Any changes you make to files in `content/` will automatically trigger a rebuild and refresh your browser.

```bash
./preview.sh
```

Then visit **http://127.0.0.1:8000** in your browser.

Press `Ctrl+C` to stop the server.

**Use this for:**
- Development and content editing
- Testing changes before deployment
- Writing new documentation pages

---

### 🔨 `build.sh` - Production Build

Build the site once for production (static HTML files).

```bash
./build.sh
```

Output will be in the `_build/` directory.

**Use this for:**
- Testing production builds locally
- Checking for build errors before deploying
- Generating static HTML without auto-reload

---

### 🚀 `deploy.sh` - Build, Commit & Deploy

Build the site, commit your changes, and push to GitHub (triggering automatic deployment to GitHub Pages).

```bash
./deploy.sh
```

The script will:
1. Build the site
2. Ask for a commit message (or use a default one)
3. Commit all changes
4. Push to the `main` branch
5. Trigger automatic GitHub Pages deployment

**Use this for:**
- Deploying updates to the live site
- Publishing new content
- Making your changes visible at https://enccs.github.io/qas2025/

**Important:** Make sure you have write access to the repository before running this script.

---

## Troubleshooting

### Scripts won't run / Permission denied

Make sure the scripts are executable:

```bash
chmod +x preview.sh build.sh deploy.sh
```

### Build errors

If you see build errors:
1. Check your markdown syntax in the `content/` directory
2. Make sure all referenced images/files exist
3. Look for the specific error message in the build output

### Port already in use (preview.sh)

If port 8000 is already in use:
1. Stop any other preview servers (press `Ctrl+C` in the terminal where it's running)
2. Or modify `preview.sh` to use a different port (change `--port 8000`)

---

## Environment Setup

All scripts automatically handle the Python environment using `uv`. They include:

```bash
unset VIRTUAL_ENV && uv run sphinx-build ...
```

This ensures compatibility with `uv` and avoids conflicts with `pyenv`.

---

## Quick Start Workflow

**First time:**
```bash
uv sync                # Install dependencies
./preview.sh           # Start preview server
```

**Daily editing:**
```bash
./preview.sh           # Edit files, see changes live
# When ready to deploy:
./deploy.sh            # Build, commit, and push
```

---

## More Information

- Project docs: See `CLAUDE.md` and `building_steps.md`
- Site URL: https://enccs.github.io/qas2025/
- GitHub Actions: https://github.com/ENCCS/qas2025/actions
