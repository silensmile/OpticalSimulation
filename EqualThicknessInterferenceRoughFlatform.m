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
[X1,Y1] = meshgrid(-0.02 : 0.0001 : 0.02 ,-0.02 : 0.0001 : 0.02 );  %ƽ���ϵĲ�����
[X2,Y2] = meshgrid(-0.02 : 0.0001 : 0.02 ,-0.02 : 0.0001 : 0.02 );  %ͻ��㷶Χ
radius = 0.005;         %ͻ�����İ뾶
Z2 = sqrt(radius^2 - X2 .^2 - Y2 .^2 );
Z2 = Z2/50000;          %�������
for i=1:length(X2)
    for j=1:length(X2)
        if X2(i,j)^2+Y2(i,j)^2 > radius^2
            X2(i,j)=0;Y2(i,j)=0;Z2(i,j)=0;
        end
    end
end
%% ���㲿��
finalThicknessOfFlat = thicknessOfFlat + (X1 - X1(1,1)) .* tan(angleOfFlat) - Z2;   %ͻ��
opticalPathDifference = 2 * refractiveIndexOfFlat * finalThicknessOfFlat + wavelength / 2;
intensity = 4 * intensityOfWave * cos(pi * opticalPathDifference / wavelength ).^2 ;
finalIntensity1 = intensity / (800*  intensityOfWave);       %����800ֻΪ������άͼʱ�����ÿ�
finalThicknessOfFlat = thicknessOfFlat + (X1 - X1(1,1)) .* tan(angleOfFlat) + Z2;   %����
opticalPathDifference = 2 * refractiveIndexOfFlat * finalThicknessOfFlat + wavelength / 2;
intensity = 4 * intensityOfWave * cos(pi * opticalPathDifference / wavelength ).^2 ;
finalIntensity2 = intensity / (800*  intensityOfWave);
%% ��ͼ����
subplot(1,2,1);
surf(X1,Y1,finalIntensity1 );
title('������״ͻ��');
axis equal;
view(0,90);
shading interp;
colormap(gray);

subplot(1,2,2);
surf(X1,Y1,finalIntensity2 );
title('������״����');
shading interp;
axis equal;
view(0,90);

