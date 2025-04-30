# shell prompt settings
export HISTTIMEFORMAT="%F %T "

# Set nvim as default editor
export GIT_EDITOR=nvim
export EDITOR=nvim

# Setup GOPATH
export GOPATH="${GOPATH:-$HOME/go}"
export PATH=$GOPATH/bin:$PATH

# Add ruby to PATH
export PATH=/usr/local/opt/ruby/bin:$PATH

# Add brew-installed python to the path.
# Must go at the beginning so that it's prioritized over the system installation.
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

export GIT_REPO_DIR="$HOME/workspace"
