function [gene] = param2gene(params,int_num,frac_num)
%USED BY EBPF
%Returns binary gene, with int_num+frac_num bits defining each parameter

gene=[];
for p=1:length(params)
    gene = [gene,fix(rem(params(p)*pow2(-(int_num-1):frac_num),2))]; 
end

end

