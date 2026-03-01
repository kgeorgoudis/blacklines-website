#!/bin/bash
set -e

echo "==> Building site with Hugo..."
hugo version
hugo
echo "==> Build complete!"
