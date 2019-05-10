function varargout = beispiel01(varargin)
% BEISPIEL01 MATLAB code for beispiel01.fig
%      BEISPIEL01, by itself, creates a new BEISPIEL01 or raises the existing
%      singleton*.
%
%      H = BEISPIEL01 returns the handle to a new BEISPIEL01 or the handle to
%      the existing singleton*.
%
%      BEISPIEL01('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BEISPIEL01.M with the given input arguments.
%
%      BEISPIEL01('Property','Value',...) creates a new BEISPIEL01 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before beispiel01_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to beispiel01_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help beispiel01

% Last Modified by GUIDE v2.5 03-May-2019 16:48:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @beispiel01_OpeningFcn, ...
                   'gui_OutputFcn',  @beispiel01_OutputFcn, ...
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


% --- Esta función se ejecuta un momento antes de que se abra la ventana.
function beispiel01_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to beispiel01 (see VARARGIN)
% Crear los datos para las gráficas. 
% Aquí se crean los elementos de la estructura handles que manejarán las
% gráficas
handles.peaks=peaks(35); 
handles.membrane=membrane; 
[x,y] = meshgrid(-8:.5:8); 
r = sqrt(x.^2+y.^2) + eps; 
sinc = sin(r)./r; 
handles.sinc = sinc; 
% Con esto se pone el valor de los datos por default
handles.current_data = handles.peaks;
surf(handles.current_data)

% Choose default command line output for beispiel01
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes beispiel01 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = beispiel01_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Desplegar la gráfica tipo "surf" para los datos actuales
surf(handles.current_data);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Desplegar la gráfica tipo "mesh" para los datos actuales
mesh(handles.current_data);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Desplegar la gráfica tipo "contour" para los datos actuales
contour(handles.current_data);

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Con esto se obtienen los valores contenidos en el popupmenu, en
% particular el del elemento que se seleccione
str = get(hObject, 'String'); 
val = get(hObject,'Value'); 
% Ahora seleccionar que es lo que se debe hacer de acuerdo con lo
% seleccionado en el popupmenu
switch str{val}; 
    case 'peaks' 
        % los datos para graficar se modifican   
        handles.current_data = handles.peaks; 
    case 'membrane' 
        % User selects membrane.
        handles.current_data = handles.membrane; 
    case 'sinc' 
        % User selects sinc.
        handles.current_data = handles.sinc; 
end
% Salvar la estrcutura handles. 
guidata(hObject,handles)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
