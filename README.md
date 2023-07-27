# MM1-model
There is a charging station with one delay line(waiting line), modeled by a M/M/1 queuing system which is to be dimensioned and optimized. In this scenario, we considered three charging stations which has a single delay line.\
We have random arrivals referred to as cars which arrive at different charging stations to charge their cars based on the distance they must travel, and, on time, they must wait in the queue for their respective service. The arrival rate and service rate at the three stations are different. 

**Goal:**
The goal is to find the probability that the arrivals choose a particular charging station depending on the time and distance parameter.

**Task:**
We have implemented this task in MATLAB. Initially, we generated the arrivals, departures, and their respective services randomly for each station using which we calculated the sojourn time.

Further, the mean waiting time of the Que for each station is calculated separately to analyze the possible waiting time at each station using LITTLE’s LAW. For that, we are considering the Nq/ λ. \
where, Nq=average number of customers in the queue. \
       λ = arrival rate \
To obtain this, we require the average number of customers, we have used a loop to run it for 100 batches and we determined the mean sojourn time and mean waiting time of each station. 
