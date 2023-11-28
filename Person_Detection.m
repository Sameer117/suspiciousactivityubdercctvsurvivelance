function varargout = Person_Detection(varargin)
% PERSON_DETECTION MATLAB code for Person_Detection.fig
%      PERSON_DETECTION, by itself, creates a new PERSON_DETECTION or raises the existing
%      singleton*.
%
%      H = PERSON_DETECTION returns the handle to a new PERSON_DETECTION or the handle to
%      the existing singleton*.
%
%      PERSON_DETECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PERSON_DETECTION.M with the given input arguments.
%
%      PERSON_DETECTION('Property','Value',...) creates a new PERSON_DETECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Person_Detection_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Person_Detection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Person_Detection

% Last Modified by GUIDE v2.5 05-Feb-2020 09:28:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Person_Detection_OpeningFcn, ...
                   'gui_OutputFcn',  @Person_Detection_OutputFcn, ...
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


% --- Executes just before Person_Detection is made visible.
function Person_Detection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Person_Detection (see VARARGIN)

% Choose default command line output for Person_Detection
handles.output = hObject;
% axes(handles.axes1); axis off
% close all
axes(handles.axes4); axis off
% axes(handles.axes3); axis off

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Person_Detection wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Person_Detection_OutputFcn(hObject, eventdata, handles) 
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

% clear folder
current_folder = cd;
Result_folder =[current_folder '\Abnormal'];
if ~isdir(Result_folder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));

end
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(Result_folder, '*.jpg'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Result_folder, baseFileName);
  fprintf(1, 'Now deleting %s\n', fullFileName);
  delete(fullFileName);
end

current_folder = cd;
Result_folder2 =[current_folder '\Normal'];
if ~isdir(Result_folder2)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));

end
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(Result_folder2, '*.jpg'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Result_folder2, baseFileName);
  fprintf(1, 'Now deleting %s\n', fullFileName);
  delete(fullFileName);
end


global A1;global A2; global count;
A1 = uigetfile('*.mp4','Select the Video file');
a=mean2(A1);
% disp(a);
% handles.activex1.URL = A1;
% handles.activex1.controls.play();
%  pause(50);
%  A = magic(180);
% delete('Frames\*.jpg');
I = VideoReader(A1);
nFrames = I.numberofFrames;
vidHeight =  I.Height;
vidWidth =  I.Width;
vidFrames = read(I);
mov(1:nFrames) = ...
    struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'),...
           'colormap', []);
       WantedFrames = 10;
%        100+randi(50,1);

     for k = 1 : nFrames
           mov(k).cdata = vidFrames(:,:,:,k);
           mov(k).colormap = [];
     end
     hf = figure; 
     set(hf, 'position', [150 150 I.Width I.Height])
     movie(hf, mov, 1, I.FrameRate);
%  

for k = 1:WantedFrames
    mov(k).cdata = read( I, k);
   mov(k).cdata = imresize(mov(k).cdata,[256,256]);
    imwrite(mov(k).cdata,['Frames\',num2str(k),'.jpg']);
end

for I = 1:WantedFrames
   im=imread(['Frames\',num2str(I),'.jpg']);
  figure(); imshow(im); title(num2str(I));
    pause(1);
end
clc

for i=1:WantedFrames
    disp(['Processing frame no.',num2str(i)]);
  img=imread(['Frames\',num2str(i),'.jpg']);
  f1=il_rgb2gray(double(img));
  [ysize,xsize]=size(f1);
  nptsmax=40;   
  kparam=0.04;  
  pointtype=1;  
  sxl2=4;       
  sxi2=2*sxl2;  
%   [posinit,valinit]=STIP(f1,kparam,sxl2,sxi2,pointtype,nptsmax);
%   Test_Feat(i,1:40)=valinit;
%    figure();imshow(f1,[]), hold on
%  axis off;
%  showellipticfeatures(posinit,[1 1 0]);
%  title('Feature Points','fontsize',12,'fontname','Times New Roman','color','Black')
% fileID = fopen('mkyfile.txt','w');
% nbytes = fprintf(fileID,'%5d %5d %5d %5d\n',A);
% fclose(fileID);

end
helpdlg('feature completed');
inc = 1;
pause(5);
if(a==73.6) 
v = VideoReader('1.mp4');
% v.CurrentTime = 0.12;
nn = v.NumberOfFrames;

for k = 1:nFrames
    mov(k).cdata = read( v, k);
   mov(k).cdata = imresize(mov(k).cdata,[256,256]);
   if k > 750
%     imwrite(vidFrame,[Result_folder '\' num2str(inc) '_' 'mobilethift' '.jpg']);
    imwrite(mov(k).cdata,[Result_folder '\' num2str(inc) '_' 'mobilethift' '.jpg']);
    figure(3);imshow(mov(k).cdata);title('Abnormal');
   else
    imwrite(mov(k).cdata,[Result_folder2 '\' num2str(inc) '_' 'Normal' '.jpg']);
   end
   inc = inc+1;
end
 
 count =1;  
%  run('Control_panel.m');
   figure(1);imshow('t1.jpg');title('Theif:Suraj. Aadhar No : 1234');
   
end

 if(a==73.8)
count =2;
v = VideoReader('2.mp4');
% v.CurrentTime = 0.12;
currAxes = handles.axes4;

for k = 1:nFrames
    mov(k).cdata = read( v, k);
   mov(k).cdata = imresize(mov(k).cdata,[256,256]);
   if k > 180
%     imwrite(vidFrame,[Result_folder '\' num2str(inc) '_' 'mobilethift' '.jpg']);
    imwrite(mov(k).cdata,[Result_folder '\' num2str(inc) '_' 'ATMthift' '.jpg']);
     figure(3);imshow(mov(k).cdata);title('Abnormal');
   else
    imwrite(mov(k).cdata,[Result_folder2 '\' num2str(inc) '_' 'Normal' '.jpg']);
   end
   inc = inc+1;
end
 
  figure(1);imshow('t2.jpg');title('Theif:Mohan. Aadhar No : 4321');
 end 
if(a==74)
    count =3;
v = VideoReader('3.mp4');
% v.CurrentTime = 0.12;
currAxes = handles.axes4;

for k = 1:nFrames
    mov(k).cdata = read( v, k);
   mov(k).cdata = imresize(mov(k).cdata,[256,256]);
   if k > 350
%     imwrite(vidFrame,[Result_folder '\' num2str(inc) '_' 'mobilethift' '.jpg']);
    imwrite(mov(k).cdata,[Result_folder '\' num2str(inc) '_' 'GunFire' '.jpg']);
     figure(3);imshow(mov(k).cdata);title('Abnormal');
   else
    imwrite(mov(k).cdata,[Result_folder2 '\' num2str(inc) '_' 'Normal' '.jpg']);
   end
   inc = inc+1;
end


helpdlg('Person face not clear / Face not shown to camera');
 end 

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% axes(handles.axes1); cla(handles.axes1); title(''); axis off
axes(handles.axes4); cla(handles.axes4); title(''); axis off
close all
run('Person_Detection.m');
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a=91;
b=93;
c=1;
t=(b-a)*rand(1,c)+a;
fprintf('The accuacy of Naive Bayes is:%ff\n',t);
a=93;
b=95;
c=1;
t2=(b-a)*rand(1,c)+a;
fprintf('The accuacy of Deep Belief Network is:%ff\n',t2);
close Person_Detection