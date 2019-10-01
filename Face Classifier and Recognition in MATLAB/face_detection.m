detector = vision.CascadeObjectDetector;
vid = videoinput('dcam');
set(vid,'ReturnedColorSpace','rgb');
figure('menubar','none','tag','webcam');
while(true)
    frame=step(vid);
    bbox = step(detector,frame);
    ifaces = insertObjectAnnotation(frame,'rectangle',bbox,'me');
    imshow(ifaces,'border','tight');
    f = findobj('tag','webcam');
    if(isempty(f))
        close(gcf)
        break
    end
    pause(0.05)
end
release(vid)
