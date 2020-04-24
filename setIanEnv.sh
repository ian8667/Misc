#!/bin/bash
set +x
######################################################################
# File: setIanEnv.sh
# Purpose: sets up my Unix environment as required.
#
# Last updated: 30 August 2016 15:01:28
######################################################################
# Variables
scriptname="./setIanEnv.sh"
# ====================================================================


# ====================================================================
# Lists the script usage in the event of invalid or missing data.
# ====================================================================
usage()
{
  echo
  echo "Usage: . $scriptname \$SHELL"
  return 1
}

# ====================================================================
# Set a multiline prompt for the command line. The syntax varies
# depending on which shell we're using, hence the case statement.
# ====================================================================
set_prompt()
{
  echo Setting the command line prompt
  case $pp in
     bash ) export PS1=$'\n$HOSTNAME $PWD\n ian==> '
            ;;
      ksh ) export PS1='$PWD'`echo "\n ian==> "`
            ;;
        * ) echo "Error, invalid option"; usage;;
  esac

}

# ====================================================================
# Check whether we've received a parameter. If so, extract it.
# ====================================================================
if [ "$#" -eq 0 ]
then
  # fuction call to dislay usage information
  usage

else
  param=$1
  pp="${param##*/}"
  echo
  echo Parameter received is: ${pp}
  set_prompt
fi

# ====================================================================
# Misc settings.
# ====================================================================
set -o vi


echo All done now
echo

