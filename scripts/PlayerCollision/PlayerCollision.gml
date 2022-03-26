function PlayerCollision(){	
	//Horizontal tile
	if(tilemap_get_at_pixel(collisionMap, x + hSpeed, y)) {
		x-= x mod TILE_SIZE;
		if(sign(hSpeed) == 1) x += TILE_SIZE - 1;
		hSpeed = 0;
	}
	//Horizontal tile commit
	x += hSpeed;
	
	//Vertical tile
	if(tilemap_get_at_pixel(collisionMap, x, y + vSpeed)) {
		y-= y mod TILE_SIZE;
		if(sign(vSpeed) == 1) y += TILE_SIZE - 1;
		vSpeed = 0;
	}
	
	//Vertical tile commit
	y += vSpeed;
}
