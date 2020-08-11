%% VISUALIZE WIRING MAFs
% 9/8/19
% HLViii

%% COUNT WIRING MAFs

%if wiring-related AND routine
counter = 0;
for i = 1:45
for j = 1:size(MAF_planes{i,1},1)
if (contains(MAF_planes{i,1}(j,4),"W")|contains(MAF_planes{i,1}(j,6),"wir",'IgnoreCase',true)|contains(MAF_planes{i,1}(j,7),"wir",'IgnoreCase',true))&&(MAF_planes{i,1}(j,13)=="Yes")
counter = counter + 1;
else
end
end
MAFs_wiring(i,1) = counter;
counter = 0;
end

% if wiring-related and non-routine
counter = 0;
for i = 1:45
for j = 1:size(MAF_planes{i,1},1)
if (contains(MAF_planes{i,1}(j,4),"W")|contains(MAF_planes{i,1}(j,6),"wir",'IgnoreCase',true)|contains(MAF_planes{i,1}(j,7),"wir",'IgnoreCase',true))&&(MAF_planes{i,1}(j,14)=="Yes")
counter = counter + 1;
else
end
end
MAFs_wiring(i,2) = counter;
counter = 0;
end

MAFs_wiring(:,3) = 1:45;

% find service date range for each plane
for i = 1:45
temp_min = min(datetime(MAF_planes{i,1}(:,8)));
temp_max = max(datetime(MAF_planes{i,1}(:,9)));
temp_diff = caldiff([temp_min temp_max],'days');
MAF_day_range(i,1) = caldays(temp_diff);
end

% divide wiring maitenence actions by # of days
for i = 1:45
MAFs_wiring_rate(i,1) = MAFs_wiring(i,1)/MAF_day_range(i,1);
MAFs_wiring_rate(i,2) = MAFs_wiring(i,2)/MAF_day_range(i,1);
end

MAFs_wiring_rate(:,3) = MAFs_wiring(:,3);

%plot
figure();
bar(MAFs_wiring_rate(:,3),MAFs_wiring_rate(:,1:2),'stacked');

