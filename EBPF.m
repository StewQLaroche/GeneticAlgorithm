function [next_gen] = EBPF( )
%Evolution_Based_Polynomial_Fit
%   Uses genetic based evolution of random parameters so fit a 4-degree 
%   polynomial. 

%Sets initial parameters of random curves and the "test" curve
%Also sets number of units in each generation
test_poly=10*rand([1,4])
N=1000; %mod(N,4) must be zero
first_gen=10*rand([N,4]);

%Sets precision and size limit of binary conversion
int_num = 5;         % number bits for integer part of your number      
frac_num = 18;       % number bits for fraction part of your number

%Creates binary genes for all units (easier to work with that floating 
%point numbers), where each row is a 92 bit length gene
for i=1:N
    first_gen_gene(i,:)=param2gene(first_gen(i,:),int_num,frac_num);
end

%Creates a list of errors by which the units will be judged, and assigns
%values so rank can be tracked (possibly not needed)
error_and_markers=ones(N,2);
error_and_markers(:,1)=total_error(first_gen,test_poly,N);
error_and_markers(:,2)=fliplr(linspace(N,1,N));

%Starts the plotting of just the "test" curve
hold on
plot_stuff(test_poly,1);


%Runs through a set number of generations
next_gen_gene=first_gen_gene;
for j=1:40
    next_gen_gene=cycle(next_gen_gene,error_and_markers,N);
    
    
    for i=1:N
        next_gen(i,:)=gene2param(next_gen_gene(i,:),int_num,frac_num);
    end
    
    error_and_markers(:,1)=total_error(next_gen,test_poly,N);
    error_and_markers(:,2)=fliplr(linspace(N,1,N));
    
    %Clears plot
    clf
    
    %Plots stuff
    plot_shit(test_poly,1);
    for z=1:5
        hold on;
        plot_shit(next_gen(z,:),0);
    end
    pause(0.1);
end

end

