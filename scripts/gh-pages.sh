#!/bin/env bash

# Requirements:
# npm
# gh-pages https://www.npmjs.com/package/gh-pages
# elm installed globally

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
EXAMPLE_DIR="$(dirname "$SCRIPT_DIR")/examples"

# Create build dir if doesn't exist
cd $ROOT_DIR
mkdir -p build

# Compile the elm code into an index.html file
cd $EXAMPLE_DIR
elm make --output=../build/index.html src/Main.elm

# Deploy to gh-pages
cd $ROOT_DIR
npx gh-pages -d build
