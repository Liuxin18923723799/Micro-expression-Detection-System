%Author:    Kamil Stepien
%Date:      08 April 2016

%Function to generate the coordinate points of optical flow lines. 
function valLines = oflo(valLines, motionVecGain)

%Initialize variables used in plotting motion vectors.
firstTime = true; 
borderOffset = 15;
decimFactorRow = 5;
decimFactorCol = 5;

%Generate coordinates for plotting motion vectors.
if firstTime
    [R C] = size(valLines);                                                 %height and width in pixels
    RV = borderOffset:decimFactorRow:(R-borderOffset);
    CV = borderOffset:decimFactorCol:(C-borderOffset);
    [Y X] = meshgrid(CV,RV);
    firstTime = false;
end

%Calculate and draw the motion vectors.
tmp = valLines(RV,CV) .* motionVecGain;
valLines = [Y(:), X(:), Y(:) + real(tmp(:)), X(:) + imag(tmp(:))];