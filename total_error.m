function [sum] = total_error(gen,test,N)
%USED BY EBPF
%Calculates error for EBPF program

sum=ones(1,N);
for n=1:length(gen(:,1));
    for j=-1:0.001:1
        holder=abs((test(1)*j^3+test(2)*j^2+test(3)*j+test(4)) - (gen(n,1)*j^3+gen(n,2)*j^2+gen(n,3)*j+gen(n,4)));
        sum(n)=sum(n)+holder;
    end
end
sum=sum*0.001;
end

