%%% Matlab code to generate performance graphs for all scenarios

clear all;close all;clc
Y=zeros(5,4);
algorithms={'W-LR'; 'LR+SMOTE'; 'W-DT'; 'SVM+OSS'; 'XGB'};

%************
%escenario 01
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
N=2;TN=56916;FP=969;FN=60;TP=3606;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%c)W-DT
N=3;TN=57877;FP=8;FN=18;TP=3648;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%d)SVM+OSS
N=4;TN=57871;FP=14;FN=17;TP=3649;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%e)XGB
N=5;TN=57882;FP=3;FN=21;TP=3645;
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
%escenario 02
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
N=2;TN=47564;FP=1348;FN=118;TP=4135;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%c)W-DT
N=3;TN=48902;FP=10;FN=22;TP=4231;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%d)SVM+OSS
N=4;TN=48768;FP=144;FN=24;TP=4229;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%e)XGB
N=5;TN=48909;FP=3;FN=23;TP=4230;
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
%escenario 03
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
N=2;TN=83524;FP=494;FN=8;TP=530;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%c)W-DT
N=3;TN=84011;FP=7;FN=383;TP=155;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%d)SVM+OSS
N=4;TN=83999;FP=19;FN=2;TP=536;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%e)XGB
N=5;TN=84017;FP=1;FN=384;TP=154;
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
%escenario 04
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
N=3;TN=60707;FP=3;FN=5;TP=42;
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
N=5;TN=60707;FP=3;FN=34;TP=13;
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
%escenario 05
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
N=2;TN=46155;FP=288;FN=14;TP=153;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%c)W-DT
N=3;TN=46442;FP=1;FN=143;TP=24;
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
N=5;TN=46443;FP=0;FN=131;TP=36;
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
%escenario 06
%************
%a)W-LR
N=1;TN=76319;FP=249;FN=7;TP=903;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));


%b)LR+SMOTE
N=2;TN=76305;FP=263;FN=7;TP=903;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%c)W-DT
N=3;TN=76567;FP=1;FN=139;TP=771;
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
N=5;TN=76568;FP=0;FN=295;TP=615;
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
%escenario 07
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
N=2;TN=56916;FP=969;FN=60;TP=3606;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%c)W-DT
N=3;TN=57877;FP=8;FN=18;TP=3648;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%d)SVM+OSS
N=4;TN=57871;FP=14;FN=17;TP=3649;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%e)XGB
N=5;TN=57882;FP=3;FN=21;TP=3645;
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
%escenario 08
%************
%a)W-LR
N=1;TN=67538;FP=323;FN=14;TP=677;
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
N=3;TN=67858;FP=3;FN=331;TP=360;
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
N=5;TN=67861;FP=0;FN=13;TP=678;
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
%escenario 09
%************
%a)W-LR
N=1;TN=69214;FP=1283;FN=142;TP=536;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));


%b)LR+SMOTE
N=2;TN=69439;FP=1058;FN=116;TP=562;
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
N=4;TN=70448;FP=49;FN=18;TP=660;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%e)XGB
N=5;TN=70496;FP=1;FN=321;TP=357;
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
%escenario 10
%************
%a)W-LR
N=1;TN=85898;FP=230;FN=7;TP=880;
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
N=3;TN=86128;FP=0;FN=127;TP=760;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%d)SVM+OSS
N=4;TN=86108;FP=20;FN=69;TP=818;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%e)XGB
N=5;TN=86125;FP=3;FN=136;TP=751;
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
%escenario 11
%************
%a)W-LR
N=1;TN=110287;FP=343;FN=13;TP=43;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));


%b)LR+SMOTE
N=2;TN=110370;FP=260;FN=13;TP=43;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%c)W-DT
N=3;TN=110629;FP=1;FN=47;TP=9;
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
N=5;TN=110630;FP=0;FN=50;TP=6;
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
%escenario 12
%************
%a)W-LR
N=1;TN=41182;FP=131;FN=10;TP=109;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));


%b)LR+SMOTE
N=2;TN=41196;FP=117;FN=10;TP=109;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%c)W-DT
N=3;TN=41307;FP=6;FN=24;TP=95;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%d)SVM+OSS
N=4;TN=41302;FP=11;FN=13;TP=106;
%Macro-Precision
Y(N,1)=1/2*((TN/(TN+FN))+(TP/(TP+FP)));
%Macro-Recall
Y(N,2)=1/2*((TN/(TN+FP))+(TP/(TP+FN)));
%Macro-F1
Y(N,3)=1/2*((2*TN/(2*TN+FN+FP))+(2*TP/(2*TP+FP+FN)));
%MCC
Y(N,4)=(TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));

%e)XGB
N=5;TN=41312;FP=1;FN=12;TP=107;
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

