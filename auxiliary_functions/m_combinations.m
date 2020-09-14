function [m] = m_combinations(mu,n_h)
%m_combinations computes all possible combinations of m values for a
%specific mu (1,2,3,4) and n_h the number of hanging nodes per elements (0,1,2)

%% mu = 1
if mu == 1
  if n_h ==0 % no hanging node
    m = [0,0,0,1;0,0,1,1;0,1,0,1;0,1,1,1];
  elseif n_h == 1 || n_h == 2
    m = [];
    var = 0:1;
    for i = 1:length(var)
      for j = 1:length(var)
        for k = 1:length(var)
          %temp = [var(i),0,var(j),var(k)];
          if var(i)==0 || var(j)== 0
            var2 = 0:1;
            for l = 1:length(var2)
              m = [m; [var(i),var2(l),var(j),var(k)]];
            end
          elseif var(i)==1 && var(j)==1
            var2 = 0:2;
            for l = 1:length(var2)
              m = [m; [var(i),var2(l),var(j),var(k)]];
            end
          end
        end
      end
    end
  else
    disp('Number of hanging nodes per element node allowed.')
  end
  %% mu = 2
elseif mu == 2
  if n_h ==0 % no hanging node
    m = [0,0,0,2;0,0,2,2,;0,2,0,2;0,2,2,2;0,0,1,2;...
      0,1,0,2;0,1,1,2;0,1,2,1;0,1,2,2;0,2,1,2];
  elseif n_h == 1 || n_h == 2
    m = [];
    var = 0:2;
    for i = 1:length(var)
      for j = 1:length(var)
        for k = 1:length(var)
          if var(i)==0 || var(j)== 0
            var2 = 0:2;
            for l = 1:length(var2)
              m = [m; [var(i),var2(l),var(j),var(k)]];
            end
          elseif var(i)==2 && var(j)==2
            var2 = 0:4;
            for l = 1:length(var2)
              m = [m; [var(i),var2(l),var(j),var(k)]];
            end
          elseif (var(i)==1 && var(j)==2) || (var(i)==2 && var(j)==1)
            var2 = 0:3;
            for l = 1:length(var2)
              m = [m; [var(i),var2(l),var(j),var(k)]];
            end
          end
        end
      end
    end
    
  else
    disp('Number of hanging nodes per element node allowed.')
  end
  %% mu = 3
elseif mu == 3
  if n_h ==0 % no hanging node
    m = [0,0,0,3;0,0,3,3;0,3,0,3;0,3,3,3;0,0,2,3;0,2,0,3;...
      0,2,2,3;0,2,3,2;0,2,3,3;0,3,2,3;0,0,1,3;0,1,0,3;0,1,1,3;0,1,3,1;...
      0,1,3,3;0,3,1,3;0,1,2,3;0,2,3,1;0,2,1,3];
  elseif n_h == 1 || n_h == 2 % one or two hanging node
    m = [];
    var = 0:3;
    for i = 1:length(var)
      for j = 1:length(var)
        for k = 1:length(var)
          if var(i)==0 || var(j)== 0
            var2 = 0:3;
            for l = 1:length(var2)
              m = [m; [var(i),var2(l),var(j),var(k)]];
            end
          elseif var(i)==3 && var(j)==3
            var2 = 0:6;
            for l = 1:length(var2)
              m = [m; [var(i),var2(l),var(j),var(k)]];
            end
          elseif (var(i)==1 && var(j)==2) || (var(i)==2 && var(j)==1)
            var2 = 0:4;
            for l = 1:length(var2)
              m = [m; [var(i),var2(l),var(j),var(k)]];
            end
          elseif (var(i)==2 && var(j)==3) || (var(i)==3 && var(j)==2)
            var2 = 0:5;
            for l = 1:length(var2)
              m = [m; [var(i),var2(l),var(j),var(k)]];
            end
          end
        end
      end
    end
    
  else
    disp('Number of hanging nodes per element node allowed.')
  end
  %% mu = 4
elseif mu == 4
  if n_h ==0 % no hanging node
    m = [0,0,0,4;0,0,4,4;0,4,0,4;0,4,4,4;0,0,1,4;0,1,0,4;...
      0,1,1,4;0,1,4,1;0,1,4,4;0,4,1,4;0,0,2,4;...
      0,2,0,4;0,2,2,4;0,2,4,2;0,2,4,4;0,4,2,4;0,0,3,4;0,3,0,4;0,3,3,4;...
      0,3,4,4;0,4,3,4;0,1,2,4;0,2,1,4;0,1,4,2;0,3,2,4;0,2,3,4;0,3,4,2;...
      0,3,1,4;0,1,3,4;0,3,4,1];
  elseif n_h == 1 || n_h == 2 % one or two hanging node
    m = [];
    var = 0:4;
    for i = 1:length(var)
      for j = 1:length(var)
        for k = 1:length(var)
          if var(i)==0 || var(j)== 0
            var2 = 0:4;
            for l = 1:length(var2)
              m = [m; [var(i),var2(l),var(j),var(k)]];
            end
          elseif var(i)==4 && var(j)==4
            var2 = 0:8;
            for l = 1:length(var2)
              m = [m; [var(i),var2(l),var(j),var(k)]];
            end
          elseif (var(i)==1 && var(j)==2) || (var(i)==2 && var(j)==1)
            var2 = 0:5;
            for l = 1:length(var2)
              m = [m; [var(i),var2(l),var(j),var(k)]];
            end
          elseif (var(i)==2 && var(j)==3) || (var(i)==3 && var(j)==2)
            var2 = 0:6;
            for l = 1:length(var2)
              m = [m; [var(i),var2(l),var(j),var(k)]];
            end
          elseif (var(i)==3 && var(j)==4) || (var(i)==4 && var(j)==3)
            var2 = 0:7;
            for l = 1:length(var2)
              m = [m; [var(i),var2(l),var(j),var(k)]];
            end
          end
        end
      end
    end
  else
    disp('Number of hanging nodes per element node allowed.')
  end
else
  disp('Combinations are only computed for a mu value 1,2,3 and 4.')
end

