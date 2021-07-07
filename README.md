# Bil-467-Odev-3
Image processing using morphology

Running
1. Download files as zip, form github using green labeled 'Code' button
2. Go to 'Downloads' from your computer
3. Find Bil-467-Odev-3 file and copy it to your Desktop
4. Go to your desktop and right click to Bil-467-Odev-3 then select 'Extract Here'
5. Open matlab
6. Go to browser section and select extracted file.
7. In matlab's current folder section you can see the codes and images. You can open a script by clicking the name of this script.
8. Open soru1.m and run by clicking green triangle shaped Run button.
9. Do the step 8 dor soru2.m, soru3.m, soru4.m scripts.
10. If you want to change the input images, you can change script's `A=imread('connectedcomp.png');` to `A=imread('<the image you want>');`
11. In this project I first use RGB images then convert them to gray scaled images. If your image is already grayscale you should delete `I = rgb2gray(A);` lines or change them as `I = im2gray(A);`.
12. Have fun with outputs.

Question 1: 
  In this question the code takes images (RGB) and detect corners in this image using morphology techniques. 
  When detecting corners it scans each pixel of the image and by using corner masks it detects if this pixel epitomize a corner of a shape.
  There are some examples:
  > The left image is input (cornerfull.png) and the right one is rerpresents the corners (pixel level) of shapes in this image.

  ![2021-07-07 (4)](https://user-images.githubusercontent.com/60623941/124742406-59e69600-df25-11eb-84e8-9400ac111700.png)

  > The left image is input (cornerfull1.png) and the right one is rerpresents the corners (pixel level) of shapes in this image.

  ![2021-07-07 (5)](https://user-images.githubusercontent.com/60623941/124742623-91edd900-df25-11eb-8bf2-a3af8b18b78a.png)

  In output image we cannot see corner representations easily. To see them easily, I use the dilation function (given in command lines 57-60, the dilation.m is also in files) in a loop, so the representation points became bolder. Here is the last output:
  
  ![2021-07-07 (6)](https://user-images.githubusercontent.com/60623941/124743474-759e6c00-df26-11eb-9f7c-28dc193a45d2.png)

  If we increase the size of corner detection masks we can get more realistic results which does not give diagonal lines.
  
 Question 2:
  In this question the code takes images (RGB) and fing the Convex Hull version of the given shape in this image using morphological techniques. To solve this problem the morphology offers us 4 main masks. Our algorithm scans each pixel of the image and by using theese masks it decides if this pixel be filled or not.
  My convex-hull algorithm inspired of MatLab's `bwconvhull('<image>');` library function's default version which is called 'union' (Compute the convex hull of all foreground objects, treating them as a single object*). It is also 'objects' version which compute the convex hull of each connected component of BW individually. CH contains the convex hulls of each connected component**. We can obtain 2nd version by find connected components in an image (soru3.m) first, then for each connected component specify an area to prevent overflow and lastly run our soru2.m for each specified area. 
  There are some examples procedured by soru2.m:
  > First example using ucak.png. Left-side image is input and right-side image is the output.
  
   ![2021-07-07 (8)](https://user-images.githubusercontent.com/60623941/124745918-fd857580-df28-11eb-9b1a-ba5104902264.png)
   
  > Second example using convex_hull.png. Left-side image is input and right-side image is the output.
  
   ![2021-07-07 (9)](https://user-images.githubusercontent.com/60623941/124746199-463d2e80-df29-11eb-8050-d9b1993928ef.png)
 
  In this task the shape can get ultra large when we are trying to find their convexhull version. To solve this problem we should cut surplus in the output shape. The below conditions written in fill_spaces.m works for cutting unnecessary sides of result shape.
  
  ``
  for j=1:y
        bool=0;
        for i=1:x
            if I(i,j)==1
                bool=1;
            end
        end
        if bool==0
            res(:,j)=0;
        end
    end
    for i=1:x
        bool=0;
        for j=1:y 
            if I(i,j)==1
                bool=1;
            end
        end
        if bool==0
            res(i,:)=0;
        end
    end
    ``
  
  Here is the example of this problem for ucak.png:
  
  ![2021-07-07 (10)](https://user-images.githubusercontent.com/60623941/124748495-dda38100-df2b-11eb-943c-f483cca357d8.png)
  
  1st, 2nd and 3rd images obtained by using the fill_spaces.m function before adding given-above conditions; 4th, 5th and 6th images are obtained by adding theese conditions.
  ->1's and 4th image are input images.
  ->2nd and 5th images are the output of MatLab library function `bwconvhull('ucak.png');` 
  ->3th image is the example of the shape which has unnecessary filled pixels
  ->6th image is the result of my efforts to prevent surplus.
  
Question 3:
   In this question the code takes images (RGB) and find connected components in this image using morphological techniques. 
   MatLab has the library function `... = bwconncomp(BW,conn)` to find connected components. This function's default version `... = bwconncomp(BW)` calculates connectivity at 8-neighbor. My code also works for 8-neighbor connectivity.
   
   There are some examples procedured by soru3.m:
  > First example using connectedcomp.png . Here is the input image:
  
  ![2021-07-07 (2)](https://user-images.githubusercontent.com/60623941/124750991-cca83f00-df2e-11eb-9132-f0a8d47f0bd8.png)

  If we run the code for this image we can see the output values in console. (If you cannot see console in Matlab click 'Home' from navigation bar you can see the 'layout' section in menu. Click 'layout' then select default. The command window will be under of the editor (coding area). By using mouse you can expand it's size)
  
  ![2021-07-07 (3)](https://user-images.githubusercontent.com/60623941/124751847-c6669280-df2f-11eb-8d58-4b3f1ff1107c.png)

   > Second example using cornerfull1.png . Here is the input image:
   
   ![2021-07-07 (5)](https://user-images.githubusercontent.com/60623941/124752112-1ba2a400-df30-11eb-875f-5404e3647bc1.png)

   The console output is:
   
   ![2021-07-07 (1)](https://user-images.githubusercontent.com/60623941/124752225-42f97100-df30-11eb-86a8-2df7f4d95b75.png)

  In this question the solution structure known as recursive approach, "find all 8 neighbors of a pixel and label them, for each new labeled pixel run this algorithm again" is not effective. So I designed a new itrative algorithm which is more compicated but more effective according to recursive approach.
  My algorithm checks for three main situations when iterating over an image.
    1. Beginning of a new shape,
    2. Connection points for different founded labels,
    3. None of above. (The pixel is not beginning of a shape or have connection with 2 different labeled pixels. It is just in the shape and its predecessor pixels labeled correctly.)
    
   By using this algorithm the program just process all of the predecessor (processed) pixels again only when program detects a connection point. The downside of this algorithm is, you cannot directly obtain the number of connected components. To find correct number of connected component, the program needs to iterate again in image for few times. Then the program iterates "number of connected component" times in image to find each connected component's size.
  
 
 Question 4: 
  In this question the code takes frames from a video and for each frame it detects sobel-edges in image and crrerates new video with the images which has the detected edges only. 
  To make detection of sobel edges I use my sobelkenar.m script that I design for https://github.com/elifnurafsar/BIL-467-ODEV2 , as sobelkenar.m function.
  It works a bit slow and the output video is one second smaller than original video despite of the `while hasFrame(vidObj)` line in the code. 
  The input file hw2.mp4 and the output file result.mp4.avi given in this project's folder.
  
  *, ** https://www.mathworks.com/help/images/ref/bwconvhull.html
  
