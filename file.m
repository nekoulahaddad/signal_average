clear ; close all; clc
orginal_data = textread('Alh16.11.17.asc');
series1 = textread('series1.txt');
series2 = textread('series2.txt');
series3 = textread('series3.txt');
sampling_frequancy = 501;
one = zeros(sampling_frequancy,22);
two = zeros(sampling_frequancy,22);
three = zeros(sampling_frequancy,22);
four = zeros(sampling_frequancy,22);
five = zeros(sampling_frequancy,22);
six = zeros(sampling_frequancy,22);
seven = zeros(sampling_frequancy,22);
eight = zeros(sampling_frequancy,22);
nine = zeros(sampling_frequancy,22);
j = 0;
n_o_i = 0; %number of iterations of the same number
n = length(orginal_data);
t = linspace(0, 1000, 500);
Stimuli = [];
for i=1:n;
    if orginal_data(i,1) > 0;
        Stimuli = [Stimuli i];
    end;
end;
m=1;

%splitting the data into 6 series (cuz in our case we have 6 series)
stimuli_1= orginal_data(Stimuli(1,141):Stimuli(1,340)+sampling_frequancy,:);
stimuli_2= orginal_data(Stimuli(1,781):Stimuli(1,1531)-1,:);
stimuli_3= orginal_data(Stimuli(1,1596):Stimuli(1,2496)-1,:);
stimuli_4= orginal_data(Stimuli(1,2536):Stimuli(1,3286)-1,:);
stimuli_5= orginal_data(Stimuli(1,1596):Stimuli(1,2496)-1,:);
stimuli_6= orginal_data(Stimuli(1,4022):Stimuli(1,4772)-1,:);


%replace 1 with matrix numbers
for i=1:length(stimuli_1);
    if stimuli_1(i,1) > 0;
        stimuli_1(i,1) = series1(m,1);
        m = m+1;
    end;
end;


%make a matrix for each number before averaging 
for i=1:length(stimuli_1);
   if stimuli_1(i,1) == 1
        n_o_i = n_o_i+1;
        j = i;
        k = 1;
        while stimuli_1(j,1) == 1 || stimuli_1(j,1) == 0 && k <501 ;
            one(k,:) = abs(one(k,:)) + abs(stimuli_1(j,:));
            j = j+1;
            k = k+1;                   
        end;
    end;
   if stimuli_1(i,1) == 2
        n_o_i = n_o_i+1;
        j = i;
        k = 1;
        while stimuli_1(j,1) == 2 || stimuli_1(j,1) == 0 && k <501 ;
            two(k,:) = abs(two(k,:)) + abs(stimuli_1(j,:));
            j = j+1;
            k = k+1;                   
        end;
    end;
   if stimuli_1(i,1) == 3
        n_o_i = n_o_i+1;
        j = i;
        k = 1;
        while stimuli_1(j,1) == 3 || stimuli_1(j,1) == 0 && k <501 ;
            three(k,:) = abs(three(k,:)) + abs(stimuli_1(j,:));
            j = j+1;
            k = k+1;                   
        end;
    end;
    if stimuli_1(i,1) == 4
        n_o_i = n_o_i+1;
        j = i;
        k = 1;
        while stimuli_1(j,1) == 4 || stimuli_1(j,1) == 0 && k <501 ;
            four(k,:) = abs(four(k,:)) + abs(stimuli_1(j,:));
            j = j+1;
            k = k+1;                   
        end;
    end;
    if stimuli_1(i,1) == 5
        n_o_i = n_o_i+1;
        j = i;
        k = 1;
        while stimuli_1(j,1) == 5 || stimuli_1(j,1) == 0 && k <501 ;
            five(k,:) = abs(five(k,:)) + abs(stimuli_1(j,:));
            j = j+1;
            k = k+1;                   
        end;
    end;
    if stimuli_1(i,1) == 6
        n_o_i = n_o_i+1;
        j = i;
        k = 1;
        while stimuli_1(j,1) == 6 || stimuli_1(j,1) == 0 && k <501 ;
            six(k,:) = abs(six(k,:)) + abs(stimuli_1(j,:));
            j = j+1;
            k = k+1;                   
        end;
    end;
    if stimuli_1(i,1) == 7
        n_o_i = n_o_i+1;
        j = i;
        k = 1;
        while stimuli_1(j,1) == 7 || stimuli_1(j,1) == 0 && k <501 ;
            seven(k,:) = abs(seven(k,:)) + abs(stimuli_1(j,:));
            j = j+1;
            k = k+1;                    
        end;
    end;
    if stimuli_1(i,1) == 8
        n_o_i = n_o_i+1;
        j = i;
        k = 1;
        while stimuli_1(j,1) == 8 || stimuli_1(j,1) == 0 && k <=500 ;
            eight(k,:) = abs(eight(k,:)) + abs(stimuli_1(j,:));
            j = j+1;
            k = k+1;                    
        end;
    end;
    if stimuli_1(i,1) == 9
        n_o_i = n_o_i+1;
        j = i;
        k = 1;
        while stimuli_1(j,1) == 9 || stimuli_1(j,1) == 0 && k <501 ;
            nine(k,:) = abs(nine(k,:)) + abs(stimuli_1(j,:));
            j = j+1;
            k = k+1;                    
        end;
    end;
    %{
    if stimuli_1(i,1) == 7
        j = i;
        while stimuli_1(j,1) == 7 || stimuli_1(j,1) == 0;
            seven = [seven; stimuli_1(j,:)];
            j = j+1;
        end;
    end;
    %}
    
end;
one_final = one / (one(1,1)/1);
two_final = two / (two(1,1)/2);
three_final = three / (three(1,1)/3);
four_final = four / (four(1,1)/4);
five_final = five / (five(1,1)/5);
six_final = six / (six(1,1)/6);
seven_final = seven / (seven(1,1)/7);
eight_final = eight / (eight(1,1)/8);
nine_final = nine / (nine(1,1)/9);

for ii=2:22;
figure
hold on 
plot(t,one_final(1:500,ii),'k');
plot(t,two_final(1:500,ii),'k');
plot(t,three_final(1:500,ii),'k');
plot(t,four_final(1:500,ii),'k');
plot(t,five_final(1:500,ii),'k');
plot(t,six_final(1:500,ii),'k');
plot(t,seven_final(1:500,ii),'k');
plot(t,eight_final(1:500,ii),'k');
plot(t,nine_final(1:500,ii),'y');
end;

