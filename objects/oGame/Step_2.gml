/// @description Pause the game

if (keyboard_check_pressed(vk_escape)) {
	global.gamePaused = !global.gamePaused;
	
	if (global.gamePaused) {
		with (all) {
			gamePausedSpeed = image_speed;
			image_speed = 0;
		}
	}
	else {
		image_speed = gamePausedSpeed;
	}
}