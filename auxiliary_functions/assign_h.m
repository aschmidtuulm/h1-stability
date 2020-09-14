function [h_plus,h_minus] = assign_h(m, n_h, coordinates)
%define h_plus and h_minus accordings to combinations m, number of
%hanging nodes per element n_h and the coordinates
nC = size(coordinates,1);
h = 2.^(-m/2);
if n_h ==1 % one hanging node
  % h_plus
  h1 = h;
  h1(:,4) = (h(:,1)+h(:,4))/2; % constraint at hanging node
  f = @(x,y) h1(:,1)+(h1(:,2)-h1(:,1)).*x+(h1(:,4)-h1(:,1)).*y+(h1(:,3)+h1(:,1)-h1(:,2)-h1(:,4)).*x*y;
  h_plus = [];
  for i=1:length(coordinates)
    h_plus = [h_plus, f(coordinates(i,1),coordinates(i,2))];
  end
  % correct irregular edge
  f = @(x) (h(:,4)-h(:,1)).*x+h(:,1);
  idx = 1:sqrt(nC):nC;
  for i = 1: length(idx)
    h_plus(:,idx(i)) = f(coordinates(idx(i),2));
  end
  % h_minus
  h0 = 1./h;
  h2 = h0;
  h2(:,4) = (h0(:,1)+h0(:,4))/2; % constraint at hanging node
  g = @(x,y) h2(:,1)+(h2(:,2)-h2(:,1)).*x+(h2(:,4)-h2(:,1)).*y+(h2(:,3)+h2(:,1)-h2(:,2)-h2(:,4)).*x*y;
  h_minus = [];
  for i=1:length(coordinates)
    h_minus = [h_minus, g(coordinates(i,1),coordinates(i,2))];
  end
  % correct irregular edge
  g = @(x) (h0(:,4)-h0(:,1)).*x+h0(:,1);
  idx = 1:sqrt(nC):nC;
  for i = 1: length(idx)
    h_minus(:,idx(i)) = g(coordinates(idx(i),2));
  end
elseif n_h ==2 % two hanging nodes
    % h_plus
  h1 = h;
  h1(:,4) = (h(:,1)+h(:,4))/2; % constraint at hanging node 1
  h1(:,2) = (h(:,1)+h(:,2))/2; % constraint at hanging node 2
  f = @(x,y) h1(:,1)+(h1(:,2)-h1(:,1)).*x+(h1(:,4)-h1(:,1)).*y+(h1(:,3)+h1(:,1)-h1(:,2)-h1(:,4)).*x*y;
  h_plus = [];
  for i=1:length(coordinates)
    h_plus = [h_plus, f(coordinates(i,1),coordinates(i,2))];
  end
  % correct irregular edge 1
  f = @(x) (h(:,4)-h(:,1)).*x+h(:,1);
  idx = 1:sqrt(nC):nC;
  for i = 1: length(idx)
    h_plus(:,idx(i)) = f(coordinates(idx(i),2));
  end
  % correct irregular edge 2
  f = @(x) (h(:,2)-h(:,1)).*x+h(:,1);
  idx = 1:1:sqrt(nC);
  for i = 1: length(idx)
    h_plus(:,idx(i)) = f(coordinates(idx(i),1));
  end
  % h_minus
  h0 = 1./h;
  h2 = h0;
  h2(:,4) = (h0(:,1)+h0(:,4))/2; % constraint at hanging node 1
  h2(:,2) = (h0(:,1)+h0(:,2))/2; % constraint at hanging node 2
  g = @(x,y) h2(:,1)+(h2(:,2)-h2(:,1)).*x+(h2(:,4)-h2(:,1)).*y+(h2(:,3)+h2(:,1)-h2(:,2)-h2(:,4)).*x*y;
  h_minus = [];
  for i=1:length(coordinates)
    h_minus = [h_minus, g(coordinates(i,1),coordinates(i,2))];
  end
  % correct irregular edge 1
  g = @(x) (h0(:,4)-h0(:,1)).*x+h0(:,1);
  idx = 1:sqrt(nC):nC;
  for i = 1: length(idx)
    h_minus(:,idx(i)) = g(coordinates(idx(i),2));
  end
    % correct irregular edge 2
  g = @(x) (h0(:,2)-h0(:,1)).*x+h0(:,1);
  idx = 1:1:sqrt(nC);
  for i = 1: length(idx)
    h_minus(:,idx(i)) = g(coordinates(idx(i),1));
  end
else % no hanging node
  f = @(x,y) h(:,1)+(h(:,2)-h(:,1)).*x+(h(:,4)-h(:,1)).*y+(h(:,3)+h(:,1)-h(:,2)-h(:,4)).*x*y;
  h_plus = [];
  for i=1:length(coordinates)
    h_plus = [h_plus, f(coordinates(i,1),coordinates(i,2))];
  end
  h2 = 1./h;
  g = @(x,y) h2(:,1)+(h2(:,2)-h2(:,1)).*x+(h2(:,4)-h2(:,1)).*y+(h2(:,3)+h2(:,1)-h2(:,2)-h2(:,4)).*x*y;
  h_minus = [];
  for i=1:length(coordinates)
    h_minus = [h_minus, g(coordinates(i,1),coordinates(i,2))];
  end
end
end

