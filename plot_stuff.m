function [] = plot_shit(poly,test)
%USED BY EBPF
%It plots shit

hold on;

x=[-1:0.001:1];
for i=1:length(x)
    y(i)=poly(1)*x(i)^3+poly(2)*x(i)^2+poly(3)*x(i)+poly(4);
end
if test==1
    plot(x,y,'k');
end
if test==0
    plot(x,y,'r--');
end

end

