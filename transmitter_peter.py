#! /usr/bin/python
#
#  EPICS to Peter-Slow-Control converter
#      Tito Koerner, Oliver Steffen
#      Aug 23, 2013

import epics
import time
import urllib2
import sys

from epics import caget

def MyCaGet(PV):
	return caget(PV, False, None, False, None, True)

Node = 203

if len(sys.argv) == 3:
    Node = sys.argv[1]
    Host = sys.argv[2]
else:
    print "single_vitec.py <node> <host>"
    sys.exit(1)

print "Node=%s Host=%s" % (Node, Host)

while 1:
    V1 = MyCaGet("%s:VITEC:VP5" % (Host) )
    V2 = MyCaGet("%s:VITEC:VP12" % (Host) )
    V3 = MyCaGet("%s:VITEC:VN12" %(Host) )
    V4 = MyCaGet("%s:VITEC:VP3V3" %(Host) )
    V5 = MyCaGet("%s:VITEC:VP2V5" %(Host) )
    V6 = MyCaGet("%s:VITEC:VP1V2" %(Host) )
    V7 = MyCaGet("%s:VITEC:Temp" %(Host) )

    URL = "http://a2onlinedatabase.office.a2.kph/intern/sc/insert.php?NodeID=%s&Value1=%s&Value2=%s&Value3=%s&Value4=%s&Value5=%s&Value6=%s&Value7=%s" % (Node, V1, V2, V3, V4, V5, V6, V7)
    urllib2.urlopen( URL )    
    time.sleep(5)
	
