# Quantum Autumn School 2025 (QAS2025)

materials and tutorials for the Quantum Autumn School 2025, a 5-day event covering quantum computing with hands-on tutorials and lectures.

### Prerequisites

- Python 3.10, 3.11, or 3.12 (NOT 3.13+ due to Qrisp compatibility)
- `uv` package manager (recommended) - [Install uv](https://docs.astral.sh/uv/getting-started/installation/)

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



## Resources

- **Documentation Site**: https://enccs.github.io/qas2025/
- **Qrisp Documentation**: https://qrisp.eu
- **IQM Resonance**: https://resonance.meetiqm.com
- **IQM Academy**: https://www.iqmacademy.com

---

**Quantum Autumn School 2025**
*ENCCS, EuroCC Denmark & Lithuania, with support from WACQT*
