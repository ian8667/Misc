#!/bin/bash
set +v
# ------------------------------------------------------------------
# test.sh
# Stops the OEM agent. (Example program)
#
# Dependency:
# ------------------------------------------------------------------

header()
{
  echo " "
  date "+DATE: %A %F%nTIME: %H:%M:%S"
  echo " "
  echo $*
  echo " "
}

# ------------------------------------------------------------------

trailer()
{
  echo " "
  date "+TIME: %H:%M:%S"
  echo $*
  echo " "
}

# ------------------------------------------------------------------

#
# Prints blank lines to the screen. ie, gives us a number of
# blank lines.
#
blanklines()
{
  LINES=$1
  for ((X=1; X<${LINES}; X+=1))
  do
     echo " "
  done
}

# ------------------------------------------------------------------

function log {
    print "$(date +%T) $@"
}

# ------------------------------------------------------------------

body()
{
  AGENT_HOME=/u01/app/oracle/product/agent/core/12.1.0.4.0

  blanklines 3
  header "Stopping OEM agent"
  $AGENT_HOME/bin/emctl stop agent
  trailer "Done"
}

# ------------------------------------------------------------------
# Main routine start here
# ------------------------------------------------------------------
me="$(basename $0)"
echo "Running script: $me"
body

# ------------------------------------------------------------------
# End of script
# ------------------------------------------------------------------

