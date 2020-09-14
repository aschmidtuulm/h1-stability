%compute minimal eigenvalues for finite number of cases
% triangles without hanging nodes

%% load mass matrix 
%-----------------------------------
% change directory to corresponding p

load('mass_matrices/tri/4/mass_matrix.mat'); % 1,2,3,...,12
%-----------------------------------
M = mat;
n = size(mat,1); dim = 1/2*(sqrt(8*n+1)-1);
%p= n-1;
coordinates = zeros(n,2); % degrees of freedom in triangle
for i=1:dim
    for j=1:dim-i+1
        coordinates(1/2*(dim*(dim + 1) - (dim - i + 2)*(dim - i + 1)) + j, 1) = (j - 1)/(dim - 1);
        coordinates(1/2*(dim*(dim + 1) - (dim - i + 2)*(dim - i + 1)) + j, 2) = (i - 1)/(dim - 1); 
    end
end

%% mu = 1

m = [0,0,1;0,1,1];
h = 2.^(-m/2);
f = @(x,y) h(:,1)+(h(:,2)-h(:,1)).*x+(h(:,3)-h(:,1)).*y;
h_plus = [];
for i=1:length(coordinates) 
    h_plus = [h_plus, f(coordinates(i,1),coordinates(i,2))];
end
h2 = 1./h;
g = @(x,y) h2(:,1)+(h2(:,2)-h2(:,1)).*x+(h2(:,3)-h2(:,1)).*y;
h_minus = [];
for i=1:length(coordinates) 
    h_minus = [h_minus, g(coordinates(i,1),coordinates(i,2))];
end
lambda_min = zeros(size(m,1),1);
for it = 1:size(m,1)
    dummy = zeros(n,n);
    for i = 1:n
        for j = 1:n
            dummy(i,j) = 1/2*(h_plus(it,i)*h_minus(it,j)+h_plus(it,j)*h_minus(it,i));
        end
    end

    A = dummy.*M;
    lambda_min(it,1) = min(eig(A,M));
end

overall = [min(lambda_min)];
%% mu = 2
m = [0,0,2;0,1,2;0,2,2];
h = 2.^(-m/2);
f = @(x,y) h(:,1)+(h(:,2)-h(:,1)).*x+(h(:,3)-h(:,1)).*y;
h_plus = [];
for i=1:length(coordinates) 
    h_plus = [h_plus, f(coordinates(i,1),coordinates(i,2))];
end
h2 = 1./h;
g = @(x,y) h2(:,1)+(h2(:,2)-h2(:,1)).*x+(h2(:,3)-h2(:,1)).*y;
h_minus = [];
for i=1:length(coordinates) 
    h_minus = [h_minus, g(coordinates(i,1),coordinates(i,2))];
end
lambda_min = zeros(size(m,1),1);
for it = 1:size(m,1)
    dummy = zeros(n,n);
    for i = 1:n
        for j = 1:n
            dummy(i,j) = 1/2*(h_plus(it,i)*h_minus(it,j)+h_plus(it,j)*h_minus(it,i));
        end
    end

    A = dummy.*M;
    lambda_min(it,1) = min(eig(A,M));
end
overall = [overall;min(lambda_min)];
%% mu = 3
m = [0,0,3;0,1,3;0,2,3;0,3,3];
h = 2.^(-m/2);
f = @(x,y) h(:,1)+(h(:,2)-h(:,1)).*x+(h(:,3)-h(:,1)).*y;
h_plus = [];
for i=1:length(coordinates) 
    h_plus = [h_plus, f(coordinates(i,1),coordinates(i,2))];
end
h2 = 1./h;
g = @(x,y) h2(:,1)+(h2(:,2)-h2(:,1)).*x+(h2(:,3)-h2(:,1)).*y;
h_minus = [];
for i=1:length(coordinates) 
    h_minus = [h_minus, g(coordinates(i,1),coordinates(i,2))];
end
lambda_min = zeros(size(m,1),1);
for it = 1:size(m,1)
    dummy = zeros(n,n);
    for i = 1:n
        for j = 1:n
            dummy(i,j) = 1/2*(h_plus(it,i)*h_minus(it,j)+h_plus(it,j)*h_minus(it,i));
        end
    end

    A = dummy.*M;
    lambda_min(it,1) = min(eig(A,M));
end

overall = [overall;min(lambda_min)];
%% mu = 4
m = [0,0,4;0,1,4;0,2,4;0,3,4;0,4,4];
h = 2.^(-m/2);
f = @(x,y) h(:,1)+(h(:,2)-h(:,1)).*x+(h(:,3)-h(:,1)).*y;
h_plus = [];
for i=1:length(coordinates) 
    h_plus = [h_plus, f(coordinates(i,1),coordinates(i,2))];
end
h2 = 1./h;
g = @(x,y) h2(:,1)+(h2(:,2)-h2(:,1)).*x+(h2(:,3)-h2(:,1)).*y;
h_minus = [];
for i=1:length(coordinates) 
    h_minus = [h_minus, g(coordinates(i,1),coordinates(i,2))];
end
lambda_min = zeros(size(m,1),1);
for it = 1:size(m,1)
    dummy = zeros(n,n);
    for i = 1:n
        for j = 1:n
            dummy(i,j) = 1/2*(h_plus(it,i)*h_minus(it,j)+h_plus(it,j)*h_minus(it,i));
        end
    end

    A = dummy.*M;
    lambda_min(it,1) = min(eig(A,M));
end
overall = [overall;min(lambda_min)];
