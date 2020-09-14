% one hanging node, create Trafo-Matrix I

function I = trafo_matrix(n,n_h)
% n is number of basis functions, i.e. Bilinear has n=4,
% biquadratic is n=9; and so on
% n_h is number of hanging nodes per element (can be 1 or 2)

% one hanging node per element
if n_h == 1 || n_h == 2
  I = eye(n,n);
  idx = 1:sqrt(n):n; %columns that need to be changed
  jdx = idx(2:2:end); % constrained nodes
  kdx = idx(1:2:end); % free nodes
  I(kdx,idx) = eye(size(kdx,2),size(idx,2));
  x = linspace(0,1,sqrt(n));
  y = [1,zeros(1,sqrt(n)-1)];
  for i = 1:sqrt(n)
    fx = NewtonInterpolation(x,y);
    xx = linspace(0,1/2,sqrt(n));
    I(jdx,idx(i)) = HornerNewton(fx,xx(2:2:end),x);
    y = y([sqrt(n),1:1:sqrt(n)-1]);
  end
  if n_h == 2 % two hanging nodes per element
    idx = 1:1:sqrt(n); % columns that need to be changed
    jdx = idx(2:2:end); % constrained nodes
    kdx = idx(1:2:end); % free nodes
    I(kdx,idx) = eye(size(kdx,2),size(idx,2));
    x = linspace(0,1,sqrt(n));
    y = [1,zeros(1,sqrt(n)-1)];
    for i = 1:sqrt(n)
      fx = NewtonInterpolation(x,y);
      xx = linspace(0,1/2,sqrt(n));
      I(jdx,idx(i)) = HornerNewton(fx,xx(2:2:end),x);
      y = y([sqrt(n),1:1:sqrt(n)-1]);
    end
  end
else % all other cases no transformation
  I = eye(n,n);
  return;
end
end