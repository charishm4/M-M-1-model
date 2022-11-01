# M-M-1-model
There is a charging station with one delay line, modelled by a M/M/1 queuing system which is to be dimensioned and optimized. In this scenario, we considered three charging stations which has a single delay line.
We have random arrivals referred as cars which arrive at different charging stations to charge their cars based on the distance they must travel, and, on the time, they must wait in the que for their respective service.
The arrival rate and service rate at three stations are different.
The goal is to find the probability that the arrivals choose a particular charging station depending on the time and distance parameter.
We have implemented this task in MATLAB. Initially, we have generated the arrivals, departures, and their respective services randomly for each station using which we calculated the sojourn time.
Further, the mean waiting time of the Que for each station is calculated separately to analyse the possible waiting time at each station using LITTLE’s LAW. For that, we are considering the Nq/ λ.
where, Nq=average number of customers in the que. λ = arrival rate
The distance is generated using the uniform random and it is scaled to obtain it as a distance parameter.
Determined the probability of the arrivals choosing each based station, based on the distance and waiting time at each station.
