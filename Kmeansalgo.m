%K means Algorithm Gaussian

%Load Data
load('gaussian.mat');
%generate random centroids
Y = randn(2,2);
lowest_sum =10000000000;
i=0;
figure;
hold on
while i<100
 %assignmnet Step   
a = sum((X-Y(1,:)).*(X-Y(1,:)),2);
b = sum((X-Y(2,:)).*(X-Y(2,:)),2);
[val,assign] = min([a b],[],2);
%recalculate the centroids
cluster1idx = find(assign ==1);
Y(1,:)= mean(X(cluster1idx,:));
cluster2idx = find(assign ==2);
Y(2,:)= mean(X(cluster2idx,:));
a2 = sum((X(cluster1idx,:)-Y(1,:)).*(X(cluster1idx,:)-Y(1,:)),2); %cluster 1 indx
b2 = sum((X(cluster2idx,:)-Y(2,:)).*(X(cluster2idx,:)-Y(2,:)),2);%cluster 2 idx
sum_components_cluster1 = sum(a2);
sum_components_cluster2 = sum(b2);
current_sum = (sum_components_cluster1 + sum_components_cluster2);
scatter(i, current_sum);
%check if these this assignment has a lower total distance of points
if ((sum_components_cluster1 + sum_components_cluster2) < lowest_sum)
   lowest_sum = (sum_components_cluster1 + sum_components_cluster2);
   best_a= Y(1,:);
   best_b = Y(2,:);
   %if lowest save the cluster assignments
   assignments_cluster_1 = cluster1idx;
   assignment_cluster_2 = cluster2idx;
end
i=i+1;
end
hold off
%Plot the clusters
figure;
plot(X(assign==1,1),X(assign==1,2),'m.','MarkerSize',12)
hold on
plot(X(assign==2,1),X(assign==2,2),'b.','MarkerSize',12)
title 'Cluster Assignments'
hold off

disp(best_a);
disp(best_b);
disp(lowest_sum);


