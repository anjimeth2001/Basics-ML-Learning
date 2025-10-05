%reading data a table
data=readtable("Tennis.xlsx");
head(data)
%[code, categories] = grp2idx(data.Humidity) %for categories identify
%%

% Coding categorical variables
[outlook_coded,outlook_labels]=grp2idx(data.Outlook);
[Temperature_coded,Temperature_labels]=grp2idx(data.Temperature);
[Humidity_coded,Humidity_labels]=grp2idx(data.Humidity);
[Wind_coded,Wind_labels]=grp2idx(data.Wind);

%%
%creating the matrix of predictor variables
x=[outlook_coded Temperature_coded Humidity_coded Wind_coded];
y=data.PlayTennis;

%name the variables
vars={'Outlook','Temperature','Humidity','Wind'}

%%
%Fitting the Decision tree
tree=fitctree(x,y,'PredictorNames',vars,'CategoricalPredictors',vars);
view(tree,'mode','graph')

% Show what each number means in tree
disp(table((1:length(outlook_labels))',outlook_labels))
disp(table((1:length(Humidity_labels))',Humidity_labels))
disp(table((1:length(Temperature_labels))',Temperature_labels))
disp(table((1:length(Wind_labels))',Wind_labels))
%%
%predicting using filtered tree
y_hat=predict(tree,x);





