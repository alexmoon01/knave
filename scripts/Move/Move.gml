function move(dir) {
	moved = true
	switch(dir) {
		case left:
			x -= tile_size;
			break;
		case right:
			x += tile_size;
			break;
		case up:
			y -= tile_size;
			break;
		case down:
			y += tile_size;
			break;
		case no_move:
			break;
		default:
			moved = false
			break;
	}
}