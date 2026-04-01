# Remove leaked volta/tools/image/* paths (volta shims add these to child processes,
# and they persist in inherited PATH, breaking the shim → installed-tool routing).
# Only $VOLTA_HOME/bin (the shim directory) should be in PATH.
path=(${path:#$VOLTA_HOME/tools/image/*})
path=($VOLTA_HOME/bin $path)
