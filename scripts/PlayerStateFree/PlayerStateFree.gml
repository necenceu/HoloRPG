function PlayerStateFree(){
	hSpeed = lengthdir_x(inputMagnitude * speedWalk + 
	(inputMagnitude * keyRun * 1.5), inputDirection);

	vSpeed = lengthdir_y(inputMagnitude * speedWalk +
	(inputMagnitude * keyRun * 1.5), inputDirection);


	PlayerCollision();

	// Update sprite index
	var _olderSprite = sprite_index;
	if (inputMagnitude != 0) {
		direction = inputDirection
		sprite_index = spriteAmeRun;
	} else sprite_index = spriteAmeIdle;
	if (_olderSprite  !=  sprite_index) localFrame = 0;

	// Update Image Index
	PlayerAnimateSprite();
}