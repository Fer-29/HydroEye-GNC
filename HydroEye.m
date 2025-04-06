%% HITL Params
SampleTime = 0.01;
MAVLink_Input_Read_Size = 1024;

%% Simulink Params
% Physical Properties
mass = 7;
I = [0.32 -0.01 0.13;
    -0.01  2.65   0;
     0.13   0   2.92; ];

cg = [0.5808 0 0.01];
cp = [0.519 0 -0018];

Sref = 0.57; %m2
b = 2; %m
c = 0.35; %m

% 6 DOF Block Initial conditions
init.v = [19 0 0];
init.angles = [0 0 0];
init.angRates = [0 0 0];
init.pos = [0 0 -120]; % meters


thrust  = [1798 2069 2380 2771 3241 3738 4145 4635]/1000;
power = [253.85 307.76 371.33 446.90 568.11 693.11 810.01 955.01];
current = [11.43 13.89 16.79 20.26 	25.87 31.71 37.21 44.10	];

% Coefficients from a .csv method
% longitudinal
elevator = unique(AeroLong.elevator);
alpha = unique(AeroLong.alpha);
CL = reshape(AeroLong.CL,length(alpha),length(elevator))
CD = reshape(AeroLong.CD,length(alpha),length(elevator))
Cm = reshape(AeroLong.Cm,length(alpha),length(elevator))
Cmq = -5.4623*pi/180

% lateral
rudder = unique(AeroLat.rudder);
beta = unique(AeroLat.beta);
CY = reshape(AeroLat.CY,length(beta),length(rudder))
Cl = reshape(AeroLat.Cl,length(beta),length(rudder))
Cn = reshape(AeroLat.Cn,length(beta),length(rudder))
Clp = -0.46415*pi/180
Cnp = -0.05958*pi/180
Cnr = -0.03820*pi/180
Clr = 0.12437*pi/180

save('aerocoef.mat',"alpha","Cm","CD","CL","elevator",'cg','beta','rudder','CY','Cl','Cn','Cmq','Cnr','Clp','Cnp');