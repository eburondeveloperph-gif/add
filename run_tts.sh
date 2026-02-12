#!/bin/bash
cd Chatterbox-Multilingual-TTS || exit
set -e


# Create virtual environment if it doesn't exist
if [ ! -d "env" ]; then
    echo "Creating virtual environment..."
    /usr/bin/python3 -m venv env
fi

# Activate virtual environment
source env/bin/activate


# Source cargo for rust support (needed for tokenizers)
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

# Install dependencies if not installed
if [ ! -f "installed_dependencies" ]; then
    echo "Installing dependencies..."
    ./env/bin/pip install -r requirements.txt
    touch installed_dependencies
fi

# Run the app
echo "Starting TTS Service..."
./env/bin/python app.py
