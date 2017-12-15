%% %% %% 
I = imread('peppers_color.jpg');  %I is a color image. It need to be converted into a gray image
%disp(I);

%figure; imshow(I);
[row, column] = size(I);

G = uint8(ones(row, column/3));   %initializing a matrix G where the converted gray image intensities will be stored. 
R= I(:,:,1);			%inserting the red color intensities in R
G=I(:,:,2);				%inserting the green color intensities in G
B=I(:,:,3);				%inserting the blue color intensities in B

G = (R*0.2126) + (G.*0.7152) + (B.*0.00722); 	

%figure; imshow(G);

[row1,column1] = size(G);
x= 1:1:255;		%gray image intensity varies from 0 upto 255. Since 0 is not a positive number we will start from 1
y= (zeros(1,255));
intensity = 1;
count = 0;
while( intensity <256 )	
    count = 0;
    for i = 1:row1
        for j = 1:column1
            if I(i,j) == intensity
                count = count+1;
            end
        end
    end
    y(1,intensity) = count;
    intensity = intensity+1;
end
bar (x,y)