function varargout = gauss_sin_pivote(varargin)
% GAUSS_SIN_PIVOTE MATLAB code for gauss_sin_pivote.fig
%      GAUSS_SIN_PIVOTE, by itself, creates a new GAUSS_SIN_PIVOTE or raises the existing
%      singleton*.
%
%      H = GAUSS_SIN_PIVOTE returns the handle to a new GAUSS_SIN_PIVOTE or the handle to
%      the existing singleton*.
%
%      GAUSS_SIN_PIVOTE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAUSS_SIN_PIVOTE.M with the given input arguments.
%
%      GAUSS_SIN_PIVOTE('Property','Value',...) creates a new GAUSS_SIN_PIVOTE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gauss_sin_pivote_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gauss_sin_pivote_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gauss_sin_pivote

% Last Modified by GUIDE v2.5 25-Sep-2018 22:26:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gauss_sin_pivote_OpeningFcn, ...
                   'gui_OutputFcn',  @gauss_sin_pivote_OutputFcn, ...
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


% --- Executes just before gauss_sin_pivote is made visible.
function gauss_sin_pivote_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gauss_sin_pivote (see VARARGIN)

% Choose default command line output for gauss_sin_pivote
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gauss_sin_pivote wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gauss_sin_pivote_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to solucion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of solucion as text
%        str2double(get(hObject,'String')) returns contents of solucion as a double


% --- Executes during object creation, after setting all properties.
function solucion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to solucion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over edit_sistema.
function edit_sistema_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to edit_sistema (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in siguiente.
function siguiente_Callback(hObject, eventdata, handles)
% hObject    handle to siguiente (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

A=load('matriz.txt');
C = load('etapas.txt');
tamano = size(A)
Mat = zeros(tamano(1),tamano(1)+1);
contador = load('contador.txt')
for n= 1:(tamano(1))
Mat(n,:) = C(n+tamano(1)*contador,:);
end
set(handles.solucion, 'string', num2str(Mat));
if contador < (tamano(2) -1)
fileID = fopen('contador.txt','w');
fprintf(fileID,'%d\n',contador + 1);
fclose(fileID);
end

% --- Executes on button press in anterior.
function anterior_Callback(hObject, eventdata, handles)
% hObject    handle to anterior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A=load('matriz.txt');
C = load('etapas.txt');
tamano = size(A)
Mat = zeros(tamano(1),tamano(1)+1);
contador = load('contador.txt')
for n= 1:(tamano(1))
Mat(n,:) = C(n+tamano(1)*contador,:);
end
set(handles.solucion, 'string', num2str(Mat));
if contador > 0
fileID = fopen('contador.txt','w');
fprintf(fileID,'%d\n',contador - 1);
fclose(fileID);
end

% --- Executes on button press in Empezar.
function Empezar_Callback(hObject, eventdata, handles)
% hObject    handle to Empezar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
eliminacionsimpleetapas;
A = load('sistema.txt');
set(handles.edit_sistema, 'string', num2str(A));
B = load('solucion.txt');
set(handles.edit3, 'string', num2str(B));




function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
