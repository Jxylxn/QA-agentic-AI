#!/bin/bash
# KYC QA Agent — startup script

set -e
cd "$(dirname "$0")"

# Install dependencies if needed
if ! python3 -c "import fastapi" 2>/dev/null; then
  echo "📦 Installing dependencies..."
  pip3 install -r requirements.txt
fi

# Check for .env
if [ ! -f .env ]; then
  echo "⚠️  No .env file found. Copying .env.example → .env"
  cp .env.example .env
  echo "👉 Please edit .env and add your ANTHROPIC_API_KEY, then re-run."
  exit 1
fi

echo "🚀 Starting KYC QA Agent at http://localhost:8000"
python3 app.py
