vidObj = VideoReader('hw2.mp4');
v = VideoWriter('result', 'Motion JPEG AVI');
v.Quality = 95;
open(v);
video = VideoWriter('result.mp4'); %create the video object
open(video); %open the file for writing

while hasFrame(vidObj)
    vidFrame = readFrame(vidObj);
    A = sobelkenar(vidFrame); 
    writeVideo(video,A);
end
close(v);
close(video);