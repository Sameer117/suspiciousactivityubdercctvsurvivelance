function varargout = Control_panel(varargin)
% CONTROL_PANEL MATLAB code for Control_panel.fig
%      CONTROL_PANEL, by itself, creates a new CONTROL_PANEL or raises the existing
%      singleton*.
%
%      H = CONTROL_PANEL returns the handle to a new CONTROL_PANEL or the handle to
%      the existing singleton*.
%
%      CONTROL_PANEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONTROL_PANEL.M with the given input arguments.
%
%      CONTROL_PANEL('Property','Value',...) creates a new CONTROL_PANEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Control_panel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Control_panel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Control_panel

% Last Modified by GUIDE v2.5 07-Mar-2020 05:54:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Control_panel_OpeningFcn, ...
                   'gui_OutputFcn',  @Control_panel_OutputFcn, ...
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


% --- Executes just before Control_panel is made visible.
function Control_panel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Control_panel (see VARARGIN)

% Choose default command line output for Control_panel
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Control_panel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Control_panel_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count;
set(handles.edit4,'String','**');
set(handles.edit5,'String','**');
set(handles.edit6,'String','**');
axes(handles.axes2); axis off




pause(5);
if(count==1)
set(handles.edit4,'String','Mobile Theft');
set(handles.edit5,'String','Connect mongodb...');
pause(2);
set(handles.edit5,'String','Checking Internet...');
% t = tcpclient('www.cloud.mongodb.com', 80);
% set(handles.edit5,'String','uploaded...');
%     axes(handles.axes2);imshow(imread('1.jpg'));
%     set(handles.edit6,'String','Raja');
%     g = serial('COM1');
% fopen(g);
% fprintf(g,'Mobile theft');
% pause(3);
% fclose(g);


elseif(count ==2)
 set(handles.edit4,'String','Amount Issue');
set(handles.edit5,'String','Connect mongodb...');
pause(2);
set(handles.edit5,'String','Checking Internet...');
% t = tcpclient('www.cloud.mongodb.com', 80);
% set(handles.edit5,'String','uploaded...');
% axes(handles.axes2);imshow(imread('2.jpg'));
%     set(handles.edit6,'String','Muthu');
%     g = serial('COM1');
% fopen(g);
% fprintf(g,'Amount issues');
% pause(3);
% fclose(g);
    
elseif(count==3)
set(handles.edit4,'String','Killing');
set(handles.edit5,'String','Connect mongodb...');
pause(2);
set(handles.edit5,'String','Checking Internet...');
t = tcpclient('www.cloud.mongodb.com', 80);
set(handles.edit5,'String','uploaded...');
axes(handles.axes2); axis off
%  g = serial('COM1');
% fopen(g);
% fprintf(g,'Killing');
% pause(3);
% fclose(g);

else
set(handles.edit4,'String','**');
set(handles.edit5,'String','**');
set(handles.edit6,'String','**');
axes(handles.axes2); axis off    
end



% Get default command line output from handles structure
varargout{1} = handles.output;



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
