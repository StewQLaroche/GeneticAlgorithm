function [KIDS] = crossover(PAR1,PAR2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
N=length(PAR1);
fp=randi([0 (N-1)],1,2);
fp=sort(fp);

KID1=[PAR1(1:fp(1)),PAR2(fp(1)+1:fp(2)),PAR1(fp(2)+1:end)];
KID2=[PAR2(1:fp(1)),PAR1(fp(1)+1:fp(2)),PAR2(fp(2)+1:end)];

KIDS=[KID1;KID2];

end

