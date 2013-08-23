
dbLoadDatabase "/opt/epics/modules/stream/streamDevice/streamApp/O.Common/streamApp.dbd"

streamApp_registerRecordDeviceDriver

epicsEnvSet "STREAM_PROTOCOL_PATH", "/opt/epics/apps/vitec/"

drvAsynSerialPortConfigure ("VITEC", "/dev/ttyS0")
asynSetOption ("VITEC", 0, "baud", "57600")
asynSetOption ("VITEC", 0, "bits", "8")
asynSetOption ("VITEC", 0, "parity", "none")
asynSetOption ("VITEC", 0, "stop", "1")

dbLoadRecords "vitec.db","PROTO=vitec_serial.proto,DEV=VITEC,BOX=a2wcdaq1b"

iocInit

#var streamDebug 1
