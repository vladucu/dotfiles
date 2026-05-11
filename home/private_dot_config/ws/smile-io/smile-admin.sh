# ws manifest: smile-io/smile-admin
#
# Sourced by `ws new` in a subshell. Defines:
#   INCLUDE     - array of "path:mode" entries (mode = symlink|copy)
#   post_create - optional hook run from inside the new workspace

INCLUDE=(
  ".env:symlink"
  ".claude/settings.local.json:symlink"
)

# Uncomment and adapt once you decide how you want the workspace bootstrapped.
#
# post_create() {
#   # Option A: symlink node_modules from the main checkout (fast, but only
#   # safe if the lockfile hasn't drifted).
#   if [[ -d ../../smile-admin/node_modules && ! -e node_modules ]]; then
#     ln -s ../../smile-admin/node_modules node_modules
#   fi
#
#   # Option B: clean install per workspace.
#   # pnpm install --frozen-lockfile
# }
