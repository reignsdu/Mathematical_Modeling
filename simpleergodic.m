x=[1.0365	1.0699	1.1038	1.1383	1.1732	1.2087	1.2448	1.2815	1.3189	1.3568	1.3955	1.4349	1.4751	1.516	1.5577	1.6003	1.6438	1.6882	1.7337	1.7801	1.8277
];
y=[0.4973	0.5029	0.5085	0.5142	0.5198	0.5255	0.5311	0.5368	0.5426	0.5483	0.5541	0.5598	0.5657	0.5715	0.5774	0.5833	0.5892	0.5952	0.6013	0.6074	0.6135
];
%t=[14.7:0.05:15.7];
for i=1:length(x)
    a(i)=atan(x(i)/y(i))
end
mini=111;
for i=1:365
    M(i)=6.24004077+0.01720197*i;
    f(i)=(0-7.659)*sin(M(i))+9.863*sin(2*M(i)+3.5932);
end
x1=asin(0.39795*cos(0.98563*(108-173)/180*3.1415));
j=1;
for jd=105:1:116
    for wd=-90:1:90
          for i=1:1:21
               x2(i)=(14.7+0.05*(i-1)+(jd-120)*4/60+f(108)/60);
               x3(i)=(x2(i)-12)*15;
               x5(i)=asin(sin(x1)*sin(wd/180*pi)+cos(wd/180*pi)*cos(x1)*cos(x3(i)/180*pi));%太阳高度角
               x6(i)=acos((sin(x5(i))*sin(wd/180*pi)-sin(x1))/(cos(x5(i))*cos(wd/180*pi)));%方位角
                fl(i)=(x6(i)-a(i))^2;
                  if i==21
                       tot=sum(fl);  
                       if tot<mini 
                          mini=tot;
                            jdz=jd;
                            wdz=wd;
                       end
                  end
               end
          end
end
fprintf('经度为：%.2d,纬度为：%.2d\n',jdz,wdz);