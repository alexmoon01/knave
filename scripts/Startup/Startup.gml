function setup_outside() {
	generate_room()
	generate_mountains(8, 1, 5)
	fill_remaining(obj_plains)
}

function generate_room() {
	#macro hor_tiles 40
	#macro ver_tiles 30
	#macro outside_width_px hor_tiles * tile_size
	#macro outside_height_px ver_tiles * tile_size
	layer_create(50, "terrain")
	layer_create(0, "vegetation")
	layer_create(-100, "entities")
	layer_create(-150, "player")
}

function form_chain_from(x_loc, y_loc, curr_layer, obj, len) {
	blocked = false
	for(j = 0; j < len && !blocked; j++) {
		blocked = true
		for(tries = 0; tries < 3 && blocked; tries++) {
			next_pos = random_orthogonal_position(x_loc, y_loc)
			tiles = get_tiles_at(next_pos[0], next_pos[1])
			if(tiles[? "terrain"] == noone && in_bounds(next_pos[0], next_pos[1])) {
				blocked = false
				show_debug_message(next_pos[0])
				show_debug_message(next_pos[1])
				show_debug_message("")
				instance_create_layer(next_pos[0] * tile_size, next_pos[1] * tile_size, "terrain", obj_mountains)
				x_loc = next_pos[0]
				y_loc = next_pos[1]
			}
		}
	}
}

//range_length is a 2-value array representing a range of lengths (inc on both ends)
function generate_mountains(num_ranges, min_chain_len, max_chain_len) {
	seed_locations = random_positions(hor_tiles, ver_tiles, num_ranges)
	for(i = 0; i < num_ranges; i++) {
		show_debug_message("==============================")
		show_debug_message(seed_locations[i][0])
		show_debug_message(seed_locations[i][1])
		show_debug_message("")
		x_loc = seed_locations[i][0] * tile_size
		y_loc = seed_locations[i][1] * tile_size
		instance_create_layer(x_loc, y_loc, "terrain", obj_mountains)
		len = irandom(max_chain_len - min_chain_len) + min_chain_len
		form_chain_from(seed_locations[i][0], seed_locations[i][1], "terrain", obj_mountains, len)
	}
}

function fill_remaining(terrain_type, veg_type) {
}