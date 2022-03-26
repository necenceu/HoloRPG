/// @description Set camera up
cam = view_camera[0];
follow = oAme;
viewWidthHalf = camera_get_view_width(cam) * 0.25;
viewHeightHalf = camera_get_view_height(cam) * 0.25;

xTo = xstart;
yTo = ystart;

shakeLength = 0;
shakeMagnitude = 0;
shakeRemain = 0;