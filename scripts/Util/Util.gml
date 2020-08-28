randomize()

// Sigmoid distribution with given parameters
function logistic(x_val, max, mid, steepness) {
	return max / (1 + exp(-1 * steepness * (x_val - mid)))
}

//Random adjacent position, cannot be diagonal
function random_orthogonal_position(x_pos, y_pos) {
	var direc = irandom(3)
	switch(direc) {
		case 0:
			return [x_pos + 1, y_pos]
			break;
		case 1:
			return [x_pos, y_pos - 1]
			break;
		case 2:
			return [x_pos - 1, y_pos]
			break;
		case 3:
			return [x_pos, y_pos + 1]
			break;
	}
}

//Random adjacent position, can be diagonal
function random_adjacent_position(x_pos, y_pos) {
	var x_offset = 0
	var y_offset = 0
	while(x_offset == 0 && y_offset == 0) {
		x_offset = irandom(2) - 1
		y_offset = irandom(2) - 1
	}
	return [x_pos + x_offset, y_pos + y_offset]
}

// [[0, max_x), [0, max_y)]
function random_position(max_x, max_y) {
	return [irandom(max_x - 1), irandom(max_y - 1)]
}

function random_positions(max_x, max_y, count_positions) {
	positions = []
	for(i = 0; i < count_positions; i++) {
		positions[i] = random_position(max_x, max_y)
	}
	return positions
}

// Returns a map of the syntax:
// {
//	"terrain": terrain obj,
//	"vegatation": veg obj,
//	"autonomous": auton obj,
//	"player": player obj
// }
// All keys will always be there, if there are no objs of the type in the location
// the val will be noone. a, b are tile coordinates, not px coords
function get_tiles_at(a, b) {
	px_x = a * tile_size
	px_y = b * tile_size
	tiles = ds_map_create()
	tiles[? "terrain"] = instance_position(px_x, px_y, obj_terrain)
	tiles[? "vegetation"] = instance_position(px_x, px_y, obj_vegetation)
	tiles[? "autonomous"] = instance_position(px_x, px_y, obj_autonomous)
	tiles[? "player"] = instance_position(px_x, px_y, obj_player)
	return tiles
}

function get_tiles_at_px(a, b) {
	return get_tiles_at(a / tile_size, b / tile_size)
}

//boolean if tile loc (a, b) is in the bounds of the current room
function in_bounds(a, b) {
	px_x = a * tile_size
	px_y = b * tile_size
	return px_x >= 0 && px_x < room_width && px_y >= 0 && px_y < room_height
}