# Qrisp Starter Tutorial

*Get hands-on experience with Qrisp and IQM quantum hardware*

This interactive notebook introduces you to quantum programming with Qrisp and shows you how to run quantum algorithms on real IQM hardware. You'll learn the differences between simulators, mock backends, and actual quantum computers.

:::{admonition} Run notebooks during the school
:class: tip

You can run this notebook and other code examples during the school using Binder - just click the badge below:

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ENCCS/qas2025/HEAD?urlpath=%2Fdoc%2Ftree%2Fnotebooks)

**Binder is free, requires no installation, and runs directly in your browser!** It's pre-configured with all necessary dependencies (including qrisp and IQM interface), so you can start coding immediately without any setup.

Or {download}`download qrisp-starter.ipynb </_static/qrisp-starter.ipynb>` to run locally.

The notebook is self-contained and portable - works with Binder or locally!
:::

## What you'll learn

- Setting up Qrisp with IQM backend support
- Running quantum algorithms on real IQM hardware
- Comparing simulator vs. mock backend vs. real quantum hardware results
- Understanding NISQ (Noisy Intermediate-Scale Quantum) effects

## Prerequisites

- Python 3.10, 3.11, or 3.12 (NOT 3.13+ due to Qrisp compatibility)
- Jupyter notebook environment (VS Code or JupyterLab)
- IQM API token from [IQM Resonance](https://resonance.meetiqm.com/)

:::{admonition} IQM Token Setup
:class: note

You can generate your IQM token from [IQM Resonance](https://resonance.meetiqm.com/) and use it in two ways:

1. **Save as file**: Create a `token.txt` file in the same directory as your notebook and save your token there
2. **Paste directly**: Copy and paste your token explicitly in the notebook code

The notebook will show you how to read from the token file or use it directly.
:::

:::{important}
**Credit Costs**: Running on real IQM hardware (Sirius) consumes credits at 0.30 credits/second. The notebook includes a **free mock backend** and **local simulator** for testing without using credits.
:::

---

## Interactive tutorial

**[View the complete notebook on the next page →](qrisp-starter)**

The notebook is rendered on a separate page with syntax highlighting, outputs, and full interactivity preview. Click the link above or navigate using the sidebar.

:::{tip}
After viewing the notebook, don't forget to download it using the link at the top of this page to run it on your own machine!
:::

---

:::{seealso}
**Related resources:**
- [Day 0: Pre-Event Information](../../content/day0.md) - More preparation materials
- [Qrisp Official Website](https://qrisp.eu/) - Documentation and examples
- [IQM Academy](https://www.iqmacademy.com/) - Additional quantum computing tutorials
:::
