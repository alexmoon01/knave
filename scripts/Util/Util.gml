randomize()

// Sigmoid distribution with given parameters
function logistic(x_val, max, mid, steepness) {
	return max / (1 + exp(-1 * steepness * (x_val - mid)))
}

function random_nearby_position() {
	direc = irandom(3)
	switch(direc) {
		case 0:
			return [x + tile_size, y]
			break;
		case 1:
			return [x, y - tile_size]
			break;
		case 2:
			return [x - tile_size, y]
			break;
		case 3:
			return [x, y + tile_size]
			break;
	}
}

