function [curr_gen] = cycle(curr_gen,eam,N)
%USED BY EBPF
%Takes current gen and errors and markers and performs selection,
%crossover, and mutation

best_err=min(eam(:,1));
sorted_error=heapsort(eam);
half_N=N/2;

%Places best 50% of generation in first, sorted by fitness
for i=1:half_N
    curr_gen(i,:)=curr_gen(sorted_error(i,2),:);
end

%Selection takes best 50% of population and randomly assigns parent pairs
tix=ones(half_N,2);
tix(:,1)=rand([1,half_N]);
tix(:,2)=fliplr(linspace(half_N,1,half_N));
queue=heapsort(tix);

for j=1:(half_N/2)
    curr_gen(half_N+j:half_N+j+1,:)=crossover(curr_gen(queue(j,2),:),curr_gen(queue(j+1,2),:));
end

%Mutation
mutation_rate=(best_err)/100;
for p=(half_N+1):N
    for q=1:length(curr_gen(1,:))
        if rand(1) < mutation_rate
            curr_gen(p,q)=abs(1-curr_gen(p,q));
        end
    end
end
    
end

