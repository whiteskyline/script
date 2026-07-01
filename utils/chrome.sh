#!/bin/bash -
# Chrome utility functions.

# Restart Chrome with remote debugging enabled for automation tools.
function chrome_debug_restart()
{
  osascript -e 'quit app "Google Chrome"'
  sleep 2
  killall "Google Chrome" 2>/dev/null
  sleep 1

  open -a "Google Chrome"
#    --remote-allow-origins='*'
#    --remote-debugging-port=51000 \
}

function chrome_debug()
{
  chrome_debug_restart "$@"
}
