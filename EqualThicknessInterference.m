%% �Ⱥ����
clear;
%% �����趨
distanceOfFlatToScreen = 1;                         %ƽ�嵽��Ļ�ľ���
refractiveIndexOfAir = 1;
refractiveIndexOfFlat = 1.5;                        %������
thicknessOfFlat = 0;                                %ƽ��������
angleOfFlat = 0.005 * pi / 180;                     %ƽ��б��(λ��ƽ�����)
wavelength = 550 * 10^-9;                           %����
intensityOfWave = 1;                                %��ǿ
[X1,Y1] = meshgrid(-0.02 : 0.00002 : 0.02 ,-0.02 : 0.00002 : 0.02 );  %ƽ���ϵĲ�����

%% ���㲿��
finalThicknessOfFlat = thicknessOfFlat + (X1 - X1(1,1)) .* tan(angleOfFlat);
opticalPathDifference = 2 * refractiveIndexOfFlat * finalThicknessOfFlat + wavelength / 2;
intensity = 4 * intensityOfWave * cos(pi * opticalPathDifference / wavelength ).^2 ;
finalIntensity = intensity / (400 * intensityOfWave);       %����400ֻΪ������άͼʱ�����ÿ�

%% ��ͼ����
surf(X1,Y1,finalIntensity );
axis equal;
view(-10,10);
shading interp;
colormap(jet);

% clear;
