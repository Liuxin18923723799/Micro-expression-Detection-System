%Author:    Kamil Stepien
%Date:      08 April 2016

fd=VideoReader('normalPro.avi');                                            %read Video
for img = 1:fd.NumberOfFrames;                                              %get all frames in video
filename=strcat('frames', num2str(img), '.jpg');                            %number of to string 
fdr = read(fd, img);                                                        %read the frames 
imwrite(fdr, filename);                                                     %write or save the frame 
end                                                                         %end loop