/// @description Update camera

// Update destination
if (instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
}

// Update object position
x += (xTo - x) / 3;
y += (yTo - y) / 3;

// Keep camera center inside the room
x = clamp(x, viewWidthHalf, room_width - viewWidthHalf);
y = clamp(y, viewHeightHalf, room_height - viewHeightHalf);

// Screenshake

x+= random_range(-shakeRemain, shakeRemain);
y+= random_range(-shakeRemain, shakeRemain);

shakeRemain = max(0, shakeRemain-((1/shakeLength) * shakeMagnitude));
camera_set_view_pos(cam, x - viewWidthHalf, y - viewHeightHalf);