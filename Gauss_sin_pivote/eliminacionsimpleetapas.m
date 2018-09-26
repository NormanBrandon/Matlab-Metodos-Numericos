function eliminacionsimpleetapas()
% ELIMINACION GAUSSIANA SIMPLE (SOLUCION POR ETAPAS)
clear  %permite borrar las variables almacenadas

mA = load('matriz.txt');
mb = load('vectorb.txt');
fid=fopen(strcat(pwd,'/etapas.txt'), 'w');
    fprintf(fid,'');
fclose(fid);
fid=fopen(strcat(pwd,'/sistema.txt'), 'w');
    fprintf(fid,'');
fclose(fid);
fid=fopen(strcat(pwd,'/solucion.txt'), 'w');
    fprintf(fid,'');
fclose(fid);
clc  %permite borrar el area de trabajo
format long %permite utilizar la maxima capacidad de la maquina

%fprintf('                     ELIMINACION GAUSSIANA SIMPLE (SOLUCIÓN POR ETAPAS)\n\n\n');
%fprintf me permite ingresar comentarios de manera textual que pueden
%orientar al usuario en el uso del programa

%input es un comando de solicitud de entrada de datos del usuario.
%A=input('Ingrese la matriz A = \n');
%b=input('\nIngrese el vector b, correspondite a los terminos independientes b=\n');
% Las matrices A y b deben ser ingresadas entre corchetes separando las
%columnas mediante coma ',' y las filas mediante punto y coma ';'.

%permite obtener el tamaño de la matriz A
[n,m]=size(mA);
C=[mA,mb];
% la matriz C, representa la forma de la matriz aumentada [Ab]

fprintf('\nLa Matriz C, que corresponte a la matriz aumentada [Ab] es = \n');
disp(C); % la funcion disp nos permite imprimir una variable en el espacio de trabajo
fid=fopen(strcat(pwd,'/sistema.txt'), 'a');
        [v,w]=size(C);
            for i=1:v
                for j=1:w
                 fprintf(fid,'%3.2f\t',C(i,j));
                end
             fprintf(fid,'\n');
            end
            fprintf(fid,'\n\n\n');
            fclose(fid);
            
if n==m 
    for k=1:(n-1)%instruccion iterativa que permite repetir pasos un numero
                 %determinado de veces
         fprintf('\n ETAPA %g=\n\n',k)
         fprintf('\nLa matriz correspondiente a esta etapa antes del proceso:\n')
         disp(C)
         fprintf('\nLos Multiplicadores correpondientes a esta etapa son:\n')
        for i=(k+1):n
            m(i,k)=C(i,k)/C(k,k); %formula para hallar los multiplicadores
            fprintf('\nm(%g,%g)=',i,k)
            disp(m(i,k));
            for j=k:(n+1)
                C(i,j)= C(i,j) - m(i,k)*C(k,j); %formula de la nueva fila
            end
        end
        fprintf('\nLa matriz correspondiente a esta etapa despues del proceso:\n')
         %disp(C)
       
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5      
         fid=fopen(strcat(pwd,'/etapas.txt'), 'a');
        [v,w]=size(C);
            for i=1:v
                for j=1:w
                 fprintf(fid,'%3.2f\t',C(i,j));
                end
             fprintf(fid,'\n');
            end
            fprintf(fid,'\n\n\n');
            fclose(fid);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5     
    end
    for i=n:-1:1
        suma=0;
        for p=(i+1):n
            suma = suma + C(i,p)*X(p);
        end
        X(i)=(C(i,n+1)-suma)/C(i,i);
        %formula de la susticion regresiva y solucion de las variables
    end
else %funcion asignada del if, en caso de que este sea falso
    fprintf('\nERROR: La matriz NO es cuadrada\n');
end
fprintf('\n\n\nSOLUCIÓN:\n');
fprintf('\n\nLa matriz Ab final:\n');
disp(C)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
         fid=fopen(strcat(pwd,'/etapas.txt'), 'a');
        [v,w]=size(C);
            for i=1:v
                for j=1:w
                 fprintf(fid,'%3.2f\t',C(i,j));
                end
             fprintf(fid,'\n');
            end
            fprintf(fid,'\n\n\n');
            fclose(fid);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
fprintf('\n\nLa solucion de X1 hasta Xn es:\n');
%a continuacion de utiliza una instruccion for, para mostrar el usuario, 
%los resultados de una manera mas ordena
 fid=fopen(strcat(pwd,'/solucion.txt'), 'a');
            
for i=1:n
    Xi=X(1,i);
    fprintf('\nX%g=',i)
    disp(Xi);
    fprintf(fid,'%3.2f\t',Xi);
    fprintf(fid,'\n');
            
            
end
fclose(fid);
end




