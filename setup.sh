#!/bin/bash

# Git Practice Repository Setup Script

echo "Setting up Git practice repository..."

# Create necessary directories if they don't exist
mkdir -p src tests

# Initialize git if not already initialized
if [ ! -d .git ]; then
    git init
    echo "Initialized Git repository"
fi

# Create initial commit if repository is empty
if [ -z "$(git log 2>/dev/null)" ]; then
    git add .
    git commit -m "initial commit: project setup"
    echo "Created initial commit"
fi

# Create main/develop branches if they don't exist
git branch | grep -q "main" || git branch main
git branch | grep -q "develop" || git branch develop

echo "Setup complete!"
echo ""
echo "Next steps:"
echo "1. Create your practice branch: git checkout -b practice/[your-name]"
echo "2. Follow the exercise worksheet"
echo ""
echo "For Exercise 2 setup, run: ./setup-exercise2.sh"
