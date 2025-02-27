#!/bin/bash
# dvc_setup.sh - One-click DVC setup

# Path to virtual environment
VENV_PATH="./venv"

# Create virtual environment if it doesn't exist
if [ ! -d "$VENV_PATH" ]; then
    echo "No virtual environment found. Exiting..."
    exit 1
fi

# Activate virtual environment depending on the OS
if [[ "$OSTYPE" == "linux-gnu"* ]] || [[ "$OSTYPE" == "darwin"* ]]; then
    source $VENV_PATH/bin/activate
elif [[ "$OSTYPE" == "msys" ]]; then
    source $VENV_PATH/Scripts/activate
fi

# Check if DVC is installed
if ! command -v dvc &> /dev/null; then
    echo "DVC not found. Installing..."
    pip install dvc
fi

# Initialize DVC if not already initialized
if [ ! -d ".dvc" ]; then
    echo "Initializing DVC..."
    dvc init

    # Configure remote storage based on user input
    read -p "Set up remote storage? (y/n): " setup_remote
    if [[ $setup_remote == "y" ]]; then
        read -p "Enter remote storage type (s3/gdrive/ssh): " remote_type
        case $remote_type in
            s3)
                read -p "Enter S3 bucket name: " bucket
                dvc remote add -d myremote s3://$bucket
                ;;
            gdrive)
                read -p "Enter Google Drive folder ID: " folder_id
                dvc remote add -d myremote gdrive://$folder_id
                ;;
            ssh)
                read -p "Enter SSH URL (user@host:/path): " ssh_url
                dvc remote add -d myremote ssh://$ssh_url
                ;;
        esac
    fi

    # Configure DVC local remotes for team sharing
    read -p "Configure local shared directory? (y/n): " setup_local
    if [[ $setup_local == "y" ]]; then
        read -p "Enter path to shared directory: " shared_dir
        dvc remote add -d local $shared_dir
    fi

    git add .dvc/config
    git commit -m "Initialize DVC remote configuration"
fi

echo "DVC setup complete! Navigate to the experiments folder and use 'dvc repro' to run the pipelines."

# Deactivate virtual environment when done
deactivate