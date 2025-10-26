# Quantum Autumn School 2025 (QAS2025)

Educational materials and tutorials for the Quantum Autumn School 2025, a 5-day event covering quantum computing with hands-on tutorials and lectures.

## Quick Start

### Prerequisites

- Python 3.10, 3.11, or 3.12 (NOT 3.13+ due to Qrisp compatibility)
- `uv` package manager (recommended) - [Install uv](https://docs.astral.sh/uv/getting-started/installation/)

### Setup Instructions

The workflow is clean and consistent:

```bash
# From project root
uv sync                                          # Install all dependencies
```

Then in VS Code:
- Open `notebooks/getting-started/qrisp-intro.ipynb`
- When prompted, select Python interpreter: **`.venv/bin/python3`**
- Run cells with full IQM and Qiskit support

VS Code automatically detects `.venv/` - no manual kernel registration needed!

### Quick Scripts

For convenience, use these helper scripts:

```bash
./preview.sh    # Start live reload server at http://127.0.0.1:8000
./build.sh      # Build documentation for production
./deploy.sh     # Build, commit, and push to GitHub (triggers deployment)
```

See `SCRIPTS_README.md` for detailed usage.

## Project Structure

```
qas2025/
├── content/                        # Sphinx documentation source
│   ├── conf.py                     # Sphinx configuration
│   ├── index.md                    # Main landing page
│   ├── day0.md - day5.md           # Daily schedules and content
│   └── resources/                  # PDF documents
├── notebooks/                      # Jupyter notebooks
│   └── getting-started/
│       ├── qrisp-starter.ipynb     # Quick start with VQE & Grover examples
│       ├── qrisp-intro.ipynb       # Comprehensive Qrisp tutorial (archived)
│       └── token.txt               # IQM authentication token (gitignored)
├── _build/                         # Build output (gitignored)
├── .venv/                          # Virtual environment (gitignored, uv-managed)
├── pyproject.toml                  # Python dependencies
└── uv.lock                         # Locked dependency versions
```

## Working with Notebooks

### Automated Setup

The fastest way to get started with Qrisp notebooks:

```bash
cd notebooks/getting-started
./setup.sh
```

This script will:
- Install all dependencies (Qrisp, Qiskit, IQM support, Jupyter)
- Verify everything is working
- No manual kernel registration needed - VS Code auto-detects `.venv/`

### Manual Setup

If you prefer to set up manually:

```bash
# From project root
uv sync

# Start Jupyter (optional - or use VS Code)
uv run jupyter notebook
# Navigate to: notebooks/getting-started/qrisp-intro.ipynb
```

### Important: Python Environment Selection

The most common issue is selecting the wrong Python environment in VS Code.

**Solution:**
1. Open the notebook in VS Code
2. Click kernel selector (top-right)
3. Select "Python Environments" → Choose **`.venv/bin/python3`**
4. Run cells

If you see "IQM backend not available", you're using the wrong environment!

## Building Documentation

### Using Scripts

```bash
./preview.sh    # Live reload development server
./build.sh      # Build once for production
```

### Manual Build

```bash
# Build HTML
uv run sphinx-build -b html content _build

# Build with live reload (recommended for development)
uv run sphinx-autobuild content _build --port 8000
# Visit http://127.0.0.1:8000

# Using Makefile
make html         # Build HTML
make livehtml     # Live reload
```

## Deployment

The site is automatically deployed to GitHub Pages when you push to the main branch.

**Production URL**: https://enccs.github.io/qas2025/

To manually deploy:

```bash
./deploy.sh
```

## Dependency Management

```bash
# Add new dependency
uv add <package-name>

# Add dev dependency
uv add --dev <package-name>

# Update all dependencies
uv sync

# Update lock file
uv lock
```

## IQM Quantum Hardware Access

QAS2025 participants have access to IQM Resonance quantum computers.

### Setup

1. Get your token from the exclusive IQM signup link (check your email)
2. Save it to `notebooks/getting-started/token.txt`
3. The token file is gitignored - it won't be committed

### Running on Real Hardware

The notebooks support both simulation and real quantum hardware:

```python
from qrisp.interface import IQMBackend

# Load token
with open('token.txt', 'r') as f:
    iqm_token = f.read().strip()

# Configure backend
iqm_backend = IQMBackend(
    api_token=iqm_token,
    device_instance="garnet"  # IQM 20-qubit system
)

# Run your circuit
results = qf.get_measurement(backend=iqm_backend, shots=1000)
```

## Troubleshooting

### pyenv virtualenv warnings

If you see `VIRTUAL_ENV=/Users/.../... does not match...`:
- Run `unset VIRTUAL_ENV` before uv commands
- Or open a fresh terminal

### "IQM backend not available" Error

**Most common issue!**

**Cause:** Wrong Python environment selected in VS Code.

**Solution:**
1. Click kernel selector (top-right of notebook)
2. Select "Python Environments" → Choose **`.venv/bin/python3`**
3. Restart kernel
4. Run cells again

### Build warnings

Ignore the `FutureWarning` about `get_cssname` in conf.py - this is from sphinx-lesson compatibility.

## Resources

- **Documentation Site**: https://enccs.github.io/qas2025/
- **Qrisp Documentation**: https://qrisp.eu
- **IQM Resonance**: https://resonance.meetiqm.com
- **IQM Academy**: https://www.iqmacademy.com

## Contributing

For detailed information about:
- Project structure and conventions
- Content guidelines
- Jupyter notebook setup
- Build and deployment process

See `CLAUDE.md` for comprehensive documentation.

## Support

- Check the documentation: https://enccs.github.io/qas2025/
- Review the getting-started README: `notebooks/getting-started/README.md`
- Reach out to the organizing team during QAS2025

---

**Quantum Autumn School 2025**
*ENCCS, EuroCC Denmark & Lithuania, with support from WACQT*
