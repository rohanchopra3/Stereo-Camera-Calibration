
import least.*
import ransac.*

lf = load('./linefit.mat');

figure;
scatter(lf.xs,lf.n_y1);

hold on;
[Y1, val1]= least(lf.xs,lf.n_y1);

line(lf.xs,Y1,'Color','blue','DisplayName','a)least');  
scatter(lf.xs,lf.n_y2);

[Y2, val2]= least(lf.xs,lf.n_y2);

line(lf.xs,Y2,'Color','red','DisplayName','b)least');

[final]=ransac([lf.xs',lf.n_y2']);

X3 = final(:,1);
Y3 = final(:,2);

plot(lf.xs,lf.n_y2,'*','Color','blue');

plot(X3,Y3,'*','Color','red','DisplayName','c)ransac');

[Y3, val3]= least(X3',Y3');
line(X3,Y3,'Color','green');
hold off;
legend
val1
val2
val3







