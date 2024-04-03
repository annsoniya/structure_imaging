

clear all;
clc
data= load('Sig_bon_cumu_Frms_33frms_without_bleaching_correction.mat');
data=table2cell(data.Sig_bon_cumu_Frms_33frms);

%% do theg same with bleaching correction
data= load('Sig_bon_cumu_Frms_33frms_with_bleaching_correction.mat');
data=table2cell(data.Sig_bon_cumu_Frms_33frms);


%%%%%%%%%%%%%%%
periodic_stimset_4=[1,2,9,10];
aperiodic_stimset_4=[11,12];
periodic_stimset_3=[3,4,5,6,7,8];
aperiodic_stimset_3=[13,14,15,16];
per_set=[1,2,3,4,5,6,7,8,9,10];
aper_set=[11,12,13,14,15,16];
% plan 
%split into stimwise  and periodicity wise
%find cumulatve for 3 frames=600ms
%apply ttest and find significant cases amon=g periodic an d aperiodic

%split into stimwise  and periodicity wise
data_per_3=data(:,periodic_stimset_3);
data_per_4=data(:,periodic_stimset_4);
data_aper_3=data(:,aperiodic_stimset_3);
data_aper_4=data(:,aperiodic_stimset_4);

%%%% periodicity =3%%%%
%%%%%% structure of aperiodic based on teh periodic data%%%%%%
p3_per_selective_inx=[];
p3_aper_selective_inx=[];
p3_diff_inx=[];
% step 1:- check fro the units that are significant for the periodic stimulus 
for i=1:size(data_per_3,1) %%** 6 stim*5 trials *40 frmaes
    per_3=[]; 
    per_3= cat(1,data_per_3{i,:});%
    aper_3=[];
    aper_3=cat(1,data_aper_3{i,:});
    mean_per_3=nanmean(per_3(:,9:33),2);
    mean_aper_3=nanmean(aper_3(:,9:33),2);
    %find sig of this cell using ttest2 with alpha value =0.05
    [h_diff, p_diff] = ttest2(mean_per_3, mean_aper_3, 'Alpha', 0.05);
    %performed tailed
    [h_rt, p_rt] = ttest2(mean_per_3, mean_aper_3, 'Alpha', 0.05,'Tail', 'right');
    [h_lt, p_lt] = ttest2(mean_per_3, mean_aper_3, 'Alpha', 0.05,'Tail', 'left');
    
    if h_diff==1 
        p3_diff_inx=[p3_diff_inx;i];
    end
    if h_rt==1
        p3_per_selective_inx=[p3_per_selective_inx;i];
    elseif h_lt==1
        p3_aper_selective_inx=[p3_aper_selective_inx;i];
    end

end
% add these indices to a structure for withoutbleaching correction
withoutbleaching.p3_per_selective_inx=p3_per_selective_inx;
withoutbleaching.p3_aper_selective_inx=p3_aper_selective_inx;
withoutbleaching.p3_diff_inx=p3_diff_inx;

%with bleaching correction in a structure
withbleaching.p3_per_selective_inx=p3_per_selective_inx;
withbleaching.p3_aper_selective_inx=p3_aper_selective_inx;
withbleaching.p3_diff_inx=p3_diff_inx;


===========periodicty =4================
%%%% periodicity =4%%%%
%%%%%% structure of aperiodic based on teh periodic data%%%%%%
p4_per_selective_inx=[];
p4_aper_selective_inx=[];
p4_diff_inx=[];
% step 1:- check fro the units that are significant for the periodic stimulus 
for i=1:size(data_per_4,1) %%** 6 stim*5 trials *40 frmaes
    per_4=[]; 
    per_4= cat(1,data_per_4{i,:});%
    aper_4=[];
    aper_4=cat(1,data_aper_4{i,:});
    mean_per_4=nanmean(per_4(:,9:33),2);
    mean_aper_4=nanmean(aper_4(:,9:33),2);
    %find sig of this cell using ttest2 with alpha value =0.05
    [h_diff, p_diff] = ttest2(mean_per_4, mean_aper_4, 'Alpha', 0.05);
    %performed tailed
    [h_rt, p_rt] = ttest2(mean_per_4, mean_aper_4, 'Alpha', 0.05,'Tail', 'right');
    [h_lt, p_lt] = ttest2(mean_per_4, mean_aper_4, 'Alpha', 0.05,'Tail', 'left');
    
    if h_diff==1 
        p4_diff_inx=[p4_diff_inx;i];
    end
    if h_rt==1
        p4_per_selective_inx=[p4_per_selective_inx;i];
    elseif h_lt==1
        p4_aper_selective_inx=[p4_aper_selective_inx;i];
    end

end
% add these indices to a structure for withoutbleaching correction
withoutbleaching.p4_per_selective_inx=p4_per_selective_inx;
withoutbleaching.p4_aper_selective_inx=p4_aper_selective_inx;
withoutbleaching.p4_diff_inx=p4_diff_inx;

%with bleaching correction in a structure
withbleaching.p4_per_selective_inx=p4_per_selective_inx;
withbleaching.p4_aper_selective_inx=p4_aper_selective_inx;
withbleaching.p4_diff_inx=p4_diff_inx;
