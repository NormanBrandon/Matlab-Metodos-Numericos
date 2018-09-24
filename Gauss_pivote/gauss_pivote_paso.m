function gauss_pivote_paso(A,b, pwd)
fid=fopen(strcat(pwd,'/paso.txt'), 'w');
    fprintf(fid,'');
fclose(fid);

%disp('Metodo de Eliminacion Gaussiana con Pivoteo Parcial');
%A=input('Ingrese la matriz A en []: ');
%b=input('Ingrese el vector b en []: ');
Ab = [A b]; %Matriz aumentada
[m]=size(Ab);
m=m(:,1);

for c=1:m-1
p=c; %se hace la fila c como la fila donde esta el mas grande de la columna
big=abs(Ab(c,c)); %se hace el elemento de la diagonal como el mas grande de la columna
                        %fprintf('\nEtapa %g \n',c)
                        %fprintf(fid,'\nEtapa %g \n',c);
for f=c+1:m % se compara el elemento de la diag con los otros de la columna
aux=abs(Ab(f,c)); %se almacena en una variable auxiliar el valor absoluto de las demas filas

if aux>big %si auxiliar es mayor que el elemento de la diagonal entonces este es el mas grande

big=aux;
p=f; %se almacena la fila del auxiliar
end

end
if p~=c % se mira si el mayor esta en la diagonal
for h=c:m+1
aux=Ab(c,h); % se mueve toda la fila a la fila de la diagonal

Ab(c,h)=Ab(p,h);
Ab(p,h)=aux;
end
end

for f=c+1:m % se va a llevar la matriz a triang superior
if Ab(c,c)~=0
mult=Ab(f,c)/Ab(c,c);
else
%disp('No se puede continuar debido a Division por cero')
fprintf(fid,'No se puede continuar debido a Division por cero');
end
for j=c:m+1
Ab(f,j)=Ab(f,j)-mult*Ab(c,j);
end
%disp(Ab)


fid=fopen(strcat(pwd,'/paso.txt'), 'a');
[v,w]=size(Ab);
for i=1:v
    for j=1:w
        fprintf(fid,'%3.2f\t',Ab(i,j));
    end
      fprintf(fid,'\n');
end
fprintf(fid,'\n\n\n');
fclose(fid);

end
end

%fprintf('\nMatriz triangular superior:\n\n')
%disp(Ab)


fid=fopen(strcat(pwd,'/paso.txt'), 'a');
[v,w]=size(Ab);
for i=1:v
    for j=1:w
        fprintf(fid,'%3.2f\t',Ab(i,j));
    end
      fprintf(fid,'\n');
end
fprintf(fid,'\n\n\n');
fclose(fid);



%Sustitucion regresiva

for j=m:-1:1 % Un for j desde el tamaño de la matriz (m) con incremento de -1 hasta 1 (PARA UNA SUSTITUCION REGRESIVA).
sum=0; % Contador de suma

for i=j+1:1:m
sum=sum+Ab(j,i)*X(i,1);
end
if Ab(j,j)~=0 % Controla si existe una division por cero
X(j,1)=(Ab(j,m+1)-sum)/Ab(j,j); % Calcula los valores de las (x) por medio de una sustitucion regresiva (SOLUCION DEL SISTEMA)
else
disp('Division por cero')
end
end

%disp('El vector solucion x es:')
%disp(X)