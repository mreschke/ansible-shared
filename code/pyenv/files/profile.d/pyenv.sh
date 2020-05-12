# Pyenv location
pyenv=/usr/local/lib/pyenv
export PYENV_ROOT=$pyenv

# Makes pipenv obey global or local pyenv!
PIPENV_PYTHON=$pyenv/shims/python

PATH="$PYENV_ROOT/bin:$PATH"

# Python penv, must be AFTER $PATH is set as it changes it
if command -v pyenv 1>/dev/null 2>&1; then
        eval "$(pyenv init -)"
fi

# Python aliases for pv, activate and pips should already be defined in shared/server
