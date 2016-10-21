%% ˫�׸��� ��P334�� 
clear;
%% �����趨
positionOfSourse = 0;                %��Դλ��
distanceOfSourseAndPoint = 0.1;      %��Դ��˫�׵ľ���
distanceOfPointAndScreen = 1;        %˫�׵���Ļ�ľ���
distanceOfTwoPoints = 0.00001;       %�����׼�ľ���
wavelength = 550 * 10^-9;            %����
intensityOfWave = 1;                 %��ǿ
[X1,Y1] = meshgrid(-5 : 0.01 : 5 ,-5 : 0.01 : 5 );     %���ϵĲ�����

%% ���㲿��

%% �۲�λ��һ�������ϣ�
distanceToPoint1 = sqrt((distanceOfTwoPoints / 2 - positionOfSourse )^2 + distanceOfSourseAndPoint ^2 ) +...
    sqrt((X1 - distanceOfTwoPoints /2).^2 + Y1 .^2 + distanceOfPointAndScreen ^2);
distanceToPoint2 = sqrt((distanceOfTwoPoints / 2 + positionOfSourse )^2 + distanceOfSourseAndPoint ^2 ) +...
    sqrt((X1 + distanceOfTwoPoints /2).^2 + Y1 .^2 + distanceOfPointAndScreen ^2);
opticalPathDifference = abs(distanceToPoint1 - distanceToPoint2 );
intensity = 4 * intensityOfWave * cos(pi * opticalPathDifference / wavelength ).^2;
finalIntensity1 = intensity ./ (4 * intensityOfWave);

%% �۲�λ�ö��������׵������ϣ�
distanceOfPointAndScreen = 1;
[X2 ,Y2] = meshgrid(-5 : 0.01 : 5 ,-5 : 0.01 : 5 );
distanceToPoint1 = sqrt((distanceOfTwoPoints / 2 - positionOfSourse )^2 + distanceOfSourseAndPoint ^2 ) + ...
    sqrt(X2 .^2 + Y2 .^2 + (distanceOfPointAndScreen - distanceOfTwoPoints / 2 ) .^2 );
distanceToPoint2 = sqrt((distanceOfTwoPoints / 2 + positionOfSourse )^2 + distanceOfSourseAndPoint ^2 ) + ...
    sqrt(X2 .^2 + Y2 .^2 + (distanceOfPointAndScreen + distanceOfTwoPoints / 2 ) .^2) ;
opticalPathDifference = abs(distanceToPoint1 - distanceToPoint2 );
intensity = 4 * intensityOfWave * cos(pi * opticalPathDifference / wavelength ).^2;
finalIntensity2 = intensity ./ (4 * intensityOfWave);

%% ��ͼ����
subplot(1,2,1)
surf(X1,Y1,finalIntensity1 );
axis equal;
view(2);
shading interp;
colormap(gray);
title('�۲�λ��һ�������ϣ�');

subplot(1,2,2)
surf(X2,Y2,finalIntensity2 );
axis equal;
view(2);
shading interp;
colormap(gray);
title('�۲�λ�ö���˫�׵������ϣ�');

clear;