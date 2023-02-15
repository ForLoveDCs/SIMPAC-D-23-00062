% This script demonstrates the application of ForLoveDCs Software
% ForLoveDCs is a set of MATLAB function that can be used to calculate
% the forward modeling of multimode Love wave dispersion curves (DCs)
% DCs illustrate the curve of phase velocity (m/s) vs frequency (Hz)
% First step is defining or setting initial global parameter
% ------------------------------------------------------------------------
% Reading the input of global parameters of surface waves
ISFREQ=1.0;% Starting of Frequeency looping
IEFREQ=120;% Ending of frequency looping
DFREQ=3.5;% Shift frequency
MINVEL=50;% Starting of velocity looping
MAXVEL=700;% Ending of velocity looping
DVEL=1;% Shift velocity
NROOT=7; % No of bisections for given mode
NMOD=5;% Maximum modes to find
% ------------------------------------------------------------------------
% Profile 1
% Defining the model parameters of S-wave velocity profile
NN=5; % Number of Layer
VS=[200 300 450 600 700]; % Share velocity of each layer (m/s)
RHO=[1.7 1.7 1.8 1.8 2.0]*1e3; % Density values of each layer (kg/m^3)
H=[0 2.0 3.0 4.5 5]; % Thickness values of each layer (m)
% Performing the visualization of the velocity structure
[par_vel, par_dpt,maxdepth]=plot_profile(NN,VS,H);
swv1=par_vel;depth1=par_dpt;maxdpt1=maxdepth;
% % Runing the function of ForLoveDcs.m
[LoveDCs]=ForLoveDcs(NN,VS,RHO,H,ISFREQ,IEFREQ,DFREQ,MINVEL,MAXVEL,DVEL,NROOT,NMOD);
LoveDCs_prf1=LoveDCs;
% Profile 2
% Defining the model parameters of S-wave velocity profile
NN=5; % Number of Layer
VS=[700 600 450 300 200]; % Share velocity of each layer (m/s)
RHO=[2.0 1.8 1.8 1.7 1.7]*1e3; % Density values of each layer (kg/m^3)
H=[0 2.0 3.0 4.5 5]; % Thickness values of each layer (m)
% Performing the visualization of the velocity structure
[par_vel, par_dpt,maxdepth]=plot_profile(NN,VS,H);
swv2=par_vel;depth2=par_dpt;maxdpt2=maxdepth;
% % Runing the function of ForLoveDcs.m
[LoveDCs]=ForLoveDcs(NN,VS,RHO,H,ISFREQ,IEFREQ,DFREQ,MINVEL,MAXVEL,DVEL,NROOT,NMOD);
LoveDCs_prf2=LoveDCs;
% Profile 3
% Defining the model parameters of S-wave velocity profile
NN=5; % Number of Layer
VS=[200 300 700 600 450]; % Share velocity of each layer (m/s)
RHO=[1.7 1.8 2.0 1.8 1.8]*1e3; % Density values of each layer (kg/m^3)
H=[0 2.5 3.5 5 7.5]; % Thickness values of each layer (m)
% Performing the visualization of the velocity structure
[par_vel, par_dpt,maxdepth]=plot_profile(NN,VS,H);
swv3=par_vel;depth3=par_dpt;maxdpt3=maxdepth;
% % Runing the function of ForLoveDcs.m
[LoveDCs]=ForLoveDcs(NN,VS,RHO,H,ISFREQ,IEFREQ,DFREQ,MINVEL,MAXVEL,DVEL,NROOT,NMOD);
LoveDCs_prf3=LoveDCs;
% Profile 4
% Defining the model parameters of S-wave velocity profile
NN=5; % Number of Layer
VS=[600 700 200 450 300]; % Share velocity of each layer (m/s)
RHO=[1.8 2.0 1.7 1.8 1.7]*1e3; % Density values of each layer (kg/m^3)
H=[0 2.5 3.5 5 7.5]; % Thickness values of each layer (m)
% Performing the visualization of the velocity structure
[par_vel, par_dpt,maxdepth]=plot_profile(NN,VS,H);
swv4=par_vel;depth4=par_dpt;maxdpt4=maxdepth;
% % Runing the function of ForLoveDcs.m
[LoveDCs]=ForLoveDcs(NN,VS,RHO,H,ISFREQ,IEFREQ,DFREQ,MINVEL,MAXVEL,DVEL,NROOT,NMOD);
LoveDCs_prf4=LoveDCs;
% Ploting the S-wave velocity profiles
figure1=figure('NumberTitle','off','Name','Visualization of the SWV profiles');
subplot(221)
profile1=plot(swv1,depth1,'r-','LineWidth',1);hold on
set(gca,'XAxisLocation','bottom','YDir','reverse');
title('Profile 1')
xlabel('Shear-wave velocity (m/s)');
ylabel('Depth (m)');
set(gca,'XLim',[0 max(VS)+100],'YLim',[0 maxdpt1]);
subplot(222)
profile2=plot(swv2,depth2,'r-','LineWidth',1);hold on
set(gca,'XAxisLocation','bottom','YDir','reverse');
title('Profile 2')
xlabel('Shear-wave velocity (m/s)');
ylabel('Depth (m)');
set(gca,'XLim',[0 max(VS)+100],'YLim',[0 maxdpt1]);
subplot(223)
profile3=plot(swv3,depth3,'r-','LineWidth',1);hold on
set(gca,'XAxisLocation','bottom','YDir','reverse');
title('Profile 3')
xlabel('Shear-wave velocity (m/s)');
ylabel('Depth (m)');
set(gca,'XLim',[0 max(VS)+100],'YLim',[0 maxdpt1]);
subplot(224)
profile4=plot(swv4,depth4,'r-','LineWidth',1);hold on
set(gca,'XAxisLocation','bottom','YDir','reverse');
title('Profile 4')
xlabel('Shear-wave velocity (m/s)');
ylabel('Depth (m)');
set(gca,'XLim',[0 max(VS)+100],'YLim',[0 maxdpt1]);
saveas(figure1,'../results/SWVProfile Depth vs Shear Wave.png')
% -------------------------------------------------------------------------
% Ploting the multimode Love wave dispesion curves
figure2=figure('NumberTitle','off','Name','Multimode Love Wave DCs');
axes1=axes('Parent',figure2);
box(axes1,'on');hold(axes1,'on');
% The DCs of Profile 1
[M1,N1]=size(LoveDCs_prf1);
for p=1:N1
    subplot(221)
    plt=plot(ISFREQ:IEFREQ,LoveDCs_prf1(:,p));hold on
    title('The DCs of Profile 1')
    xlabel('Frequency [Hz]')
    ylabel('Phase velocity [m/s]');
end
% Calculating the cut-off frequencies
peak_vel=zeros(1,N1);fid_peak=zeros(1,N1);cut_freq1=zeros(1,N1);
freqs=ISFREQ:IEFREQ;
for d=1:N1
    peak_vel(d)=max(LoveDCs_prf1(:,d));
    fid_peak(d)=find(LoveDCs_prf1(:,d)==peak_vel(d));
    cut_freq1(d)=freqs(fid_peak(d));
end
disp('The cut-off frequencies (Hz) of Profile 1:');
disp(cut_freq1);
% Calculating an average of the cut-off frequency
average_cut_freq1=sum(diff(cut_freq1))/(N1-1);
disp('Average of cut-off frequencies (Hz) of Profile 1:');
disp(average_cut_freq1);
% ------------------------------------------------------------------------
% The DCs of Profile 2
[M2,N2]=size(LoveDCs_prf2);
for p=1:N2
    subplot(222)
    plt=plot(ISFREQ:IEFREQ,LoveDCs_prf2(:,p));hold on
    title('The DCs of Profile 2')
    xlabel('Frequency [Hz]')
    ylabel('Phase velocity [m/s]');
end
% Calculating the cut-off frequencies
peak_vel=zeros(1,N2);fid_peak=zeros(1,N2);cut_freq2=zeros(1,N2);
freqs=ISFREQ:IEFREQ;
for d=1:N2
    peak_vel(d)=max(LoveDCs_prf2(:,d));
    fid_peak(d)=find(LoveDCs_prf2(:,d)==peak_vel(d));
    cut_freq2(d)=freqs(fid_peak(d));
end
disp('The cut-off frequencies (Hz) of Profile 2:');
disp(cut_freq2);
% Calculating an average of the cut-off frequency
average_cut_freq2=sum(diff(cut_freq2))/(N2-1);
disp('Average of cut-off frequencies (Hz) of Profile 2:');
disp(average_cut_freq2);
% ------------------------------------------------------------------------
% The DCs of Profile 3
[M3,N3]=size(LoveDCs_prf3);
for p=1:N3
    subplot(223)
    plt=plot(ISFREQ:IEFREQ,LoveDCs_prf3(:,p));hold on
    title('The DCs of Profile 3')
    xlabel('Frequency [Hz]')
    ylabel('Phase velocity [m/s]');
end
% Calculating the cut-off frequencies
peak_vel=zeros(1,N3);fid_peak=zeros(1,N3);cut_freq3=zeros(1,N3);
freqs=ISFREQ:IEFREQ;
for d=1:N3
    peak_vel(d)=max(LoveDCs_prf3(:,d));
    fid_peak(d)=find(LoveDCs_prf3(:,d)==peak_vel(d));
    cut_freq3(d)=freqs(fid_peak(d));
end
disp('The cut-off frequencies (Hz) of Profile 3:');
disp(cut_freq3);
% Calculating an average of the cut-off frequency
average_cut_freq3=sum(diff(cut_freq3))/(N3-1);
disp('Average of cut-off frequencies (Hz) of Profile 3:');
disp(average_cut_freq3);
% ------------------------------------------------------------------------
% The DCs of Profile 4
[M4,N4]=size(LoveDCs_prf4);
for p=1:N4
    subplot(224)
    plt=plot(ISFREQ:IEFREQ,LoveDCs_prf4(:,p));hold on
    title('The DCs of Profile 4')
    xlabel('Frequency [Hz]')
    ylabel('Phase velocity [m/s]');
end
% Calculating the cut-off frequencies
peak_vel=zeros(1,N4);fid_peak=zeros(1,N4);cut_freq4=zeros(1,N4);
freqs=ISFREQ:IEFREQ;
for d=1:N4
    peak_vel(d)=max(LoveDCs_prf4(:,d));
    fid_peak(d)=find(LoveDCs_prf4(:,d)==peak_vel(d));
    cut_freq4(d)=freqs(fid_peak(d));
end
% Create legend
legend4 = legend(subplot(224),'show');
set(legend4,...
    'Position',[0.76 0.22 0.14 0.22]);
title(legend4,'For all Profile');
disp('The cut-off frequencies (Hz) of Profile 4:');
disp(cut_freq4);
% Calculating an average of the cut-off frequency
average_cut_freq4=sum(diff(cut_freq4))/(N4-1);
disp('Average of cut-off frequencies (Hz) of Profile 4:');
disp(average_cut_freq4);
saveas(figure2,'../results/DCs Phase velocity vs Frequency.pdf')




