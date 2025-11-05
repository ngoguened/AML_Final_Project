# Contributing Guide

Thank you for contributing to the AML Stock Prediction project! This guide will help you set up your development environment and follow our coding standards.

## Quick Setup

### Prerequisites
- [Conda](https://docs.conda.io/en/latest/miniconda.html) (Miniconda or Anaconda)
- [VSCode](https://code.visualstudio.com/) (recommended)
- Git

### Automated Setup (Recommended)

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd AML_Final_Project
   ```

2. Run the setup script:
   ```bash
   ./setup.sh
   ```

3. Activate the environment:
   ```bash
   conda activate ./.conda
   ```

4. Add your API keys to `.env` file

5. Open VSCode:
   ```bash
   code .
   ```

6. Install recommended extensions when prompted

7. Select the Python interpreter (`./.conda/bin/python`)

### Manual Setup

If you prefer manual setup or the script doesn't work:

1. Create conda environment:
   ```bash
   conda env create -f environment.yml --prefix ./.conda
   ```

2. Activate the environment:
   ```bash
   conda activate ./.conda
   ```

3. Install Jupyter kernel:
   ```bash
   python -m ipykernel install --user --name aml-stock-prediction
   ```

4. Create project directories:
   ```bash
   mkdir -p data/raw data/processed notebooks src tests models
   ```

## Development Workflow

### Code Style

We use the following tools to maintain code quality:

- **Black**: Code formatter (88 character line length)
- **isort**: Import sorting (Black-compatible profile)
- **Ruff**: Fast linting
- **Pyright**: Type checking (basic mode)

VSCode is configured to automatically format and organize imports on save.

### Formatting Code Manually

```bash
# Format with black
black .

# Sort imports
isort .

# Lint with ruff
ruff check .

# Type check
mypy src/
```

### Running Tests

```bash
# Run all tests
pytest

# Run with coverage
pytest --cov=src tests/
```

### Working with Jupyter Notebooks

1. Open a notebook in VSCode
2. Select the kernel: "AML Stock Prediction"
3. Notebooks will auto-format on save

**Best Practices:**
- Keep notebooks focused and well-documented
- Clear outputs before committing (optional)
- Consider extracting reusable code to `src/` modules

## Project Structure

```
AML_Final_Project/
├── .vscode/               # VSCode workspace settings
├── data/
│   ├── raw/              # Original, immutable data
│   └── processed/        # Cleaned, transformed data
├── notebooks/            # Jupyter notebooks for exploration
├── src/                  # Source code modules
├── tests/                # Test files
├── models/               # Saved model files
├── environment.yml       # Conda dependencies
├── setup.sh             # Automated setup script
└── .env                 # API keys (DO NOT COMMIT)
```

## Coding Standards

### Python Code

- Follow PEP 8 style guide (enforced by Black and Ruff)
- Use type hints where possible
- Write docstrings for functions and classes
- Keep functions small and focused
- Avoid hardcoded values; use configuration files

### Example:

```python
from typing import List
import pandas as pd


def calculate_price_change(
    prices: pd.Series,
    window: int = 60
) -> pd.Series:
    """Calculate price change over a time window.

    Args:
        prices: Time series of stock prices
        window: Time window in seconds

    Returns:
        Series of price changes
    """
    return prices.pct_change(window)
```

### Jupyter Notebooks

- Use markdown cells to explain your analysis
- Restart kernel and run all cells before committing
- Keep notebooks under 100 cells when possible
- Extract production code to `src/` modules

## Git Workflow

1. Create a feature branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes and commit:
   ```bash
   git add .
   git commit -m "Add feature description"
   ```

3. Push and create a pull request:
   ```bash
   git push origin feature/your-feature-name
   ```

## Environment Variables

Required API keys (add to `.env`):

```bash
# Twitter API
TWITTER_API_KEY=your_key
TWITTER_API_SECRET=your_secret
TWITTER_ACCESS_TOKEN=your_token
TWITTER_ACCESS_SECRET=your_secret
TWITTER_BEARER_TOKEN=your_bearer_token

# Financial APIs
ALPHA_VANTAGE_KEY=your_key
FINNHUB_API_KEY=your_key
```

**Never commit API keys or secrets to the repository!**

## Getting Help

- Check existing issues and pull requests
- Ask questions in project discussions
- Review the [README.md](README.md) for project overview

## Common Issues

### Conda environment not found in VSCode
1. Press `Cmd+Shift+P` (Mac) or `Ctrl+Shift+P` (Windows/Linux)
2. Type "Python: Select Interpreter"
3. Choose `./.conda/bin/python`

### Import errors
Make sure the conda environment is activated:
```bash
conda activate ./.conda
```

### Formatting not working
Install VSCode extensions:
- Python
- Pylance
- Black Formatter
- Ruff

## License

By contributing, you agree that your contributions will be licensed under the project's license.
