%% �������
clear;
%% �����趨
focalLengthOfLens = 1;                              %͸������
distanceOfFlatToScreen = 2 * focalLengthOfLens;     %ƽ�嵽��Ļ�ľ���
refractiveIndexOfAir = 1;
refractiveIndexOfFlat = 1.5;                        %������
thicknessOfFlat =  0.020000:0.00000001:0.02000099;	%ƽ���� 
wavelength = 550 * 10^-9;                           %����
intensityOfWave = 1;                                %��ǿ
[X1,Y1] = meshgrid(-0.02 : 0.0001 : 0.02 ,-0.02 : 0.0001 : 0.02 );  %���ϵĲ�����  
MOVIE=moviein(length(thicknessOfFlat));

for i = 1:length(thicknessOfFlat)
    
    theta1 = atan( sqrt(X1 .^2 + Y1 .^2) / focalLengthOfLens);
    theta2 = asin( sin(theta1) * refractiveIndexOfAir / refractiveIndexOfFlat);
    opticalPathDifference = 2 * refractiveIndexOfFlat * thicknessOfFlat(i) *cos(theta2) + wavelength / 2;
    intensity = 4 * intensityOfWave * cos(pi * opticalPathDifference / wavelength ).^2;
    finalIntensity = intensity / (400 * intensityOfWave);    %����400ֻΪ������άͼʱ�����ÿ�

    surf(X1,Y1,finalIntensity );
    set(gcf,'position', [50 50 850 650]);
    axisValue=axis;
    axis equal;
    axis off;
    axis(axisValue);
    view(0,90);
    shading interp;
    colormap(gray);
    
    MOVIE(i)=getframe;
end

%movie(MOVIE)
movie2avi(MOVIE,'ex_movie2avi','compression','none')
