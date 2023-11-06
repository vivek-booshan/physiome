% loading abp and time data 
abp_file = load("s00020-2567-03-30-17-47_ABP.txt", "-ascii");

% parsing abp from second column and time from first column
abp = abp_file(:, 2);
time = abp_file(:, 1);
% converting time to hours
time_hours = time / 3600;

% finding indices of pulses starting at hours 10 and 11
index_10 = find(time_hours == 10);
index_11 = find(time_hours == 11);

onset = wabp(abp);

features = abpfeature(abp, onset);

[beta, r] = jSQI(features, onset, abp);

figure 
plot(time_hours(index_10:index_10 + (20*125)) * 3600, abp(index_10:index_10 + (20*125)));