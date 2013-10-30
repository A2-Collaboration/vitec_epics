#/bin/bash -e

HOSTNAME=$(hostname -s)

# extract some useful parts of any hostname,
# sometimes used in the following case statement
TYPE=$(echo $HOSTNAME | cut -d'-' -f3 | tr '[:lower:]' '[:upper:]')
PART=$(echo $HOSTNAME | cut -d'-' -f4 | tr '[:lower:]' '[:upper:]')

case $HOSTNAME in
    vme-exptrigger)
        PREFIX="TRIG"
        ;;
    vme-cb-*)
        PREFIX="CB:CB:${TYPE}_${PART}"
        ;;
    vme-mwpc-*)
        PREFIX="CB:MWPC:${TYPE}_${PART}"
        ;;
    vme-tagg-*)
        PREFIX="TAGG:${TYPE}_${PART}"
        ;;    
    vme-beampolmon)
        PREFIX="BEAM"
        ;;
    vme-taps-trigger)
        PREFIX="TAPS:TRIG"
        ;;
    vme-taps-baf-*)
        PREFIX="TAPS:BAF:Sector${PART}"
        ;;
    vme-taps-pwo)
        PREFIX="TAPS:PWO"
        ;;
    vme-taps-veto-*)
        PREFIX="TAPS:VETOBAF:Sector${PART}"
        ;;
    *)
        echo "Don't know how to handle HOSTNAME=$HOSTNAME"
        exit 1
esac

# setup the EPICS environment
. /opt/epics/thisEPICS.sh

# launch the screen
cd /opt/epics/apps/vitec
PREFIX=$PREFIX screen -dm -S VITEC -c screenrc

echo "Screen session with name VITEC started."
