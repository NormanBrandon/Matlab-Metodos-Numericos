
function varargout = Gauss_pivote_gui(varargin)
% GAUSS_PIVOTE_GUI MATLAB code for Gauss_pivote_gui.fig
%      GAUSS_PIVOTE_GUI, by itself, creates a new GAUSS_PIVOTE_GUI or raises the existing
%      singleton*.
%
%      H = GAUSS_PIVOTE_GUI returns the handle to a new GAUSS_PIVOTE_GUI or the handle to
%      the existing singleton*.
%
%      GAUSS_PIVOTE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAUSS_PIVOTE_GUI.M with the given input arguments.
%
%      GAUSS_PIVOTE_GUI('Property','Value',...) creates a new GAUSS_PIVOTE_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gauss_pivote_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gauss_pivote_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gauss_pivote_gui

% Last Modified by GUIDE v2.5 25-Sep-2018 10:56:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gauss_pivote_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @Gauss_pivote_gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Gauss_pivote_gui is made visible.
function Gauss_pivote_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gauss_pivote_gui (see VARARGIN)

% Choose default command line output for Gauss_pivote_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gauss_pivote_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);
x=0;
fileID = fopen('contador.txt','w');
fprintf(fileID,'%d\n',x);



% --- Outputs from this function are returned to the command line.
function varargout = Gauss_pivote_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global contador;
contador =0;

% --- Executes on button press in pushbutton_Calcular.
function pushbutton_Calcular_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Calcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A=load('matrizA.txt');
B=load('vectorB.txt');
%pwd='/Gauss_pivote';
matTot=[A,B];
[X,Ts]=gauss_pivote(A,B);
%fid=fopen('/home/armando/Documentos/metodos_Matlab/vectorX.txt', 'w');
fid=fopen(strcat(pwd,'/vectorX.txt'), 'w');
   
[f,c]=size(X);
for i=1:f
    for j=1:c
        fprintf(fid,'%f\t',X(i,j));
    end
      fprintf(fid,'\n');
end
fclose(fid);

fid=fopen(strcat(pwd,'/matrizU.txt'), 'w');
[f,c]=size(Ts);
for i=1:f
    for j=1:c
        fprintf(fid,'%3.2f\t',Ts(i,j));
    end
      fprintf(fid,'\n');
end
fclose(fid);

fid=fopen(strcat(pwd,'/sistema.txt'), 'w');
sis=[A,X,B];
[f,c]=size(sis);
for i=1:f
    for j=1:c
        fprintf(fid,'%f\t',sis(i,j));
    end
      fprintf(fid,'|\n|');
end
fclose(fid);

set(handles.edit_matrizA, 'string', num2str(A));
set(handles.edit_vectorB, 'string', num2str(B'));
set(handles.edit_vectorX, 'string', num2str(X'));
set(handles.edit_matrizU, 'string', num2str(load('matrizU.txt')));
set(handles.edit_sistema, 'string', num2str(sis));
grafica_Plano(matTot);

% --- Executes on button press in pushbutton_Regresar.
function pushbutton_Regresar_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Regresar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_Paso.
function pushbutton_Paso_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Paso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

A=load('matrizA.txt');
B=load('vectorB.txt');
%pwd='Gauss_pivote';
gauss_pivote_paso(A,B, pwd);
C = load('paso.txt');
tamano = size(A)
Mat = zeros(tamano(1),tamano(1)+1);
contador = load('contador.txt')
for n= 1:(tamano(1))
Mat(n,:) = C(n+tamano(1)*contador,:);
end
set(handles.edit_proceso, 'string', num2str(Mat));
if contador < (tamano(2))
fileID = fopen('contador.txt','w');
fprintf(fileID,'%d\n',contador + 1);
fclose(fileID);
end


function edit_matrizA_Callback(hObject, eventdata, handles)
% hObject    handle to edit_matrizA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_matrizA as text
%        str2double(get(hObject,'String')) returns contents of edit_matrizA as a double


% --- Executes during object creation, after setting all properties.
function edit_matrizA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_matrizA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_vectorB_Callback(hObject, eventdata, handles)
% hObject    handle to edit_vectorB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_vectorB as text
%        str2double(get(hObject,'String')) returns contents of edit_vectorB as a double


% --- Executes during object creation, after setting all properties.
function edit_vectorB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_vectorB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_vectorX_Callback(hObject, eventdata, handles)
% hObject    handle to edit_vectorX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_vectorX as text
%        str2double(get(hObject,'String')) returns contents of edit_vectorX as a double


% --- Executes during object creation, after setting all properties.
function edit_vectorX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_vectorX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_matrizU_Callback(hObject, eventdata, handles)
% hObject    handle to edit_matrizU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_matrizU as text
%        str2double(get(hObject,'String')) returns contents of edit_matrizU as a doubl
% --- Executes during object creation, after setting all properties.
function edit_matrizU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_matrizU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_sistema_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sistema (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sistema as text
%        str2double(get(hObject,'String')) returns contents of edit_sistema as a double


% --- Executes during object creation, after setting all properties.
function edit_sistema_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sistema (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_proceso_Callback(hObject, eventdata, handles)
% hObject    handle to edit_proceso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_proceso as text
%        str2double(get(hObject,'String')) returns contents of edit_proceso as a double


% --- Executes during object creation, after setting all properties.
function edit_proceso_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_proceso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A=load('matrizA.txt');
B=load('vectorB.txt');
%pwd='Gauss_pivote';
gauss_pivote_paso(A,B, pwd);
C = load('paso.txt');
tamano = size(A);
%divisor = tamano(1) /(tamano(2) - 1);
Mat = zeros(tamano(1),tamano(1)+1);
contador = load('contador.txt')
for n= 1:(tamano(1))
Mat(n,:) = C(n+tamano(1)*contador(1),:);
end
set(handles.edit_proceso, 'string', num2str(Mat));
if contador >= 1
fileID = fopen('contador.txt','w');
fprintf(fileID,'%d\n',contador - 1);
fclose(fileID);
end
