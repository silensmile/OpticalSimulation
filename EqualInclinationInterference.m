%% �������
clear;
%% �����趨
focalLengthOfLens = 1;                              %͸������
distanceOfFlatToScreen = 2 * focalLengthOfLens;     %ƽ�嵽��Ļ�ľ���
refractiveIndexOfAir = 1;
refractiveIndexOfFlat = 1.5;                        %������
thicknessOfFlat = 0.01;                             %ƽ����
wavelength = 550 * 10^-9;                           %����
intensityOfWave = 1;                                %��ǿ
[X1,Y1] = meshgrid(-0.02 : 0.0002 : 0.02 ,-0.02 : 0.0002 : 0.02 );  %���ϵĲ�����

%% ���㲿��
theta1 = atan( sqrt(X1 .^2 + Y1 .^2) / focalLengthOfLens);
theta2 = asin( sin(theta1) * refractiveIndexOfAir / refractiveIndexOfFlat);
opticalPathDifference = 2 * refractiveIndexOfFlat * thicknessOfFlat *cos(theta2) + wavelength / 2;
intensity = 4 * intensityOfWave * cos(pi * opticalPathDifference / wavelength ).^2;
finalIntensity = intensity / (400 * intensityOfWave);    %����400ֻΪ������άͼʱ�����ÿ�

%% ��ͼ����
surf(X1,Y1,finalIntensity );
axis equal;
view(0,90);
shading interp;
colormap(gray);

%clear;
