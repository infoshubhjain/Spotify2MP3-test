#!/bin/bash
set -e

export PATH="/opt/homebrew/bin:/usr/local/bin:$HOME/.pyenv/bin:$PATH"

PYTHON_VERSION=3.13.3
PYTHON=""

# Kill any existing instance
pkill -f spotify2media.py 2>/dev/null && echo "Killed existing instance." || true

# Install Homebrew if missing
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Source Homebrew env in case the installer didn't modify PATH for this session
    if [ -f /opt/homebrew/bin/brew ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [ -f /usr/local/bin/brew ]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

# Install ffmpeg and yt-dlp if missing
for tool in ffmpeg yt-dlp; do
    if ! command -v $tool &>/dev/null; then
        echo "Installing $tool..."
        brew install $tool
    fi
done

# Find or install Python 3.13
if [ -f "/Library/Frameworks/Python.framework/Versions/3.13/bin/python3" ]; then
    PYTHON="/Library/Frameworks/Python.framework/Versions/3.13/bin/python3"
elif command -v python3 &>/dev/null && python3 --version 2>&1 | grep -q "^Python 3\.13"; then
    PYTHON="$(command -v python3)"
else
    echo "Python 3.13 not found. Installing via pyenv..."
    brew install tcl-tk
    if ! command -v pyenv &>/dev/null; then
        brew install pyenv
        eval "$(pyenv init --path)"
        eval "$(pyenv init -)"
    else
        eval "$(pyenv init --path)"
        eval "$(pyenv init -)"
    fi
    if ! pyenv versions --bare | grep -q "^${PYTHON_VERSION}$"; then
        echo "Installing Python ${PYTHON_VERSION} (this may take a few minutes)..."
        TCL_TK_PREFIX="$(brew --prefix tcl-tk)"
        PYTHON_CONFIGURE_OPTS="--with-tcltk-includes=-I${TCL_TK_PREFIX}/include --with-tcltk-libs='-L${TCL_TK_PREFIX}/lib -ltcl8.6 -ltk8.6'" \
            pyenv install "$PYTHON_VERSION"
    fi
    pyenv global "$PYTHON_VERSION"
    PYTHON="$(pyenv which python3)"
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
