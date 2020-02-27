; RostockMAX v4 Ethernet Control
; by SeeMeCNC

M111 S0					; debug off
M550 RostockMAX-v4                     ; Printer name (can be anything you want)
;M929 P"eventlog.txt" S1                ; event logging start

; Networking & Commnications
M540 P0xF0:0xE1:0xD2:0xC3:0x11:0x11    ; Set your own MAC Address (make different for each SeeMeCNC printer you own)
G4 P1000                               ; pause a second
M552 P0.0.0.0                          ; IP address P0.0.0.0 uses DHCP 
G4 P1000                               ; pause a second
M552 S1                                ; enable network
G4 P1000                               ; pause a second
M575 P1 B57600 S1                      ; PanelDue Comm Setup

; machine delta parameters
G21                                     ; Work in millimeters
G90                                     ; Send absolute coordinates
M569 P0 S1                              ; Drive 0 goes forwards (X)
M569 P1 S1                              ; Drive 1 goes forwards (Y)
M569 P2 S1                              ; Drive 2 goes forwards (Z)
M569 P3 S1                              ; Drive 3 goes forwards (E0)
M569 P4 S1                              ; Drive 4 goes forwards (E1)
M574 X2 Y2 Z2 S1                        ; set end-stop configuration (all end-stops at high end, active high)

; Choose an arm length L depending on arms installed and filament printed
; NOTES: delta radius, diagonal rod length, printable radius and homed height
M665 R144 L289.1 B135 H400 X0 Y0 Z0    ;  Standard Injection Molded Arms 
;M665 R144 L337 B135 H350 X0 Y0 Z0      ; carbon fiber arms length setting

M666 X0 Y0 Z0                           ; end-stop offsets in mm

; motion control parameters
M350 X16 Y16 Z16 E16:16 I1              ; Set 16x micro-stepping w/ Interpolation
M92 X200 Y200 Z200                      ; Set axis steps/mm
M92 E182.0:182.0                        ; Set extruder steps/mm
M906 X1300 Y1300 Z1300 E1200:1200 I50   ; Set motor currents (mA) and idle current %
M201 X3400 Y3400 Z3400 E5000            ; Accelerations (mm/s^2)
M203 X15000 Y15000 Z15000 E15000        ; Maximum speeds (mm/min)
M566 X500 Y500 Z500 E2000               ; Maximum instant speed changes mm/minute

; fan setup parameters
M106 P0 H-1                             ; Part Cooling Fan
M106 P1 S0.5 H-1                        ; Case fan
M106 P2 T50 S0.7 H1                     ; Heat sink fan

;heated bed and temperature sensor parameters
M307 H0 B0                              ; Heated Bed (H2)
M305 P0 T100000 B4388 R4700 H30 L0      ; Bed thermistor
M305 P1 T100000 B4388 R4700 C7.06e-8 H30 L0      ; Hotend Thermistor

;extruder one
M563 P0 D0 H1                           ; Hotend (T0), drive (E0), heater (H1)
G10 P0 S0 R0                            ; Hotend operating and standby temperatures

;extruder two (uncomment for dual extrusion) 			
;M563 P1 D1 H1                          ; Hotend (T1), drive (E1), heater (H1)
;G10 P1 S0 R0                           ; Hotend (1) operating and standby temperatures

;hotend probe parameters
M558 P5 I0 A2 S0.05 R0.4 H20 F2500      ; Strain gage probe settings
G31 P100 X0 Y0 Z-0.25                    ; Probe trigger and offset values Glass Plate Only
;G31 P100 X0 Y0 Z-0.6                   ; Probe trigger and offset values for FabLam Flex Spring Steel PEI on Glass
M557 R140 S30                           ; default bed mapping
M501                                    ; Load saved config values
T0                                      ; Select Tool 0
M375                                    ; Load height map






