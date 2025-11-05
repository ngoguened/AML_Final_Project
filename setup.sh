#!/bin/bash

# Setup script for AML Stock Prediction Project
# This script sets up the conda environment and VSCode configuration

set -e  # Exit on error

echo "=========================================="
echo "AML Stock Prediction - Development Setup"
echo "=========================================="
echo ""

# Check if conda is installed
if ! command -v conda &> /dev/null; then
    echo "Error: conda is not installed or not in PATH"
    echo "Please install Miniconda or Anaconda first:"
    echo "https://docs.conda.io/en/latest/miniconda.html"
    exit 1
fi

echo "Step 1: Creating conda environment from environment.yml..."
conda env create -f environment.yml --prefix ./.conda

echo ""
echo "Step 2: Activating environment..."
# Note: This activation is for the script only
eval "$(conda shell.bash hook)"
conda activate ./.conda

echo ""
echo "Step 3: Setting up Jupyter kernel..."
python -m ipykernel install --user --name aml-stock-prediction --display-name "AML Stock Prediction"

echo ""
echo "Step 4: Creating project directories..."
mkdir -p data/raw data/processed
mkdir -p notebooks
mkdir -p src
mkdir -p tests
mkdir -p models

echo ""
echo "Step 5: Creating .env template..."
if [ ! -f .env ]; then
    cat > .env << EOF
# Twitter API Credentials
TWITTER_API_KEY=your_api_key_here
TWITTER_API_SECRET=your_api_secret_here
TWITTER_ACCESS_TOKEN=your_access_token_here
TWITTER_ACCESS_SECRET=your_access_secret_here
TWITTER_BEARER_TOKEN=your_bearer_token_here

# Financial Data API Keys
ALPHA_VANTAGE_KEY=your_alpha_vantage_key_here
FINNHUB_API_KEY=your_finnhub_key_here
EOF
    echo "Created .env template file (add your API keys)"
else
    echo ".env file already exists, skipping..."
fi

echo ""
echo "=========================================="
echo "Setup Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Activate the environment:"
echo "   conda activate ./.conda"
echo ""
echo "2. Add your API keys to the .env file"
echo ""
echo "3. Open VSCode in this directory:"
echo "   code ."
echo ""
echo "4. VSCode will prompt you to install recommended extensions"
echo "   Click 'Install' to get all the Python and Jupyter tools"
echo ""
echo "5. Select the Python interpreter:"
echo "   - Press Cmd+Shift+P (Mac) or Ctrl+Shift+P (Windows/Linux)"
echo "   - Type 'Python: Select Interpreter'"
echo "   - Choose './.conda/bin/python'"
echo ""
echo "Happy coding!"
