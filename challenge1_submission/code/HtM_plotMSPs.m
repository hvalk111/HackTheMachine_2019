%% VISUALIZE MSPs byAIRCRAFT byFLIGHT_MODE
% 9/8/19
% HLViii

%% SORT, COUNT MSPs byFLIGHT_MODE

for i = 1:45
MSPs_FlightMode(i,1) = sum(contains(MSP_planes{i,1}(:,6),"Turn"));
MSPs_FlightMode(i,2) = sum(contains(MSP_planes{i,1}(:,6),"Flight"));
MSPs_FlightMode(i,3) = sum(contains(MSP_planes{i,1}(:,6),"Pwr"));
end

%% PLOT BAR CHART

MSPs_FlightMode(:,4) = 1:45;

figure();
bar(MSPs_FlightMode(:,4),MSPs_FlightMode(:,1:3),'stacked');
