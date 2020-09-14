clear all; close all;
%%-------------------------------
%change folder and number of hanging nodes n_h
n_h = 0; % 0,1,2
load('mass_matrices/quad/Bi1/mass_matrix.mat'); % Bi1, Bi2, Bi3,... Bi10
%%----------------------------------

addpath('auxiliary_functions')
A = mat;
n = size(mat,1); dim = sqrt(n);

coordinates = zeros(n,2); % degrees of freedom in unit square [0,1]^2
for i=1:dim
  for j=1:dim
    coordinates((i - 1)*dim + j, 1) = (j - 1)/(dim - 1);
    coordinates((i - 1)*dim + j, 2) = (i - 1)/(dim - 1);
  end
end
I = trafo_matrix(n,n_h);
M = I'*A*I; % Update mass matrix

overall = [];
mu = 1:4;
for k = 1: length(mu)
  
  m = m_combinations(mu(k),n_h); 
  % generate h_plus and h_minus
  [h_plus,h_minus] = assign_h(m,n_h,coordinates);
  % set up eigenvalue problem
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

minval = min(lambda_min)

end