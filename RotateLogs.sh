#!/bin/bash
set +x
# ------------------------------------------------------------------
# RotateLogs.sh
# Rotates the Oracle listener and alert logs (non-XML versions)
#
# Dependency:
#
# Last update: 10 August 2019 12:02:38
# ------------------------------------------------------------------

header()
{
  echo " "
  date "+DATE: %A %F%nTIME: %H:%M:%S"
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

function log {
    print "$(date +%T) $@"
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

#
# Rotate the Oracle listener log (non-XML) file
#
# See also Oracle Metalink Support Note:
# How to Rotate or Purge Listener Log Data to Avoid Large listener.log File? (Doc ID 1457196.1)
#
rotate_listenerlog()
{
#
# SET LOG_STATUS
# Use the command SET LOG_STATUS to turn listener logging on or off
#
# Syntax
# From the operating system:
# $ lsnrctl SET LOG_STATUS {on | off}
#

  LOGDIR=/u01/oracle/diag/tnslsnr/ohmslivezone/listener/trace

  # Print header title
  blanklines 3
  header "Rotating listener log file"

  # Stop listener logging whilst we carry out our log switching.
  log "Turning off listener logging"
  $ORACLE_HOME/bin/lsnrctl set log_status off

  blanklines 3

  # Switch log files around.
  log "Switching the log files around"
  cp ${LOGDIR}/listener.log ${LOGDIR}/listener.log_old
  cp /dev/null ${LOGDIR}/listener.log
  log "done"

  # Start listener logging again.
  blanklines 3
  log "Turning on listener logging"
  $ORACLE_HOME/bin/lsnrctl set log_status on

  # Check the status of the listener
  blanklines 3
  log "Status of the listener"
  $ORACLE_HOME/bin/lsnrctl status

  # Have a look at the files we've just touched upon.
  blanklines 3
  log "Log files we've just touched upon"
  ls -oh $LOGDIR

  # Print trailer title
  blanklines 3
  trailer "Listener log file rotated"

} # end of function rotate_listenerlog

# ------------------------------------------------------------------

#
# Rotate the Oracle database alert log (non-XML) file
#
# See also Oracle Metalink Support Note:
# How to Rotate or Purge Listener Log Data to Avoid Large listener.log File? (Doc ID 1457196.1)
#
# ADRCI Command Reference
# https://docs.oracle.com/database/122/SUTIL/oracle-ADR-command-interpreter-ADRCI.htm#SUTIL1483
#

rotate_alertlog()
{

  LOGDIR=/u01/oracle/diag/rdbms/p04/p04/trace

  # Print header title
  blanklines 3
  header "Rotating alert log file"

  # Switch log files around.
  log "Switching the alert log files around"
  cp ${LOGDIR}/alert_p04.log ${LOGDIR}/alert_p04.log_old
  cp /dev/null ${LOGDIR}/alert_p04.log
  log "done"

  # Have a look at the files we've just touched upon.
  blanklines 3
  log "Log files we've just touched upon"
  ls -oh $LOGDIR/alert*

  # Print trailer title
  blanklines 3
  trailer "Alert log file rotated"

} # end of function rotate_alertlog

# ------------------------------------------------------------------

# ------------------------------------------------------------------
# Main routine starts here
# ------------------------------------------------------------------
blanklines 2
progname="$(basename $0)"
log "Running script: $progname"

export ORACLE_BASE=/u01/oracle
export ORACLE_SID=p04
ORAENV_ASK=NO
. oraenv
ORAENV_ASK=YES


# Call a function to rotate the listener log file.
log "Calling function rotate_listenerlog"
rotate_listenerlog
log "rotate_listenerlog done"


# Call a function to rotate the alert log file.
blanklines 5
log "Calling function rotate_alertlog"
rotate_alertlog
log "rotate_alertlog done"

# ------------------------------------------------------------------
# End of script
# ------------------------------------------------------------------

