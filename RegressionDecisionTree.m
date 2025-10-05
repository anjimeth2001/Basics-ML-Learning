load carsmall.mat

%creating vector of variables
var=[MPG Horsepower Weight];

var
%drop the missing values
var_n=rmmissing(var);

%taking MPG variable as response variable
y=var_n(:,1);
x=[var_n(:,2) var_n(:,3)];

tree=fitrtree(x,y)
view(tree,'mode','graph')

%%
%Pruning
[~,~,~,bestlevel]=cvLoss(tree,'Subtrees','All','Treesize','min')

%producing the pruned tree
t2=prune(tree,'Level',bestlevel);
view(t2,'Mode','graph');
