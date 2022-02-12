%Cases and deaths per capita data
%PCA and Clustering on Demographic data
load('percapitanopop.mat');
%Subtract mean from each demographic feature
M = mean(X);
i=1;
j=1;
 while i < 18
  while j < 3140
  X(j,i)= X(j,i)/M(i);
  j= j+1;
  end
    i=i+1;
 end
%  PCA on Data, get first two principle components
X1=X(:,3:16);
coeff = pca(X1);
V = coeff(:,1:2);
proj = X1 * V;
%Find percent variance of priciple components
[V1,D, L] = pca(X);
var1= L(1) / sum(L)
var2= L(2) / sum(L)

 %Kmeans on the projection
idx = kmeans(proj,5);
cluster_1 = find(idx==1);
cluster_2 = find(idx==2);
cluster_3 = find(idx==3);
cluster_4 = find(idx==4);
cluster_5 = find(idx==5);
whos cluster_1
whos cluster_2
whos cluster_3
whos cluster_4
whos cluster_5

%Find mean deaths, cases, and some demographics for each cluster

Mean_Cases_1= mean(X(cluster_1,1))
Mean_Deaths_1= mean(X(cluster_1,2))
Mean_BlackPop_1= mean(X(cluster_1,5))
Mean_HispanicPop_1= mean(X(cluster_1,3))
Mean_Incomepercap_1= mean(X(cluster_1,8))
Mean_Cases_2= mean(X(cluster_2,1))
Mean_Deaths_2= mean(X(cluster_2,2))
Mean_BlackPop_2= mean(X(cluster_2,5))
Mean_HispanicPop_2= mean(X(cluster_2,3))
Mean_Incomepercap_2= mean(X(cluster_2,8))
Mean_Cases_3= mean(X(cluster_3,1))
Mean_Deaths_3= mean(X(cluster_3,2))
Mean_BlackPop_3= mean(X(cluster_3,5))
Mean_HispanicPop_3= mean(X(cluster_3,3))
Mean_Incomepercap_3= mean(X(cluster_3,8))
Mean_Cases_4= mean(X(cluster_4,1))
Mean_Deaths_4= mean(X(cluster_4,2))
Mean_BlackPop_4= mean(X(cluster_4,5))
Mean_HispanicPop_4= mean(X(cluster_4,3))
Mean_Incomepercap_4= mean(X(cluster_4,8))
Mean_Cases_5= mean(X(cluster_5,1))
Mean_Deaths_5= mean(X(cluster_5,2))
Mean_BlackPop_5= mean(X(cluster_5,5))
Mean_HispanicPop_5= mean(X(cluster_5,3))
Mean_Incomepercap_5= mean(X(cluster_5,8))
% Plot figures 
 figure;
 plot(proj(idx==1,1),proj(idx==1,2),'b.','MarkerSize',12)
 hold on
 plot(proj(idx==2,1),proj(idx==2,2),'r.','MarkerSize',12)
 hold on
 plot(proj(idx==3,1),proj(idx==3,2),'y.','MarkerSize',12)
 hold on
 plot(proj(idx==4,1),proj(idx==4,2),'m.','MarkerSize',12)
  hold on
 plot(proj(idx==5,1),proj(idx==5,2),'g.','MarkerSize',12)
 legend('Cluster 1','Cluster 2',...
        'Location','NW')
  title 'Clustering with PCA'
 hold off
%  
%  figure;
%  plot(X(idx==1,2),X(idx==1,1),'b.','MarkerSize',12)
%  hold on
%  plot(X(idx==2,2),X(idx==2,1),'r.','MarkerSize',12)
%   hold on
%   plot(X(idx==3,2),X(idx==3,1),'y.','MarkerSize',12)
%   hold on
%   plot(X(idx==4,2),X(idx==4,1),'m.','MarkerSize',12)
%   hold on
%   plot(X(idx==5,2),X(idx==5,1),'g.','MarkerSize',12)
%  legend('Cluster 1','Cluster 2',...
%         'Location','NW')
%   title 'Cases v. deaths'
%  hold off
%  
%   figure;
%  plot(X(idx==1,3),X(idx==1,1),'b.','MarkerSize',12)
%  hold on
%  plot(X(idx==2,3),X(idx==2,1),'r.','MarkerSize',12)
%  hold on
%  plot(X(idx==3,3),X(idx==3,1),'y.','MarkerSize',12)
%  hold on
%  plot(X(idx==4,3),X(idx==4,1),'m.','MarkerSize',12)
%   hold on
%  plot(X(idx==5,3),X(idx==5,1),'g.','MarkerSize',12)
%  legend('Cluster 1','Cluster 2',...
%         'Location','NW')
%   title 'Cases v. Hispanic'
%  hold off
%  
%    figure;
%  plot(X(idx==1,4),X(idx==1,1),'b.','MarkerSize',12)
%  hold on
%  plot(X(idx==2,4),X(idx==2,1),'r.','MarkerSize',12)
%  hold on
%  plot(X(idx==3,4),X(idx==3,1),'y.','MarkerSize',12)
%  hold on
%  plot(X(idx==4,4),X(idx==4,1),'m.','MarkerSize',12)
%  hold on
% plot(X(idx==5,4),X(idx==5,1),'g.','MarkerSize',12)
%  legend('Cluster 1','Cluster 2',...
%         'Location','NW')
%   title 'Cases v. White'
%  hold off
%  
%   
%    figure;
%  plot(X(idx==1,5),X(idx==1,1),'b.','MarkerSize',12)
%  hold on
%  plot(X(idx==2,5),X(idx==2,1),'r.','MarkerSize',12)
%  hold on
%  plot(X(idx==3,5),X(idx==3,1),'y.','MarkerSize',12)
%  hold on
%  plot(X(idx==4,5),X(idx==4,1),'m.','MarkerSize',12)
%  hold on
% plot(X(idx==5,5),X(idx==5,1),'g.','MarkerSize',12)
%  legend('Cluster 1','Cluster 2',...
%         'Location','NW')
%   title 'Cases v. Black'
%  hold off
%    figure;
%  plot(X(idx==1,8),X(idx==1,1),'b.','MarkerSize',12)
%  hold on
%  plot(X(idx==2,8),X(idx==2,1),'r.','MarkerSize',12)
%  hold on
%  plot(X(idx==3,8),X(idx==3,1),'y.','MarkerSize',12)
%  hold on
%  plot(X(idx==4,8),X(idx==4,1),'m.','MarkerSize',12)
%   hold on
% plot(X(idx==5,8),X(idx==5,1),'g.','MarkerSize',12)
%  legend('Cluster 1','Cluster 2',...
%         'Location','NW')
%   title 'Cases v. Income per capita'
%  hold off
%  
%  
%  
%   figure;
%  plot(proj(idx==1,1),proj(idx==1,2),'b.','MarkerSize',12)
%  hold on
%  plot(proj(idx==2,1),proj(idx==2,2),'r.','MarkerSize',12)
%  hold on
%  plot(proj(idx==3,1),proj(idx==3,2),'y.','MarkerSize',12)
%  hold on
%  plot(proj(idx==4,1),proj(idx==4,2),'m.','MarkerSize',12)
%   hold on
%  %plot(proj(idx==5,1),proj(idx==5,2),'g.','MarkerSize',12)
%  legend('Cluster 1','Cluster 2',...
%         'Location','NW')
%   title 'PCA with clustering'
%  hold off
%  
%  
%   figure;
%  plot(X(idx==1,3),X(idx==1,2),'b.','MarkerSize',12)
%  hold on
%  plot(X(idx==2,3),X(idx==2,2),'r.','MarkerSize',12)
%  hold on
%  plot(X(idx==3,3),X(idx==3,2),'y.','MarkerSize',12)
%  hold on
%  plot(X(idx==4,3),X(idx==4,2),'m.','MarkerSize',12)
%   hold on
%  plot(X(idx==5,3),X(idx==5,2),'g.','MarkerSize',12)
%  legend('Cluster 1','Cluster 2',...
%         'Location','NW')
%   title 'Deaths v. Hispanic'
%  hold off
%  
%    figure;
%  plot(X(idx==1,4),X(idx==1,2),'b.','MarkerSize',12)
%  hold on
%  plot(X(idx==2,4),X(idx==2,2),'r.','MarkerSize',12)
%  hold on
%  plot(X(idx==3,4),X(idx==3,2),'y.','MarkerSize',12)
%  hold on
%  plot(X(idx==4,4),X(idx==4,2),'m.','MarkerSize',12)
%  hold on
% plot(X(idx==5,4),X(idx==5,2),'g.','MarkerSize',12)
%  legend('Cluster 1','Cluster 2',...
%         'Location','NW')
%   title 'Deaths v. White'
%  hold off
%  
%   
%    figure;
%  plot(X(idx==1,5),X(idx==1,2),'b.','MarkerSize',12)
%  hold on
%  plot(X(idx==2,5),X(idx==2,2),'r.','MarkerSize',12)
%  hold on
%  plot(X(idx==3,5),X(idx==3,2),'y.','MarkerSize',12)
%  hold on
%  plot(X(idx==4,5),X(idx==4,2),'m.','MarkerSize',12)
%  hold on
% plot(X(idx==5,5),X(idx==5,2),'g.','MarkerSize',12)
%  legend('Cluster 1','Cluster 2',...
%         'Location','NW')
%   title 'Deaths v. Black'
%  hold off
%    figure;
%  plot(X(idx==1,8),X(idx==1,2),'b.','MarkerSize',12)
%  hold on
%  plot(X(idx==2,8),X(idx==2,2),'r.','MarkerSize',12)
%  hold on
%  plot(X(idx==3,8),X(idx==3,2),'y.','MarkerSize',12)
%  hold on
%  plot(X(idx==4,8),X(idx==4,2),'m.','MarkerSize',12)
%   hold on
% plot(X(idx==5,8),X(idx==5,2),'g.','MarkerSize',12)
%  legend('Cluster 1','Cluster 2',...
%         'Location','NW')
%   title 'Deaths v. Income per capita'
%  hold off