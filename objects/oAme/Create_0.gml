state = PlayerStateFree;
lastState = state;
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedWalk = 1.5;

spriteAmeIdle = sAme;
spriteAmeRun = sAmeRun;
localFrame = 0;