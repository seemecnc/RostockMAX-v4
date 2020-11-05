M552 S0                        ;wifi internal
G4 P100
M552 S0                        ;turn off several times because error message
M552 S0
G4 P100
M552 S0
G4 P100
M552 S0
G4 P100
M552 S0
G4 P100
M552 S0
G4 P1000
M587 S"seemecnc" P"seeme3dp"   ;replace with your WiFi information
M587 S"networkSSID" P"password"   ;example
M587
M552 S1
M552
;
M997 S0:1                      ;update firmware
;
;G28                            ;test heats
;M104 S200
;G4 S5
;M104 S0
;M140 S60
;G4 S5
;M140 S0