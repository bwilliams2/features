#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes the 'color' feature with "favorite": "gold" option.

set -x

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "check .ssh file exists" test -f "$HOME/.ssh/smoke-test"
check "check .aws file exists" test -f "$HOME/.aws/smoke-test"
check "check .claude file exists" test -f "$HOME/.claude/smoke-test"
check "check .claude.json file exists" test -f "$HOME/.claude.json"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults