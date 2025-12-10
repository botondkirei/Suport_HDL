A = [[6 -4]; [-4 12]]
inv(A)
X = inv(A)*[0;8]
Y = inv(A)*[0;4]
plot(0,0,'s')
hold on
plot(1,0.5,'s')
plot(X(1),Y(1),'d')
plot(X(2),Y(2),'d')
plot(1,1,'s')
