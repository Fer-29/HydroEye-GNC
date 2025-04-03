syms x 
CL(x) = (2*9.1*9.81)/(0.57*(x^2)*1.225);
V=12:0.1:19;
Cl_cruise = zeros(1,length(V));
S(x) = (2*9.1*9.81)/(0.57*(x^2)*1.3*1.225);
S_takeoff = zeros(1,length(V));


for i=1:length(V)

    Cl_cruise(i) = CL(V(i));
    S_takeoff(i) = S(V(i));
end

Cl_vs_V = [V; Cl_cruise];

writematrix (Cl_vs_V,"CL required at V for lift = weight")

figure
plot(V,Cl_cruise,LineWidth=2)
hold on
plot(V,S_takeoff)
grid on
title("Needed CL for lift = weight @ V")
xlabel("Velocity")
ylabel("CL")
