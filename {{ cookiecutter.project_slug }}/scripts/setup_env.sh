#!/bin/bash
# setup_env.sh - Setup the development environment

set -e  # Exit immediately if a command exits with a non-zero status

# Define colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Setting up development environment...${NC}"

# Define Python version from params or use default
VENV_PATH="./venv"

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo -e "${YELLOW}Python 3 is not installed. Please install Python 3 and try again.${NC}"
    exit 1
fi

# Create virtual environment
echo -e "${GREEN}[01] Creating virtual environment...${NC}"
if [ ! -d "$VENV_PATH" ]; then
    python3 -m venv $VENV_PATH
    echo "Virtual environment created at $VENV_PATH"
else
    echo "Virtual environment already exists at $VENV_PATH"
fi

# Activate virtual environment depending on the OS
if [[ "$OSTYPE" == "linux-gnu"* ]] || [[ "$OSTYPE" == "darwin"* ]]; then
    source $VENV_PATH/bin/activate
elif [[ "$OSTYPE" == "msys" ]]; then
    source $VENV_PATH/Scripts/activate
fi

# Upgrade pip
echo -e "${GREEN}[02] Upgrading pip...${NC}"
pip install --upgrade pip

# Install project in development mode
echo -e "${GREEN}[03] Installing project in development mode...${NC}"
pip install -e .[dev]
pip install jupyter_contrib_nbextensions

# Setup git filter for Jupyter notebooks
echo -e "${GREEN}[04] Setting up git filter for Jupyter notebooks...${NC}"
git config filter.strip-notebook-output.clean 'jupyter nbconvert --ClearOutputPreprocessor.enabled=True --to=notebook --stdin --stdout --log-level=ERROR'

# Create necessary directories if they don't exist
echo -e "${GREEN}[05] Creating project directories...${NC}"
mkdir -p data/raw data/processed data/final data/external

# Success message
echo -e "${GREEN}Environment setup complete!${NC}"
echo "To activate the virtual environment, run:"
echo -e "  ${YELLOW}source $VENV_PATH/bin/activate${NC} (Linux/macOS)"
echo -e "  ${YELLOW}$VENV_PATH\\Scripts\\activate${NC} (Windows)"
echo ""
echo "Run 'scripts/setup_dvc.sh' to configure DVC."

# Deactivate virtual environment
deactivate