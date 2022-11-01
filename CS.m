
function [Tarr, Tdep, sujourn_time,nq] = CS(lambda,mu,simtime)
present_time=0;
step_value=1;
current_customers=0;
event=zeros(1,3); 
event(1)=exprnd(1/lambda); % arrival
event(2)=inf; 
event(3)=exprnd(step_value);
nmeasurements=0; 
ndeparted=0; %number of departed customers
narrived=0; %number of arrived customers

while present_time<simtime
    [present_time, nextevent ]=min(event);

    % if the event is arrival:
    if nextevent==1
        event(1)=exprnd(1/lambda)+present_time; % arrival for the next person
        current_customers=current_customers+1;
        narrived=narrived+1;
        % storing the stamptimes of arrivals in an array
        Tarr(narrived)=present_time;
        % generating departure time for the customer
        if current_customers==1
            service_time=exprnd(1/mu);  
            event(2)=service_time+present_time; % departure
           %event(2)=exprnd(1/mu)+present_time; % departure time
        end

    % if the event is departure
    elseif nextevent==2
        current_customers=current_customers-1;
        ndeparted=ndeparted+1;
        Tdep(ndeparted)=present_time;
        s_time=present_time-Tarr(narrived-current_customers);
        sujourn_time(ndeparted)=s_time;

        if current_customers>0
            % service for next customer         
            service_time=exprnd(1/mu);
            event(2)=service_time+present_time; % departure 
            %event(2)=exprnd(1/mu)+present_time; 
        else
            event(2)=inf; % if the system is empty.
        end
    else
        nmeasurements=nmeasurements+1;
        N(nmeasurements)=current_customers;
        event(3)=event(3)+exprnd(step_value); 
    end
end

nq=current_customers-1; % que length
tp=nq<0; % if there is no one in que, put 0 in -ve values
nq(tp)=0; 
