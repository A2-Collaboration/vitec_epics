#/bin/bash -e

cd /opt/epics/apps/vitec
export HOSTNAME=$(hostname -s)

$EPICS_BASE/../extra/streamApp vitec.cmd
