#!/bin/bash

echo "Setting up Jekyll development environment..."

# Check if Ruby is installed
if ! command -v ruby &> /dev/null; then
    echo "Ruby is not installed. Please install Ruby first:"
    echo "  brew install ruby"
    exit 1
fi

# Check if bundler is installed
if ! command -v bundle &> /dev/null; then
    echo "Installing bundler..."
    gem install bundler
fi

# Install Jekyll dependencies
echo "Installing Jekyll and dependencies..."
bundle install

echo "Setup complete!"