%% HITL Params
SampleTime = 1/400;
MAVLink_Input_Read_Size = 1024;
%% Damping Coeff
Clp = -0.4996148;
Cnp = -0.0556744;
Clr = 0.1223343;
Cnr = -0.0422534;
Cmq = -0.0542848;
%% Servo PWM
MG995_PWM = 500:11:2500; % np = 1500
SPT5410LV_PWM = 500:11:2500; % np = 1500
Servo_Angle = -180:2:180;
%% Simulink Params
% Physical Properties
mass = 8.2;
I = [0.74   0     0;
    -0.01  3.39   0;
     0.13   0   4.07];

cg = [0.5701 0 0.01];
cp = [0.519 0 -0018];

Sref = 0.62; %m2
b = 2.25; %m
c = 0.30; %m

% 6 DOF Block Initial conditions
init.v = [0 0 0];
init.angles = [0 0 0];
init.angRates = [0 0 0];
init.pos = [0 0 0]; % meters

throttle = [0 40 45 50 55 60 65 70 75 80 90 100];
thrust  = [0 1798 2069 2380 2771 3241 3738 4145 4635 5207 6054 6618]/1000;
PWM = [1000 1400 1450 1500 1550 1600 1650 1700 1750 1800 1900 2000];

power = [253.85 307.76 371.33 446.90 568.11 693.11 810.01 955.01];
current = [11.43 13.89 16.79 20.26 	25.87 31.71 37.21 44.10	];