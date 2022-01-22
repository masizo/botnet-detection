%%% Matlab code to generate performance graphs for all scenarios

clear;close all;clc
Y=zeros(5,4);
algorithms={'W-LR'; 'LR+SMOTE'; 'W-DT'; 'SVM+OSS'; 'XGB'};

%************
%scenario 01
%************
%a)W-LR
N=1;TN=56836;FP=1049;FN=60;TP=3606;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%b)LR+SMOTE
N=2;TN=56933;FP=952;FN=59;TP=3607;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%c)W-DT
N=3;TN=57877;FP=8;FN=24;TP=3642;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%d)SVM+OSS
N=4;TN=57874;FP=11;FN=17;TP=3849;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%e)XGB
N=5;TN=57884;FP=1;FN=5;TP=3661;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));



% Create a vertical bar chart using the bar function
figure(1)
subplot(321)
bar(1:5, Y, 1)
ax = gca;
ax.FontSize = 12;
%background to white 
set(gcf,'color','w');
% Set the axis limits
axis([0 6 0 1.05])
set(gca, 'XTickLabels', algorithms)
% Add title and axis labels
title('Classifier performance for scenario 01')
xlabel('ML algorithm')
ylabel('Performance')
% Add a legend
legend('m-Precision', 'm-Recall', 'm-F1', 'MCC', 'FontSize', 12,'Location','southwest')


%************
%scenario 02
%************
%a)W-LR
N=1;TN=47514;FP=1398;FN=115;TP=4138;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));


%b)LR+SMOTE
N=2;TN=47561;FP=1351;FN=121;TP=4132;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%c)W-DT
N=3;TN=48907;FP=5;FN=23;TP=4230;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%d)SVM+OSS
N=4;TN=48798;FP=114;FN=22;TP=4231;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%e)XGB
N=5;TN=48911;FP=1;FN=13;TP=4240;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));



% Create a vertical bar chart using the bar function
subplot(322)
bar(1:5, Y, 1)
ax = gca;
ax.FontSize = 12;
% Set the axis limits
axis([0 6 0 1.05])
set(gca, 'XTickLabels', algorithms)
% Add title and axis labels
title('Classifier performance for scenario 02')
xlabel('ML algorithm')
ylabel('Performance')
% Add a legend
legend('m-Precision', 'm-Recall', 'm-F1', 'MCC', 'FontSize', 12,'Location','southwest')


%************
%scenario 03
%************
%a)W-LR
N=1;TN=83481;FP=537;FN=8;TP=530;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));


%b)LR+SMOTE
N=2;TN=83527;FP=491;FN=8;TP=530;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%c)W-DT
N=3;TN=84013;FP=5;FN=383;TP=155;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%d)SVM+OSS
N=4;TN=84001;FP=17;FN=2;TP=536;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%e)XGB
N=5;TN=84017;FP=1;FN=17;TP=521;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));



% Create a vertical bar chart using the bar function
subplot(323)
bar(1:5, Y, 1)
ax = gca;
ax.FontSize = 12;
% Set the axis limits
axis([0 6 0 1.05])
set(gca, 'XTickLabels', algorithms)
% Add title and axis labels
title('Classifier performance for scenario 03')
xlabel('ML algorithm')
ylabel('Performance')
% Add a legend
legend('m-Precision', 'm-Recall', 'm-F1', 'MCC', 'FontSize', 12,'Location','southwest')


%************
%scenario 04
%************
%a)W-LR
N=1;TN=60441;FP=269;FN=7;TP=40;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));


%b)LR+SMOTE
N=2;TN=60548;FP=162;FN=9;TP=38;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%c)W-DT
N=3;TN=60708;FP=2;FN=5;TP=42;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%d)SVM+OSS
N=4;TN=60704;FP=6;FN=7;TP=40;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%e)XGB
N=5;TN=60709;FP=1;FN=14;TP=33;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));



% Create a vertical bar chart using the bar function
subplot(324)
bar(1:5, Y, 1)
ax = gca;
ax.FontSize = 12;
% Set the axis limits
axis([0 6 0 1.05])
set(gca, 'XTickLabels', algorithms)
% Add title and axis labels
title('Classifier performance for scenario 04')
xlabel('ML algorithm')
ylabel('Performance')
% Add a legend
legend('m-Precision', 'm-Recall', 'm-F1', 'MCC', 'FontSize', 12,'Location','southwest')


%************
%scenario 05
%************
%a)W-LR
N=1;TN=46099;FP=344;FN=16;TP=151;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));


%b)LR+SMOTE
N=2;TN=46156;FP=287;FN=14;TP=153;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%c)W-DT
N=3;TN=46437;FP=6;FN=139;TP=28;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%d)SVM+OSS
N=4;TN=46431;FP=12;FN=20;TP=147;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%e)XGB
N=5;TN=46442;FP=1;FN=31;TP=136;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));



% Create a vertical bar chart using the bar function
subplot(325)
bar(1:5, Y, 1)
ax = gca;
ax.FontSize = 12;
% Set the axis limits
axis([0 6 0 1.05])
set(gca, 'XTickLabels', algorithms)
% Add title and axis labels
title('Classifier performance for scenario 05')
xlabel('ML algorithm')
ylabel('Performance')
% Add a legend
legend('m-Precision', 'm-Recall', 'm-F1', 'MCC', 'FontSize', 12,'Location','southwest')



%************
%scenario 06
%************
%a)W-LR
N=1;TN=76288;FP=280;FN=7;TP=903;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));


%b)LR+SMOTE
N=2;TN=76305;FP=279;FN=6;TP=904;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%c)W-DT
N=3;TN=76566;FP=2;FN=139;TP=771;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%d)SVM+OSS
N=4;TN=76548;FP=20;FN=3;TP=907;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%e)XGB
N=5;TN=76567;FP=1;FN=3;TP=907;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));



% Create a vertical bar chart using the bar function
subplot(326)
bar(1:5, Y, 1)
ax = gca;
ax.FontSize = 12;
% Set the axis limits
axis([0 6 0 1.05])
set(gca, 'XTickLabels', algorithms)
% Add title and axis labels
title('Classifier performance for scenario 06')
xlabel('ML algorithm')
ylabel('Performance')
% Add a legend
legend('m-Precision', 'm-Recall', 'm-F1', 'MCC', 'FontSize', 12,'Location','southwest')


%************
%scenario 07
%************
%a)W-LR
N=1;TN=63082;FP=1036;FN=107;TP=3001;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));


%b)LR+SMOTE
N=2;TN=63188;FP=930;FN=91;TP=3017;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%c)W-DT
N=3;TN=64023;FP=95;FN=65;TP=3043;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%d)SVM+OSS
N=4;TN=64091;FP=27;FN=22;TP=3086;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%e)XGB
N=5;TN=64117;FP=1;FN=18;TP=3090;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));



% Create a vertical bar chart using the bar function
figure(2)
subplot(321)
bar(1:5, Y, 1)
ax = gca;
ax.FontSize = 12;
%background to white 
set(gcf,'color','w');
% Set the axis limits
axis([0 6 0 1.05])
set(gca, 'XTickLabels', algorithms)
% Add title and axis labels
title('Classifier performance for scenario 07')
xlabel('ML algorithm')
ylabel('Performance')
% Add a legend
legend('m-Precision', 'm-Recall', 'm-F1', 'MCC', 'FontSize', 12,'Location','southwest')


%************
%scenario 08
%************
%a)W-LR
N=1;TN=67485;FP=376;FN=17;TP=674;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));


%b)LR+SMOTE
N=2;TN=67562;FP=299;FN=14;TP=677;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%c)W-DT
N=3;TN=67858;FP=3;FN=319;TP=372;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%d)SVM+OSS
N=4;TN=67857;FP=4;FN=14;TP=677;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%e)XGB
N=5;TN=67861;FP=0;FN=30;TP=661;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));



% Create a vertical bar chart using the bar function
subplot(322)
bar(1:5, Y, 1)
ax = gca;
ax.FontSize = 12;
% Set the axis limits
axis([0 6 0 1.05])
set(gca, 'XTickLabels', algorithms)
% Add title and axis labels
title('Classifier performance for scenario 08')
xlabel('ML algorithm')
ylabel('Performance')
% Add a legend
legend('m-Precision', 'm-Recall', 'm-F1', 'MCC', 'FontSize', 12,'Location','southwest')


%************
%scenario 09
%************
%a)W-LR
N=1;TN=68967;FP=1530;FN=191;TP=487;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));


%b)LR+SMOTE
N=2;TN=69427;FP=1070;FN=116;TP=562;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%c)W-DT
N=3;TN=70490;FP=7;FN=324;TP=354;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%d)SVM+OSS
N=4;TN=70457;FP=40;FN=22;TP=656;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%e)XGB
N=5;TN=70497;FP=0;FN=78;TP=600;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));



% Create a vertical bar chart using the bar function
subplot(323)
bar(1:5, Y, 1)
ax = gca;
ax.FontSize = 12;
% Set the axis limits
axis([0 6 0 1.05])
set(gca, 'XTickLabels', algorithms)
% Add title and axis labels
title('Classifier performance for scenario 09')
xlabel('ML algorithm')
ylabel('Performance')
% Add a legend
legend('m-Precision', 'm-Recall', 'm-F1', 'MCC', 'FontSize', 12,'Location','southwest')


%************
%scenario 10
%************
%a)W-LR
N=1;TN=85813;FP=315;FN=3;TP=884;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));


%b)LR+SMOTE
N=2;TN=85859;FP=269;FN=3;TP=884;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%c)W-DT
N=3;TN=86126;FP=2;FN=275;TP=612;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%d)SVM+OSS
N=4;TN=86114;FP=14;FN=68;TP=819;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%e)XGB
N=5;TN=86127;FP=1;FN=95;TP=792;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));



% Create a vertical bar chart using the bar function
subplot(324)
bar(1:5, Y, 1)
ax = gca;
ax.FontSize = 12;
% Set the axis limits
axis([0 6 0 1.05])
set(gca, 'XTickLabels', algorithms)
% Add title and axis labels
title('Classifier performance for scenario 10')
xlabel('ML algorithm')
ylabel('Performance')
% Add a legend
legend('m-Precision', 'm-Recall', 'm-F1', 'MCC', 'FontSize', 12,'Location','southwest')


%************
%scenario 11
%************
%a)W-LR
N=1;TN=110238;FP=392;FN=13;TP=43;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));


%b)LR+SMOTE
N=2;TN=110364;FP=266;FN=13;TP=43;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%c)W-DT
N=3;TN=110627;FP=3;FN=47;TP=9;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%d)SVM+OSS
N=4;TN=110625;FP=5;FN=13;TP=43;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%e)XGB
N=5;TN=110630;FP=0;FN=10;TP=46;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));



% Create a vertical bar chart using the bar function
subplot(325)
bar(1:5, Y, 1)
ax = gca;
ax.FontSize = 12;
% Set the axis limits
axis([0 6 0 1.05])
set(gca, 'XTickLabels', algorithms)
% Add title and axis labels
title('Classifier performance for scenario 11')
xlabel('ML algorithm')
ylabel('Performance')
% Add a legend
legend('m-Precision', 'm-Recall', 'm-F1', 'MCC', 'FontSize', 12,'Location','southwest')



%************
%scenario 12
%************
%a)W-LR
N=1;TN=41182;FP=131;FN=9;TP=110;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));


%b)LR+SMOTE
N=2;TN=41195;FP=118;FN=10;TP=109;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%c)W-DT
N=3;TN=41310;FP=3;FN=8;TP=111;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%d)SVM+OSS
N=4;TN=41303;FP=10;FN=16;TP=103;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%e)XGB
N=5;TN=41313;FP=0;FN=12;TP=107;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));



% Create a vertical bar chart using the bar function
subplot(326)
bar(1:5, Y, 1)
ax = gca;
ax.FontSize = 12;
% Set the axis limits
axis([0 6 0 1.05])
set(gca, 'XTickLabels', algorithms)
% Add title and axis labels
title('Classifier performance for scenario 12')
xlabel('ML algorithm')
ylabel('Performance')
% Add a legend
legend('m-Precision', 'm-Recall', 'm-F1', 'MCC', 'FontSize', 12,'Location','southwest')

