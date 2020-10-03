clear;close all; clc
% please change these parameters in case of changing the orginal_data:
% series1 - series2 - series3 - q_av - q_o_s - n_s_e - sampling_frequancy -
% t_s - t - n_d
orginal_data = textread('Alh16.11.17.asc');
series1 = textread('series1.txt');
series2 = textread('series2.txt');
series3 = textread('series3.txt');
q_av = 40; % averaging number 
q_o_s = 18; %quantity of series
t = linspace(0, 498, 250); %time
n_s_e = [200,250,300,250,200,250]; %number of stimul in each series of an expirement
n_d = 9;%number of light diodes
n_o_electrodes = 22;
sampling_frequancy = 501;
channel=[string('stimul'),string('Fp1A1'), string('Fp2A2'), string('FpzA2'), string('F3A1'),string('F4A2'), string('FzA1'), string('C3A1'), string('C4A2'), string('CzA2'), string('P3A1'), string('P4A2'), string('PzA1'), string('O1A1'), string('O2A2'), string('OzA2'), string('F7A1'),string('F8A2'), string('T3A1'), string('T4A2'), string('T5A1'), string('T6A2') ];
%making initial matrix
main_series = zeros(sampling_frequancy,n_o_electrodes,n_d,q_o_s);
%starting time of each experiment
start_series = [];
t_s = [7,23;19,33;24,54;32,01;36,40;50,35]; %time of series
[n_o_e,m_s] = size(t_s);
for kk=1:n_o_e % number of experiments 
    start_series(kk,1) = (t_s(kk,1)*60 + t_s(kk,2))*500;
end;

j = 0;
n = length(orginal_data);
Stimuli = [];
for i=1:n
    if orginal_data(i,1) > 0
        Stimuli = [Stimuli i];
    end;
end;
start_s = zeros(1,n_o_e);
for kkk = 1:n_o_e
    for i=start_series(kkk,1):start_series(kkk,1)+500
        if orginal_data(i,1) == 1 && start_s(1,kkk)== 0
            start_s(1,kkk) =  i ;
        end;
    end;
end
for i = 1:length(Stimuli)
    for kkk = 1:n_o_e
        if Stimuli(1,i) == start_s(1,kkk) 
            start_s(1,kkk) =  i;
        end;
    end;
end
%splitting the data into 6 series (cuz in our case we have 6 series) 
%each series has 3 parts
%first series
n_o_s = 1; %number of series
stimuli_1= orginal_data(Stimuli(1,start_s(1,n_o_s)):Stimuli(1,start_s(1,n_o_s)+n_s_e(1,n_o_s)-1)+sampling_frequancy,:);
stimuli_2= orginal_data(Stimuli(1,start_s(1,n_o_s)+n_s_e(1,n_o_s)):Stimuli(1,start_s(1,n_o_s)+2*n_s_e(1,n_o_s)-1)+sampling_frequancy,:);
stimuli_3= orginal_data(Stimuli(1,start_s(1,n_o_s)+2*n_s_e(1,n_o_s)):Stimuli(1,start_s(1,n_o_s)+3*n_s_e(1,n_o_s)-1)+sampling_frequancy,:);
%second series
n_o_s = 2; %number of series
stimuli_4= orginal_data(Stimuli(1,start_s(1,n_o_s)):Stimuli(1,start_s(1,n_o_s)+n_s_e(1,n_o_s)-1)+sampling_frequancy,:);
stimuli_5= orginal_data(Stimuli(1,start_s(1,n_o_s)+n_s_e(1,n_o_s)):Stimuli(1,start_s(1,n_o_s)+2*n_s_e(1,n_o_s)-1)+sampling_frequancy,:);
stimuli_6= orginal_data(Stimuli(1,start_s(1,n_o_s)+2*n_s_e(1,n_o_s)):Stimuli(1,start_s(1,n_o_s)+3*n_s_e(1,n_o_s)-1)+sampling_frequancy,:);
%third series
n_o_s = 3; %number of series
stimuli_7= orginal_data(Stimuli(1,start_s(1,n_o_s)):Stimuli(1,start_s(1,n_o_s)+n_s_e(1,n_o_s)-1)+sampling_frequancy,:);
stimuli_8= orginal_data(Stimuli(1,start_s(1,n_o_s)+n_s_e(1,n_o_s)):Stimuli(1,start_s(1,n_o_s)+2*n_s_e(1,n_o_s)-1)+sampling_frequancy,:);
stimuli_9= orginal_data(Stimuli(1,start_s(1,n_o_s)+2*n_s_e(1,n_o_s)):Stimuli(1,start_s(1,n_o_s)+3*n_s_e(1,n_o_s)-1)+sampling_frequancy,:);
%fourth series
n_o_s = 4; %number of series
stimuli_10= orginal_data(Stimuli(1,start_s(1,n_o_s)):Stimuli(1,start_s(1,n_o_s)+n_s_e(1,n_o_s)-1)+sampling_frequancy,:);
stimuli_11= orginal_data(Stimuli(1,start_s(1,n_o_s)+n_s_e(1,n_o_s)):Stimuli(1,start_s(1,n_o_s)+2*n_s_e(1,n_o_s)-1)+sampling_frequancy,:);
stimuli_12= orginal_data(Stimuli(1,start_s(1,n_o_s)+2*n_s_e(1,n_o_s)):Stimuli(1,start_s(1,n_o_s)+3*n_s_e(1,n_o_s)-1)+sampling_frequancy,:);
%fifth series
n_o_s = 5; %number of series
stimuli_13= orginal_data(Stimuli(1,start_s(1,n_o_s)):Stimuli(1,start_s(1,n_o_s)+n_s_e(1,n_o_s)-1)+sampling_frequancy,:);
stimuli_14= orginal_data(Stimuli(1,start_s(1,n_o_s)+n_s_e(1,n_o_s)):Stimuli(1,start_s(1,n_o_s)+2*n_s_e(1,n_o_s)-1)+sampling_frequancy,:);
stimuli_15= orginal_data(Stimuli(1,start_s(1,n_o_s)+2*n_s_e(1,n_o_s)):Stimuli(1,start_s(1,n_o_s)+3*n_s_e(1,n_o_s)-1)+sampling_frequancy,:);
%sixth series
n_o_s = 6; %number of series
stimuli_16= orginal_data(Stimuli(1,start_s(1,n_o_s)):Stimuli(1,start_s(1,n_o_s)+n_s_e(1,n_o_s)-1)+sampling_frequancy,:);
stimuli_17= orginal_data(Stimuli(1,start_s(1,n_o_s)+n_s_e(1,n_o_s)):Stimuli(1,start_s(1,n_o_s)+2*n_s_e(1,n_o_s)-1)+sampling_frequancy,:);
stimuli_18= orginal_data(Stimuli(1,start_s(1,n_o_s)+2*n_s_e(1,n_o_s)):Stimuli(1,start_s(1,n_o_s)+3*n_s_e(1,n_o_s)-1)+sampling_frequancy,:);

%replace 1 with matrix numbers
m=1;
for i=1:length(stimuli_1)
    if stimuli_1(i,1) > 0
        stimuli_1(i,1) = series1(m,1);
        m = m+1;
    end;
end;
for i=1:length(stimuli_2)
    if stimuli_2(i,1) > 0
        stimuli_2(i,1) = series1(m,1);
        m = m+1;
    end;
end;
for i=1:length(stimuli_3)
    if stimuli_3(i,1) > 0
        stimuli_3(i,1) = series1(m,1);
        m = m+1;
    end;
end;
m=1;
for i=1:length(stimuli_4)
    if stimuli_4(i,1) > 0
        stimuli_4(i,1) = series1(m,1);
        m = m+1;
    end;
end;
for i=1:length(stimuli_5)
    if stimuli_5(i,1) > 0
        stimuli_5(i,1) = series1(m,1);
        m = m+1;
    end;
end;
for i=1:length(stimuli_6)
    if stimuli_6(i,1) > 0
        stimuli_6(i,1) = series1(m,1);
        m = m+1;
    end;
end;
m=1;
for i=1:length(stimuli_7)
    if stimuli_7(i,1) > 0
        stimuli_7(i,1) = series2(m,1);
        m = m+1;
    end;
end;
for i=1:length(stimuli_8)
    if stimuli_8(i,1) > 0
        stimuli_8(i,1) = series2(m,1);
        m = m+1;
    end;
end;
for i=1:length(stimuli_9)
    if stimuli_9(i,1) > 0
        stimuli_9(i,1) = series2(m,1);
        m = m+1;
    end;
end;
m=1;
for i=1:length(stimuli_10)
    if stimuli_10(i,1) == 1
        stimuli_10(i,1) = series2(m,1);
        m = m+1;
    end;
end;
for i=1:length(stimuli_11)
    if stimuli_11(i,1) > 0
        stimuli_11(i,1) = series2(m,1);
        m = m+1;
    end;
end;
for i=1:length(stimuli_12)
    if stimuli_12(i,1) > 0
        stimuli_12(i,1) = series2(m,1);
        m = m+1;
    end;
end;
m=1;
for i=1:length(stimuli_13)
    if stimuli_13(i,1) > 0
        stimuli_13(i,1) = series2(m,1);
        m = m+1;
    end;
end;
for i=1:length(stimuli_14)
    if stimuli_14(i,1) > 0
        stimuli_14(i,1) = series2(m,1);
        m = m+1;
    end;
end;
for i=1:length(stimuli_15)
    if stimuli_15(i,1) > 0
        stimuli_15(i,1) = series2(m,1);
        m = m+1;
    end;
end;
m=1;
for i=1:length(stimuli_16)
    if stimuli_16(i,1) > 0
        stimuli_16(i,1) = series3(m,1);
        m = m+1;
    end;
end;
for i=1:length(stimuli_17)
    if stimuli_17(i,1) > 0
        stimuli_17(i,1) = series3(m,1);
        m = m+1;
    end;
end;
for i=1:length(stimuli_18)
    if stimuli_18(i,1) > 0
        stimuli_18(i,1) = series3(m,1);
        m = m+1;
    end;
end;


%make a matrix for each number before averaging 
%series 1
n_o_i = zeros(1,9);
for i=1:length(stimuli_1)
    for v=1:9
        if stimuli_1(i,1) == v && n_o_i(1,v) < q_av
            n_o_i(1,v) = n_o_i(1,v)+1;
            j = i;
            k = 1;
            while k <sampling_frequancy
                main_series(k,:,v,1) = main_series(k,:,v,1) - stimuli_1(j,:);
                j = j+1;
                k = k+1;                   
            end;
        end;
    end;  
end;
n_o_i = zeros(1,9);
for i=1:length(stimuli_2)
    for v=1:9
        if stimuli_2(i,1) == v && n_o_i(1,v) < q_av
            n_o_i(1,v) = n_o_i(1,v)+1;
            j = i;
            k = 1;
            while k <sampling_frequancy
                main_series(k,:,v,2) = main_series(k,:,v,2) - stimuli_2(j,:);
                j = j+1;
                k = k+1;                   
            end;
        end;
    end;  
end;
n_o_i = zeros(1,9);
for i=1:length(stimuli_3)
    for v=1:9
        if stimuli_3(i,1) == v && n_o_i(1,v) < q_av
            n_o_i(1,v) = n_o_i(1,v)+1;
            j = i;
            k = 1;
            while k <sampling_frequancy
                main_series(k,:,v,3) = main_series(k,:,v,3) - stimuli_3(j,:);
                j = j+1;
                k = k+1;                   
            end;
        end;
    end;  
end;
n_o_i = zeros(1,9);
for i=1:length(stimuli_4)
    for v=1:9
        if stimuli_4(i,1) == v && n_o_i(1,v) < q_av
            n_o_i(1,v) = n_o_i(1,v)+1;
            j = i;
            k = 1;
            while k <sampling_frequancy
                main_series(k,:,v,4) = main_series(k,:,v,4) - stimuli_4(j,:);
                j = j+1;
                k = k+1;                   
            end;
        end;
    end;  
end;
n_o_i = zeros(1,9);
for i=1:length(stimuli_5)
    for v=1:9
        if stimuli_5(i,1) == v && n_o_i(1,v) < q_av
            n_o_i(1,v) = n_o_i(1,v)+1;
            j = i;
            k = 1;
            while k <sampling_frequancy 
                main_series(k,:,v,5) = main_series(k,:,v,5) - stimuli_5(j,:);
                j = j+1;
                k = k+1;                   
            end;
        end;
    end;  
end;
n_o_i = zeros(1,9);
for i=1:length(stimuli_6)
    for v=1:9
        if stimuli_6(i,1) == v && n_o_i(1,v) < q_av
            n_o_i(1,v) = n_o_i(1,v)+1;
            j = i;
            k = 1;
            while k <sampling_frequancy
                main_series(k,:,v,6) = main_series(k,:,v,6) - stimuli_6(j,:);
                j = j+1;
                k = k+1;                   
            end;
        end;
    end;  
end;
n_o_i = zeros(1,9);
for i=1:length(stimuli_7)
    for v=1:9
        if stimuli_7(i,1) == v && n_o_i(1,v) < q_av
            n_o_i(1,v) = n_o_i(1,v)+1;
            j = i;
            k = 1;
            while k <sampling_frequancy
                main_series(k,:,v,7) = main_series(k,:,v,7) - stimuli_7(j,:);
                j = j+1;
                k = k+1;                   
            end;
        end;
    end;  
end;
n_o_i = zeros(1,9);
for i=1:length(stimuli_8)
    for v=1:9
        if stimuli_8(i,1) == v && n_o_i(1,v) < q_av
            n_o_i(1,v) = n_o_i(1,v)+1;
            j = i;
            k = 1;
            while k <sampling_frequancy 
                main_series(k,:,v,8) = main_series(k,:,v,8) - stimuli_8(j,:);
                j = j+1;
                k = k+1;                   
            end;
        end;
    end;  
end;
n_o_i = zeros(1,9);
for i=1:length(stimuli_9)
    for v=1:9
        if stimuli_9(i,1) == v && n_o_i(1,v) < q_av
            n_o_i(1,v) = n_o_i(1,v)+1;
            j = i;
            k = 1;
            while k <sampling_frequancy
                main_series(k,:,v,9) = main_series(k,:,v,9) - stimuli_9(j,:);
                j = j+1;
                k = k+1;                   
            end;
        end;
    end;  
end;
n_o_i = zeros(1,9);
for i=1:length(stimuli_10)
    for v=1:9
        if stimuli_10(i,1) == v && n_o_i(1,v) < q_av
            n_o_i(1,v) = n_o_i(1,v)+1;
            j = i;
            k = 1;
            while k <sampling_frequancy
                main_series(k,:,v,10) = main_series(k,:,v,10) - stimuli_10(j,:);
                j = j+1;
                k = k+1;                   
            end;
        end;
    end;  
end;
n_o_i = zeros(1,9);
for i=1:length(stimuli_11)
    for v=1:9
        if stimuli_11(i,1) == v && n_o_i(1,v) < q_av
            n_o_i(1,v) = n_o_i(1,v)+1;
            j = i;
            k = 1;
            while k <sampling_frequancy
                main_series(k,:,v,11) = main_series(k,:,v,11) - stimuli_11(j,:);
                j = j+1;
                k = k+1;                   
            end;
        end;
    end;  
end;
n_o_i = zeros(1,9);
for i=1:length(stimuli_12)
    for v=1:9
        if stimuli_12(i,1) == v && n_o_i(1,v) < q_av
            n_o_i(1,v) = n_o_i(1,v)+1;
            j = i;
            k = 1;
            while k <sampling_frequancy
                main_series(k,:,v,12) = main_series(k,:,v,12) - stimuli_12(j,:);
                j = j+1;
                k = k+1;                   
            end;
        end;
    end;  
end;
n_o_i = zeros(1,9);
for i=1:length(stimuli_13)
    for v=1:9
        if stimuli_13(i,1) == v && n_o_i(1,v) < q_av
            n_o_i(1,v) = n_o_i(1,v)+1;
            j = i;
            k = 1;
            while k <sampling_frequancy
                main_series(k,:,v,13) = main_series(k,:,v,13) - stimuli_13(j,:);
                j = j+1;
                k = k+1;                   
            end;
        end;
    end;  
end;
n_o_i = zeros(1,9);
for i=1:length(stimuli_14)
    for v=1:9
        if stimuli_14(i,1) == v && n_o_i(1,v) < q_av
            n_o_i(1,v) = n_o_i(1,v)+1;
            j = i;
            k = 1;
            while k <sampling_frequancy
                main_series(k,:,v,14) = main_series(k,:,v,14) - stimuli_14(j,:);
                j = j+1;
                k = k+1;                   
            end;
        end;
    end;  
end;
n_o_i = zeros(1,9);
for i=1:length(stimuli_15)
    for v=1:9
        if stimuli_15(i,1) == v && n_o_i(1,v) < q_av
            n_o_i(1,v) = n_o_i(1,v)+1;
            j = i;
            k = 1;
            while k <sampling_frequancy 
                main_series(k,:,v,15) = main_series(k,:,v,15) - stimuli_15(j,:);
                j = j+1;
                k = k+1;                   
            end;
        end;
    end;  
end;
n_o_i = zeros(1,9);
for i=1:length(stimuli_16)
    for v=1:9
        if stimuli_16(i,1) == v && n_o_i(1,v) < q_av
            n_o_i(1,v) = n_o_i(1,v)+1;
            j = i;
            k = 1;
            while k <sampling_frequancy
                main_series(k,:,v,16) = main_series(k,:,v,16) - stimuli_16(j,:);
                j = j+1;
                k = k+1;                   
            end;
        end;
    end;  
end;
n_o_i = zeros(1,9);
for i=1:length(stimuli_17)
    for v=1:9
        if stimuli_17(i,1) == v && n_o_i(1,v) < q_av
            n_o_i(1,v) = n_o_i(1,v)+1;
            j = i;
            k = 1;
            while k <sampling_frequancy 
                main_series(k,:,v,17) = main_series(k,:,v,17) - stimuli_17(j,:);
                j = j+1;
                k = k+1;                   
            end;
        end;
    end;  
end;
n_o_i = zeros(1,9);
for i=1:length(stimuli_18)
    for v=1:9
        if stimuli_18(i,1) == v && n_o_i(1,v) < q_av
            n_o_i(1,v) = n_o_i(1,v)+1;
            j = i;
            k = 1;
            while k <sampling_frequancy
                main_series(k,:,v,18) = main_series(k,:,v,18) - stimuli_18(j,:);
                j = j+1;
                k = k+1;                   
            end;
        end;
    end;  
end;

for p=1:9
    for pp=1:q_o_s
    main_series(:,:,p,pp) = main_series(:,:,p,pp) / -(main_series(1,1,p,pp)/p);
    end;
end;

n_e = 10; %number of electrode
sum_pz=zeros(500,18,9);
for c=1:9
    sum_pz(1:500,1:18,c) = [main_series(1:500,n_e,c,1),main_series(1:500,n_e,c,2),main_series(1:500,n_e,c,3),main_series(1:500,n_e,c,4),main_series(1:500,n_e,c,5),main_series(1:500,n_e,c,6),main_series(1:500,n_e,c,7),main_series(1:500,n_e,c,8),main_series(1:500,n_e,c,9),main_series(1:500,n_e,c,10),main_series(1:500,n_e,c,11),main_series(1:500,n_e,c,12),main_series(1:500,n_e,c,13),main_series(1:500,n_e,c,14),main_series(1:500,n_e,c,15),main_series(1:500,n_e,c,16),main_series(1:500,n_e,c,17),main_series(1:500,n_e,c,18)];   
end;
%plot graphic
target = zeros(250,18,1);
non_target = zeros(250,18,9);
amplitude = [];
latency = [];
lat = linspace(252,450,100);
pks = [];
p300_amp = [];
p300_lat = [];
no_p300_amp = [];
no_p300_lat = [];
for ii=1:18 %number of series ~ must be 18 
    for peak=1:9
        [sese,mese] = findpeaks(sum_pz(126:225,ii,peak),lat);
        [dese,rese] = max(findpeaks(sum_pz(126:225,ii,peak),lat));
        amplitude = [amplitude dese];
        latency = [latency mese(1,rese)];
    end;
    figure
    hold on
    if ii == 1 || ii == 4 || ii == 7 || ii == 10 || ii == 13 || ii == 16 
        plot(t,sum_pz(1:250,ii,1),'y');
        plot(t,sum_pz(1:250,ii,2),'k');
        plot(t,sum_pz(1:250,ii,3),'m');
        plot(t,sum_pz(1:250,ii,4),'c');
        plot(t,sum_pz(1:250,ii,5),'b');
        plot(t,sum_pz(1:250,ii,6),'g');
        plot(t,sum_pz(1:250,ii,7),'color',[.185,.66,.245]);
        plot(t,sum_pz(1:250,ii,8),'color',[.245,.158,.66]);
        plot(t,sum_pz(1:250,ii,9),'r');
        for qr=1:8
            non_target(1:250,ii,qr) = sum_pz(1:250,ii,qr);
        end;
        target(1:250,ii,1) = sum_pz(1:250,ii,9);
    else
        plot(t,sum_pz(1:250,ii,1),'r');
        plot(t,sum_pz(1:250,ii,2),'k');
        plot(t,sum_pz(1:250,ii,3),'m');
        plot(t,sum_pz(1:250,ii,4),'c');
        plot(t,sum_pz(1:250,ii,5),'b');
        plot(t,sum_pz(1:250,ii,6),'g');
        plot(t,sum_pz(1:250,ii,7),'color',[.185,.66,.245]);
        plot(t,sum_pz(1:250,ii,8),'color',[.245,.158,.66]);
        plot(t,sum_pz(1:250,ii,9),'y');
        for qr=2:9
            non_target(1:250,ii,qr) = sum_pz(1:250,ii,qr);
        end;
        target(1:250,ii,1) = sum_pz(1:250,ii,1);
    end;    
    title(channel(1,n_e))
    xlabel('time')
    ylabel('Amplitude')
    legend('1','2','3','4','5','6','7','8','9')
    [qese,zese] = findpeaks(target(126:225,ii),lat);
    [bese,vese] = max(findpeaks(target(126:225,ii),lat));
    p300_amp = [p300_amp bese];
    p300_lat = [p300_lat zese(1,vese)];
    for peaks=1:9
        [uese,iese] = findpeaks(non_target(126:225,ii,peaks),lat);
        [oese,aese] = max(findpeaks(non_target(126:225,ii,peaks),lat));
        no_p300_amp = [no_p300_amp oese];
        no_p300_lat = [no_p300_lat iese(1,aese)];
    end;
end;
p300 = [p300_amp; p300_lat]';
no_p300 = [no_p300_amp; no_p300_lat]';
result = [p300_lat no_p300_lat; p300_amp no_p300_amp]';
