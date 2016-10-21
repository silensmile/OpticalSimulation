tic;
%% ����˫����� 
clear;
%% �����趨
positionOfSourse = 0;               %��Դλ��
distanceOfSourseAndSlit = 0.1;      %��Դ������ľ���
distanceOfSlitAndScreen = 1;        %���쵽��Ļ�ľ���
distanceOfTwoSlits = 0.001;         %���������ľ���
wavelength = 550 * 10^-9;           %����
intensityOfWave = 1;                %��ǿ
y = (-0.002 : 0.00001 : 0.002);    %���ϵĲ�����

%% ���㲿��
%% ��Դ���м�
distanceToSlit1 = sqrt((distanceOfTwoSlits/2 - positionOfSourse)^2 + distanceOfSourseAndSlit^2 ) +...
    sqrt((y - distanceOfTwoSlits / 2).^2 + distanceOfSlitAndScreen^2);
distanceToSlit2 = sqrt((distanceOfTwoSlits/2 + positionOfSourse)^2 + distanceOfSourseAndSlit^2 ) +...
    sqrt((y + distanceOfTwoSlits / 2).^2 + distanceOfSlitAndScreen^2);
opticalPathDifference = abs(distanceToSlit1 - distanceToSlit2);
intensity = 4 * intensityOfWave * cos(pi * opticalPathDifference / wavelength).^2;
finalIntensity1 = intensity ./ (4 * intensityOfWave);

%% ��Դ�����ƶ�delta
delta = 0.00001;
positionOfSourse = positionOfSourse + delta;
distanceToSlit1 = sqrt((distanceOfTwoSlits/2 - positionOfSourse)^2 + distanceOfSourseAndSlit^2 ) +...
    sqrt((y - distanceOfTwoSlits / 2).^2 + distanceOfSlitAndScreen^2);
distanceToSlit2 = sqrt((distanceOfTwoSlits/2 + positionOfSourse)^2 + distanceOfSourseAndSlit^2 ) +...
    sqrt((y + distanceOfTwoSlits / 2).^2 + distanceOfSlitAndScreen^2);
opticalPathDifference = abs(distanceToSlit1 - distanceToSlit2);
intensity = 4 * intensityOfWave * cos(pi * opticalPathDifference / wavelength).^2;
finalIntensity2 = intensity ./ (4 * intensityOfWave);

%% �����խdistanceOfTwoSlits = 0.0005����Դ��������λ�ã�
positionOfSourse = 0;
distanceOfTwoSlits = 0.0005;
distanceToSlit1 = sqrt((distanceOfTwoSlits/2 - positionOfSourse)^2 + distanceOfSourseAndSlit^2 ) +...
    sqrt((y - distanceOfTwoSlits / 2).^2 + distanceOfSlitAndScreen^2);
distanceToSlit2 = sqrt((distanceOfTwoSlits/2 + positionOfSourse)^2 + distanceOfSourseAndSlit^2 ) +...
    sqrt((y + distanceOfTwoSlits / 2).^2 + distanceOfSlitAndScreen^2);
opticalPathDifference = abs(distanceToSlit1 - distanceToSlit2);
intensity = 4 * intensityOfWave * cos(pi * opticalPathDifference / wavelength).^2;
finalIntensity3 = intensity ./ (4 * intensityOfWave);

%% ������С
distanceOfTwoSlits = 0.001; 
wavelength = 400 * 10^-9;
distanceToSlit1 = sqrt((distanceOfTwoSlits/2 - positionOfSourse)^2 + distanceOfSourseAndSlit^2 ) +...
    sqrt((y - distanceOfTwoSlits / 2).^2 + distanceOfSlitAndScreen^2);
distanceToSlit2 = sqrt((distanceOfTwoSlits/2 + positionOfSourse)^2 + distanceOfSourseAndSlit^2 ) +...
    sqrt((y + distanceOfTwoSlits / 2).^2 + distanceOfSlitAndScreen^2);
opticalPathDifference = abs(distanceToSlit1 - distanceToSlit2);
intensity = 4 * intensityOfWave * cos(pi * opticalPathDifference / wavelength).^2;
finalIntensity4 = intensity ./ (4 * intensityOfWave);

%% ��ͼ����
%% һά
subplot(2,2,1);
plot(y,finalIntensity1,'k');
title('��Դ����');xlabel('����λ��');ylabel('��ǿ');
hold on;
plot(y,finalIntensity2,'b');
legend('ԭʼ����','��Դ���ƺ�');

subplot(2,2,2);
plot(y,finalIntensity1,'k');
title('�����խ');xlabel('����λ��');ylabel('��ǿ');
hold on;
plot(y,finalIntensity3,'r');
legend('ԭʼ����','�����խ��');

subplot(2,2,3);
plot(y,finalIntensity1,'k');
title('������С');xlabel('����λ��');ylabel('��ǿ');
hold on;
plot(y,finalIntensity4,'g');
legend('ԭʼ����','������С��');

%% ��ά
Y = ones(length(y) , 1);
Z = Y * finalIntensity1;
subplot(2,2,4);
surf(y,y,Z);
view(2);
shading interp;
colormap(hot);
title('ԭʼ���߸��������ϵĿռ�ֲ�(�ɱ任�ӽ�)');xlabel('����x');ylabel('����y');zlabel('ǿ��');

toc;