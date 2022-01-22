% Matlab code for classiﬁers performance graphs and Pearson Correlation Coefﬁcient
clear, close, clc
%SVM+OSS
F1=[0.99 0.99 0.99 0.93 0.95 0.99 0.99 0.99 0.97 0.97 0.91 0.94];
MCC1=[0.99 0.98 0.98 0.86 0.90 0.98 0.99 0.98 0.95 0.95 0.82 0.88];
R1=corrcoef(F1,MCC1);
figure(1)
subplot(121)
plot(F1,'r--o','LineWidth',2)
hold on
plot(MCC1,'b-s','LineWidth',2)
%background to white 
set(gcf,'color','w')
ax = gca;
ax.FontSize = 16;
grid on
legend('macroF1','MCC')
ylim([0.6 1.1]),xlim([.6 12.5])
set(gca,'XTick',[1:12])
set(gca,'YTick',[.6:.05:1])
title('SVM+OSS Classifer Performance')
xlabel('Scenario'),ylabel('Performance')
text(5.,0.72,strcat('r = ',num2str(R1(1,2))),'FontSize',16);
disp('----------------------------------------------')
disp('SVM+OSS Classifier')
fprintf('Performance average for F1_score: %.2f\n', mean(F1));
fprintf('Performance average for MCC: %.2f\n', mean(MCC1));
disp('**********************************************')

%XGB

F2=[0.99 0.99 0.99 0.90 0.94 0.99 0.99 0.98 0.96 0.97 0.95 0.97];
MCC2=[0.99 0.99 0.98 0.82 0.89 0.99 0.99 0.97 0.94 0.94 0.90 0.94];
R2=corrcoef(F2,MCC2);
subplot(122)
plot(F2,'r--o','LineWidth',2)
hold on
plot(MCC2,'b-s','LineWidth',2)
ax = gca;
ax.FontSize = 16;
grid on
legend('macroF1','MCC')
ylim([0.6 1.1]),xlim([.6 12.5])
set(gca,'XTick',[1:12])
set(gca,'YTick',[.6:.05:1])
title('XGB Classifer Performance')
xlabel('Scenario'),ylabel('Performance')
text(5.,0.72,strcat('r = ',num2str(R2(1,2))),'FontSize',16);
disp('XGB Classifier')
fprintf('Performance average for F1_score: %.2f\n', mean(F2));
fprintf('Performance average for MCC: %.2f\n', mean(MCC2));
disp('----------------------------------------------')