function fx = NewtonInterpolation(x,fx) 
for k = 2:length(fx)
for j = length(fx):-1:k
fx(j) = (fx(j) - fx(j-1))/(x(j)-x(j-k+1));
end
end
