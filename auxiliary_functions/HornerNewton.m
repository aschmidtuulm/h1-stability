function value = HornerNewton(a,x0,x)

 % evaluate Newton polynom
 % p(x0)  = a(1) + a(2)*(x0-x(1)) + a(3)*(x0-x(1))*(x0-x(2)) + ... 
 % = a(1) + ( (x0-x(1)) * ( a(2) + (x0-x(2)) * ( a(3) ....
value = a(end);
for k=length(a)-1:-1:1
value = a(k) + value.*(x0-x(k));
end