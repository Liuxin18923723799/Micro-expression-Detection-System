%Author:    Kamil Stepien
%Date:      08 April 2016

close all                                                                   %close all windows
clear                                                                       %clear all variables
clc                                                                         %clear command window

file = 'MEXTest.mp4';                                                       %define file to be processed
%Create video object with some properties,
%read video frames from video file
vid = vision.VideoFileReader(file,'ImageColorSpace','RGB',...
    'VideoOutputDataType', 'single');

%Create Face Detectors
detectFace = vision.CascadeObjectDetector();

figH = figure;                                                              %assign figure to a variable

while ~isDone(vid)                                                          %run video until done
    colorFrame  = step(vid);                                                %set individual colour frames
    colorFrameRes = imresize(colorFrame,0.3);                               %resize colour frame for faster computation
    
    sharpColorFrame = imsharpen(colorFrameRes);                             %sharpen the colour face frame
    adjustColorFrame = imadjust(sharpColorFrame,[.1 .1 0; .6 .7 1],[]);     %adjust frame intensity values/colours
    
    faceBbox = step(detectFace,adjustColorFrame);                           %create bounding box(bbox) around the face
    addfbbox = insertObjectAnnotation(adjustColorFrame,'rectangle',...
        faceBbox,'Face','Color','Blue','TextColor','White',...
        'LineWidth',2);                                                     %add bbox to the frame
    imshow(addfbbox,'border','tight');...
        title('Detected Face');                                             %show the above
    
    if ~ishghandle(figH)                                                    %if the program is closed
        close all                                                           %close all windows
        break                                                               %stop the process of the system
    end                                                                     %end of the statement
end                                                                         %end while loop
release(vid);                                                               %release video