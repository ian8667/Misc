#!/bin/bash
set +x
# ------------------------------------------------------------------
# example_script.sh
# Example Unix shell script template.
#
# Dependency:
#
# Last update: 10 August 2019 12:21:59
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

#
# Demonstration function showing how temporary files can be created.
#
demo_tempfile001()
{
  # Create a temporary (unique) file.
  TMPFILE=$(mktemp /tmp/temp.XXXXXX)
  echo "Temporary file created: $TMPFILE"

  # Write to our temporary (unique) file.
  echo "hello world"  >$TMPFILE
  sleep 12

  # Tidy up and remove the temporary file (if you wish to).
  # rm $TMPFILE

}

# ------------------------------------------------------------------

#
# Demonstration function showing how temporary files can be created.
#
demo_tempfile002()
{
  # Create a temporary (unique) file.
  TMPFILE=$(mktemp /tmp/tempabc.XXXXXX)

  # Create a file descriptor which will be used instead of a (regular) file
  # path. In this example, we're creating file descriptor number 7.
  exec 7>"$TMPFILE"

  # Now we've created a file descriptor we can write to it instead of using
  # the variable name as used in the example above.
  echo "hello world"  >&7
  sleep 12

  # Tidy up and remove the temporary file (if you wish to).
  # rm $TMPFILE

}

# ------------------------------------------------------------------

#
# Demonstration function showing how temporary files can be created.
#
demo_tempfile003()
{
  # Create a temporary (unique) file. In this example we’re using the
  # option 'tmpdir' to specify which directory to create the file.
  TMPFILE=$(mktemp --tmpdir=/tmp fred.XXXXXX)

  # Create a file descriptor which will be used instead of a (regular)
  # file path. In this example, we're creating file descriptor number 7.
  exec 7>"$TMPFILE"

  # Now we've created a file descriptor we can write to it instead of
  # using the variable name as used in the example above.
  echo "hello world"  >&7
  sleep 12

  # Tidy up and remove the temporary file (if you wish to).
  # rm $TMPFILE

}

# ------------------------------------------------------------------

usage() {
cat <<HELP_USAGE

    Usage: $(basename $0)  <oracle sid> | [-h h help]

   -a  All the instances.
   -f  File to write all the echo "$0  [-a] -f <file>"

   Sample help usage. Demonstrates how it can be done.

HELP_USAGE

  exit 1
}

# ------------------------------------------------------------------
# Main routine start here
# ------------------------------------------------------------------
blanklines 2
progname="$(basename $0)"
echo "Running script: $progname"
body

# ------------------------------------------------------------------
# End of script
# ------------------------------------------------------------------
