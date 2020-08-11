%% IMPORT AND SORT DATA
% 9/8/19
% HLViii

%% IMPORT DATA

%load('MSP_key.mat')
MSP_all = import_MSP_all('HtM_MSP_Final 2.csv', 2, Inf);
MAF_key = import_MAF_key("/Users/poeppellab/Documents/MATLAB/Scripts/HtM_2019/HtM_MAF Data_Final 2.csv", [1, 1]);
MAF_all = import_MAF_all("/Users/poeppellab/Documents/MATLAB/Scripts/HtM_2019/HtM_MAF Data_Final 2.csv", [2, Inf]);

%erase commas
for i = 1:length(MSP_all)
MSP_all(i,:) = erase(MSP_all(i,:),",");
end

%% SORT BY AIRCRAFT

%find unique aircraft numbers and indices
[MSP_unique,MSP_ic,MSP_ia] = unique(MSP_all(:,1));
[MAF_unique,MAF_ic,MAF_ia] = unique(MAF_all(:,2));

%convert data into discrete cell arrays for each aircraft
for i = 1:45
MSP_planes{i,1} = MSP_all(find(MSP_ia==i),:);
end

for i = 1:45
MAF_planes{i,1} = MAF_all(find(MAF_ia==i),:);
end
% sort MAF_planes and MSP_planes to aircraft # order
[B,I] = sort(str2double(MAF_unique));
MAF_planes = MAF_planes(I,1);
MSP_planes = MSP_planes(I,1);

% clear temp vars
clear B I i MAF_ia MAF_ic MAF_unique MSP_ia MSP_ic MSP_unique
