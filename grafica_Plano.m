function grafica_Plano(matriz)
%Recibe una matriz total, es decir la matriz A junto con el vector b
AA=matriz(1,:);
BB=matriz(2,:);
CC=matriz(3,:);
[x, y]=meshgrid(-10:0.1:10);

A=AA(1);
B=AA(2);
C=AA(3);
D=-1*AA(4);
z = -1/C*(A*x + B*y + D);
surf(x,y,z)
hold on

A=BB(1);
B=BB(2);
C=BB(3);
D=-1*BB(4);
z = -1/C*(A*x + B*y + D);
surf(x,y,z)
hold on

A=CC(1);
B=CC(2);
C=CC(3);
D=-1*CC(4);
z = -1/C*(A*x + B*y + D);
surf(x,y,z)

