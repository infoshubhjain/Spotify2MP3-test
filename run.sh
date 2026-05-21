#!/bin/bash
set -e

PYTHON=/Library/Frameworks/Python.framework/Versions/3.13/bin/python3

# Kill any existing instance
pkill -f spotify2media.py 2>/dev/null && echo "Killed existing instance." || true

# Install Homebrew if missing
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install ffmpeg and yt-dlp if missing
for tool in ffmpeg yt-dlp; do
    if ! command -v $tool &>/dev/null; then
        echo "Installing $tool..."
        brew install $tool
    fi
done

# Install Python 3.13 (with tkinter) if missing
if [ ! -f "$PYTHON" ]; then
    echo "Installing Python 3.13..."
    open https://www.python.org/ftp/python/3.13.7/python-3.13.7-macos11.pkg
    echo "Please complete the Python installer, then re-run this script."
    exit 0
fi

# Install Python dependencies
echo "Checking Python dependencies..."
$PYTHON -m pip install --quiet --break-system-packages \
    mutagen tkinterdnd2 requests beautifulsoup4 selenium webdriver-manager

# Launch the app
echo "Launching Spotify2MP3..."
cd "$(dirname "$0")"
$PYTHON spotify2media.py &

echo "Done. App is running."
