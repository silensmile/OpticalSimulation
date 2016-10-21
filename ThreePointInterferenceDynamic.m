%% ���׸���
clear;

%% �����趨
positionOfSourse = 0;                %��Դλ��
distanceOfSourseAndPoint = 0.1;      %��Դ������ƽ��ľ���
distanceOfPointAndScreen = 1;        %���׵���Ļ�ľ���
radius = 0.0000001:0.000000010:0.0000025;                %���׵�ԭ��ľ���   
wavelength = 550 * 10^-9;            %����
amplitude = 1;                       %���   
intensityOfWave = 1;                 %��ǿ
[X1,Y1] = meshgrid(-5 : 0.025 : 5 ,-5 : 0.025 : 5 );     %���ϵĲ�����
MOVIE=moviein(length(radius));

%% ���㲿��
for i = 1:length(radius)
    
    point1x = radius(i) * cos(pi/2   ); 
    point1y = radius(i) * sin(pi/2   );         %��һ���׵�����
    point2x = radius(i) * cos(7*pi/6 ); 
    point2y = radius(i) * sin(7*pi/6 );         %�ڶ����׵����� 
    point3x = radius(i) * cos(11*pi/6); 
    point3y = radius(i) * sin(11*pi/6);         %�ڶ����׵����� 
    
%     point1x = radius(i) * cos(pi/2   +2*pi*i/length(radius)); 
%     point1y = radius(i) * sin(pi/2   +2*pi*i/length(radius));         %��һ���׵�����
%     point2x = radius(i) * cos(7*pi/6 +2*pi*i/length(radius)); 
%     point2y = radius(i) * sin(7*pi/6 +2*pi*i/length(radius));         %�ڶ����׵����� 
%     point3x = radius(i) * cos(11*pi/6+2*pi*i/length(radius)); 
%     point3y = radius(i) * sin(11*pi/6+2*pi*i/length(radius));         %�ڶ����׵����� 

% �������
    distanceToPoint1 = sqrt(point1x ^2 + point1y ^2 + distanceOfSourseAndPoint ^2) + ...
        sqrt((X1 - point1x ).^2 + (Y1 - point1y ).^2 + distanceOfPointAndScreen ^2);
    distanceToPoint2 = sqrt(point2x ^2 + point2y ^2 + distanceOfSourseAndPoint ^2) + ...
        sqrt((X1 - point2x ).^2 + (Y1 - point2y ).^2 + distanceOfPointAndScreen ^2);
    distanceToPoint3 = sqrt(point3x ^2 + point3y ^2 + distanceOfSourseAndPoint ^2) + ...
        sqrt((X1 - point3x ).^2 + (Y1 - point3y ).^2 + distanceOfPointAndScreen ^2);
% ������λ
    phaseDifference1 = 2 * pi * distanceToPoint1 / wavelength ;
    phaseDifference2 = 2 * pi * distanceToPoint2 / wavelength ;
    phaseDifference3 = 2 * pi * distanceToPoint3 / wavelength ;
% ���㸴���
    EIntensity = amplitude * exp(1i*phaseDifference1)+...
        amplitude * exp(1i*phaseDifference2)+...
        amplitude * exp(1i*phaseDifference3);

%% ��ͼ
    surf(X1,Y1,EIntensity .* conj(EIntensity) ./3);
    axis equal;
    view(2);
    shading interp;
    colormap(jet);

    MOVIE(i)=getframe;
end

%movie(MOVIE)
%movie2avi(MOVIE,'ThreePointInterference','compression','none')