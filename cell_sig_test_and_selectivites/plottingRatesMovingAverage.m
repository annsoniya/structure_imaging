% plot the data on moving average of rates for each periodicity specified
%%% 
run data_classification 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data_per_3=table2cell(data_per_3);
% empty nan rows
data_per_4=table2cell(data_per_4);
data_aper_3=table2cell(data_aper_3);
data_aper_4=table2cell(data_aper_4);
windowSize=3;



all_data_per_3=nanmean(cat(1,data_per_3{:}),1); %#ok<NANMEAN>
all_data_per_4=nanmean(cat(1,data_per_4{:}),1);
all_data_aper_3=nanmean(cat(1,data_aper_3{:}),1);
all_data_aper_4=nanmean(cat(1,data_aper_4{:}),1);

%plot 
figure;
subplot(1,2,1);
plot(all_data_per_3(1,4:33));
hold on;
plot(all_data_aper_3(1,4:33));
title('Periodicity 3');
% cgange teh x axis marks to 9 to 33
%set(gca,'XTickLabel',{'9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33'});
xlabel('Frames-1:40');
ylabel('Mean firing rate');
line([9, 9], ylim, 'Color', 'r', 'LineStyle', '--');

legend('Periodic','Aperiodic');


subplot(1,2,2);
plot(all_data_per_4(1,4:33));
hold on;
plot(all_data_aper_4(1,4:33));
title('Periodicity 4');
%set(gca,'XTickLabel',{'9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33'});

xlabel('Frames-1:40');
ylabel('Mean firing rate');
legend('Periodic','Aperiodic');
%mark a line at teh 9th frame to show the onset of the stimulus
line([9, 9], ylim, 'Color', 'r', 'LineStyle', '--');
%mark a line at the 27th frame to show the offset of the stimulus


%plot the variance of the data
figure;
subplot(1,2,1);
plot(movvar(all_data_per_3,windowSize));
hold on;
plot(movvar(all_data_aper_3,windowSize));
title('Periodicity 3');
set(gca,'XTickLabel',{'9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33'});
xlabel('Frames');
ylabel('Variance');line([9, 9], ylim, 'Color', 'r', 'LineStyle', '--');
line([27, 27], ylim, 'Color', 'r', 'LineStyle', '--');

legend('Periodic','Aperiodic');


subplot(1,2,2);
plot(movvar(all_data_per_4,windowSize));
hold on;
plot(movvar(all_data_aper_4,windowSize));
title('Periodicity 4');
set(gca,'XTickLabel',{'9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33'});
xlabel('Frames');
ylabel('Variance');
legend('Periodic','Aperiodic');
%mark a line at teh 9th frame to show the onset of the stimulus
line([9, 9], ylim, 'Color', 'r', 'LineStyle', '--');
%mark a line at the 27th frame to show the offset of the stimulus
line([27, 27], ylim, 'Color', 'r', 'LineStyle', '--');
%plot the variance of the data



