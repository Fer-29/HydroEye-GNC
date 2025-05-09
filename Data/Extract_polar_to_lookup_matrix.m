%% control angles
ailerons = [5 10];
elevator = [-10 0 10];
rudder = [10 0 -10];
flaps = [0 10];
%% Extracting .polar files to matricies for Simulink Model Lookup tables
% This code basically reads the .polar file, skips the white spaces and
% extracts its data as columns, change it to fit your needs

% filename = '';
filename = input("\n .polar file path : \n>>","s"); % Replace with actual filename
data = dlmread(filename, '', 1, 0); % Skip header row, start from column 0

% Indexing of columns starts from 1, not zero !
% guide for column index of important data:
% alpha = 3
% beta = 1
% CL = 5
% CDtot = 8
% CS = 11
% CMl = 20
% CMm = 21
% CMn = 22
% Extract data according to desired column
fprintf("\nInput desired angle as follows: \n" + ...
    "1- alpha \n" + ...
    "2- beta \n");

Column1 = input("Column 1: ","s");
switch Column1 
    case 'alpha'
        Column1 = data(:, 3);
        alpha = Column1;
    case 'beta'
        Column1 = data(:, 1);
        beta = Column1;
    otherwise
        disp("Error: Input only takes either 'alpha' or 'beta' ");
end

fprintf("\nInput desired angle as follows:\n" + ...
    "1- CL\n" + ...
    "2- CDtot\n" + ...
    "3- CS\n" + ...
    "4- CMl\n" + ...
    "5- CMm\n" + ...
    "6- CMn\n");

% Column2 = input("Column 2: ", "s");
%  switch Column2
%      case 'CL'
%          Column2 = data(:,5);
%          CL = Column2;
%      case 'CDtot'
%          Column2 = data(:,8);
%          CDtot = Column2;
%      case 'CS'
%          Column2 = data(:,11);
%          CS = Column2;
%      case 'CMl'
%          Column2 = data(:,20);
%          CMl = Column2;
%      case 'CMm'
%          Column2 = data(:,21);
%          CMm = Column2;
%      case 'CMn'
%          Column2 = data(:,22);
%          CMn = Column2;
%      otherwise
%          disp("Wrong Input");
%  end

CL = data(:,5);
CDtot = data(:,8);
CS = data(:,11);
CMl = data(:,20);
CMm = data(:,21);
CMn = data(:,22);

% plot if you want to double check :)
figure;
plot(Column1, Column2, 'b-o', 'LineWidth', 1.5);
xlabel('Angle of Attack (degrees)');
ylabel('Lift Coefficient (CL)');
title('CL vs Alpha');
grid on;
%% Grouping Data ( This is done one time, then this data is saved ) 
%Longitudinal
CLo = CL;
CDo = CDtot;
Cmo = CMm;

% Lateral 
Cyo = CS;
Clo = CMl;
Cno = CMn;

Cy_left_yaw = CS;
Cl_left_yaw = CMl;
Cn_left_yaw = CMn;

Cy_right_yaw = CS;
Cl_right_yaw = CMl;
Cn_right_yaw = CMn;



% Control Surfaces
CL_flaps = CL - CLo;
CL_elev_neg10 = CL;
CL_elev_pos10 = CL;
CL_ailerons_5deg = CL - CLo;
CL_ailerons_10deg = CL - CLo;
CL_ailerons = [CL_ailerons_5deg CL_ailerons_10deg];

CD_flaps = CDtot - CDo;
CD_elev_neg10 = CDtot;
CD_elev_pos10 = CDtot;
CD_ailerons_5deg = CDtot - CDo;
CD_ailerons_10deg = CDtot - CDo;
CD_ailerons = [CD_ailerons_5deg CD_ailerons_10deg];

Cm_flaps = CMm - Cmo;
Cm_elev_neg10 = CMm;
Cm_elev_pos10 = CMm;
Cm_ailerons_5deg = CMm - Cmo;
Cm_ailerons_10deg = CMm - Cmo;
Cm_ailerons = [Cm_ailerons_5deg Cm_ailerons_10deg];

Cy_ailerons_5deg = CS - Cyo;
Cy_ailerons_10deg = CS - Cyo;
Cy_ailerons = [Cy_ailerons_5deg Cy_ailerons_10deg];

Cl_ailerons_5deg = CMl - Clo;
Cl_ailerons_10deg = CMl - Clo;
Cl_ailerons = [Cl_ailerons_5deg Cl_ailerons_10deg];

Cn_ailerons_5deg = CMn - Cno;
Cn_ailerons_10deg = CMn - Cno;
Cn_ailerons = [Cn_ailerons_5deg Cn_ailerons_10deg];

CLo_CL_elev = [CL_elev_neg10 CLo CL_elev_pos10];
CDo_CD_elev = [CD_elev_neg10 CDo  CD_elev_pos10];
Cmo_Cm_elev = [Cm_elev_neg10 Cmo Cm_elev_pos10];

Cyo_Cy_rudder = [Cy_left_yaw Cyo Cy_right_yaw];
Clo_Cl_rudder = [Cl_left_yaw Clo Cl_right_yaw];
Cno_Cn_rudder = [Cn_left_yaw Cno Cn_right_yaw];
%% SAVE DATA
save("aeroData.mat", "CL", "CMm", "CDtot", "alpha");