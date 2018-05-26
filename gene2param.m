function [params] = gene2param(gene,int_num,frac_num)
%USED BY EBPF
%Returns polynomial parameters based on binary gene with int_num+frac_num
%bits used in each parameter

params=[];
for q=1:(length(gene)/(int_num+frac_num))
    params = [params,gene((1+(q-1)*(int_num+frac_num)):(q*(int_num+frac_num)))*pow2(int_num-1:-1:-frac_num).'];
end

end

