#!/bin/bash
set +x
# ------------------------------------------------------------------
# ianm_setenv.sh
# Sets up (customizes) my Unix environment for the current
# session according to my own preferences.
#
# type foo >/dev/null && echo command found || echo command not found
#
# Usage:
# $ . ./ianm_setenv.sh
#
# Last updated: 10 August 2019 12:42:35
# ------------------------------------------------------------------

function header
{
  echo " "
  date "+DATE: %A %F%nTIME: %H:%M:%S"
  echo $*
  echo " "
}

# ------------------------------------------------------------------

function trailer
{
  echo " "
  date "+TIME: %H:%M:%S"
  echo $*
  echo " "
}

# ------------------------------------------------------------------

function log {
    echo "$(date +%T) $@"
}

# ------------------------------------------------------------------

#
# Prints blank lines to the screen. ie, gives us a number of
# blank lines.
#
function blanklines
{
  LINES=$1
  for ((X=1; X<${LINES}; X+=1))
  do
     echo " "
  done
}

# ------------------------------------------------------------------
# End of local functions
# ------------------------------------------------------------------

# ------------------------------------------------------------------
# SCRIPT BODY
# Main routine starts here
# ------------------------------------------------------------------
blanklines 2
myscript=ian.sh
header "Running script: $myscript to customize my shell"

# 1.
# Customize the Unix prompt
log "Customize the Unix prompt"
export PS1='\n\w \n \t ian==> '
log "done"

# -----

# 2.
# Create a clear screen alias
log "Creating a clear screen alias"
alias cls='printf "\033c"'
log "done"

# -----

# 3.
# Create some dircolors
#
# Create a text file copy of 'dircolors' with:
# $ dircolors -p > /tmp/dircolors.txt
# Modify the line:
# DIR 01;34 # directory
# to
# DIR 01;36 # directory
# Implement your new 'dircolors' with:
# $ eval "$(dircolors -b /tmp/dircolors.txt)"
log "Creating some dircolors"
eval "$(dircolors -b dircolors.txt)"
log "done"

# -----

# 4.
# Remove some alias's that I don't really want (if they exist)
log "Removing some unwanted alias"
unalias foo 2>/dev/null
unalias ll 2>/dev/null
log "done"

# -----

trailer "Customization all done now"

# ------------------------------------------------------------------
# End of script
# ------------------------------------------------------------------
