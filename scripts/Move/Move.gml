function move(dir) {
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
		default:
			break;
	}
}