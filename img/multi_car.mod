param M;
param N;# of station
param P;# max cap of truck 
param S;# max # of section
param Dis{i in 1..N, j in 1..N};
param Fixed_cost;
param Var_cost;

param Available_bike{i in 1..N};
param Total_cap{i in 1..N};

var Load{i in 1..N, j in 1..N, s in 1..S , a in 1..M};
var K{i in 1..N, j in 1..N, s in 1..S, a in 1..M} binary;

minimize cost:
    sum{a in 1..M} sum{i in 1..N} sum{j in 1..N} sum{s in 1..S} (Load[i,j,s,a] * Var_cost * Dis[i,j] + K[i,j,s,a] * Fixed_cost);
    
subject to Connected_all{s in 1..S-1, a in 1..M}:
    sum{i in 1..N} sum{j in 1..N} K[i,j,s,a] >= sum{i in 1..N} sum{j in 1..N} K[i,j,s+1,a];    

subject to After_satisified_all_route{j in 1..N, s in 1..S-1, a in  1..M}:
    sum{i in 1..N} K[i,j,s,a] >= sum{k in 1..N}K[j,k,s+1,a]; 

subject to Not_self_connected_route{i in 1..N, s in 1..S, a in 1..M}:
    K[i,i,s,a] = 0;

subject to Travel_a_place_each_time{s in 1..S, a in 1..M}:
    sum{i in 1..N} sum{j in 1..N} K[i,j,s,a] <= 1;

subject to Truck_cap{i in 1..N, j in 1..N, s in 1..S, a in 1..M}:
    Load[i,j,s,a] <= P;

subject to Binary_con{i in 1..N, j in 1..N, s in 1..S, a in 1..M}:
    Load[i,j,s,a] <= K[i,j,s,a] * Total_cap[i];

subject to Binary_con2{i in 1..N, j in 1..N, s in 1..S}:
    sum{a in 1..M} Load[i,j,s,a] <= sum{a in 1..M} K[i,j,s,a] * Total_cap[i];

subject to Fullfill_upper_bound{i in 1..N}:
    Available_bike[i] - sum{a in 1..M} sum{j in 1..N} sum{s in 1..S}Load[i,j,s,a] + sum{a in 1..M}sum{j in 1..N} sum{s in 1..S}Load[j,i,s,a] <= 0.8 * Total_cap[i];

subject to Fullfill_lower_bound{i in 1..N}:
    Available_bike[i] - sum{a in 1..M}sum{j in 1..N}sum{s in 1..S} Load[i,j,s,a] + sum{a in 1..M} sum{j in 1..N} sum{s in 1..S}Load[j,i,s,a] >= 0.2 * Total_cap[i];

subject to non_neg{i in 1..N, j in 1..N, s in 1..S, a in 1..M}:
    Load[i,j,s,a] >= 0;
