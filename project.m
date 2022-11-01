
% Arrival rates
lambda1=6;   % arrival rate for station1. 7 per hr
lambda2=13;  % arrival rate for station2
lambda3=9;   % arrival rate for station3

% Service rates
mu1=11;      % service rate for station1. 10 per hr
mu2=19;      % service rate for station2
mu3=14;      % service rate for station3
simtime=10;  % total simulation time in hours

nq1=[];    % avg number of customers in que for system 1
nq2=[];    % avg number of customers in que for system 2
nq3=[];    % avg number of customers in que for system 3
stime1=[]; %sojourn time at system1
stime2=[]; %sojourn time at system2
stime3=[]; %sojourn time at system3

for i=1:100
    [arr1,dep1,sujourn_time1,cn1]=CS(lambda1,mu1,simtime);
    [arr2,dep2,sujourn_time2,cn2]=CS(lambda2,mu2,simtime);
    [arr3,dep3,sujourn_time3,cn3]=CS(lambda3,mu3,simtime);
    nq1(i)=cn1;
    nq2(i)=cn2;
    nq3(i)=cn3;
    stime1(i)=mean(sujourn_time1);
    stime2(i)=mean(sujourn_time2);
    stime3(i)=mean(sujourn_time3);

end

% mean of sujourn times to visualize
s1=mean(stime1);
s2=mean(stime2);
s3=mean(stime3);

% avg waiting time in que: w=nq/lambda
w1=mean(nq1)/lambda1;
w2=mean(nq2)/lambda2;
w3=mean(nq3)/lambda3;
w=[w1,w2,w3];

% plotting sujourn time and waiting time of each system
y=[s1,s2,s3;w1,w2,w3];
figure, bar(y),legend('system1','system2','system3'), title('sujourn time and waiting time')

% distance to each station. 
N=4; % N arrivals
d1=rand(N,1)*100;
d2=rand(N,1)*100;
d3=rand(N,1)*100;

arrivals=[1,2,3,4]; % arrivals referred as cars

% for first arrival
d1_stations=[d1(1,1);d2(1,1);d3(1,1)]; % arrival1 distance to station 1,2,3
sujourntime1=[stime1(1);stime2(1);stime3(1)]; % arrival1 sujourn time for system 1,2,3
time_forarr1=d1_stations.*sujourntime1; % distance*sujourn time
[min_arr1,i1]=min(time_forarr1); % minimum of distance*sujourn time at station1
min_st1=min(sujourntime1); 
min_d1=min(d1_stations);

% for second arrival
d2_stations=[d1(2,1);d2(2,1);d3(2,1)];
sujourntime2=[stime1(2);stime2(2);stime3(2)];
time_forarr2=d2_stations.*sujourntime2;
[min_arr2,i2]=min(time_forarr2);
min_st2=min(sujourntime2);
min_d2=min(d2_stations);

% for third arrival
d3_stations=[d1(3,1);d2(3,1);d3(3,1)];
sujourntime3=[stime1(3);stime2(3);stime3(3)];
time_forarr3=d3_stations.*sujourntime3;
min_st3=min(sujourntime3);
min_d3=min(d3_stations);
[min_arr3, i3]=min(time_forarr3);

% for fourth arrival
d4_stations=[d1(4,1);d2(4,1);d3(4,1)];
sujourntime4=[stime1(4);stime2(4);stime3(4)];
time_forarr4=d4_stations.*sujourntime4;
min_st4=min(sujourntime4);
min_d4=min(d4_stations);
[min_arr4,i4]=min(time_forarr4);

st=[min_st1,min_st2,min_st3,min_st4]; % minimum sujourn times for each arrival
d=[min_d1,min_d2,min_d3,min_d4]; % minimum distances for each arriavl


obs=[min_arr1,w(i1);min_arr2,w(i2);min_arr3,w(i3);min_arr4,w(i4)];
figure, bar(arrivals,st), xlabel('arrivals'), ylabel('sujourn time')
figure, bar(arrivals,d), xlabel('arrivals'), ylabel('distance')
figure, bar(obs), legend('distance*sujourn time','waiting time'), xlabel('arrivals')

table(d1_stations,sujourntime1,time_forarr1)
table(d2_stations,sujourntime2,time_forarr2)
table(d3_stations,sujourntime3,time_forarr3)
table(d4_stations,sujourntime4,time_forarr4)