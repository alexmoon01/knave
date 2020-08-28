function setup_outside() {
	generate_room()
	var points = bezier([[100, 100], [100, 900], [900, 100], [900, 900]], 20)
	for(var i = 0; i < array_length(points) - 1; i++) {
		with(obj_terrain) {
			var start_x = points[i][0]
			var start_y = points[i][1]
			var end_x = points[i + 1][0]
			var end_y = points[i + 1][1]
			if(collision_line(start_x, start_y, end_x, end_y, id, false, false)) {
				elevation = mountain_height
				refresh_terrain_sprite()
			}
		}
	}
}

function generate_room() {
	layer_create(50, "terrain")
	layer_create(0, "vegetation")
	layer_create(-100, "entities")
	layer_create(-150, "player")
	for(var i = 0; i < hor_tiles; i++) {
		for(var j = 0; j < ver_tiles; j++) {
			var terrain = instance_create_layer(i * tile_size, j * tile_size, "terrain", obj_terrain)
			with(terrain) {
				refresh_terrain_sprite()
			}
		}
	}
}

function refresh_terrain_sprite() {
	if(elevation < plains_height) {
		sprite_index = spr_river
	} else if(elevation < hill_height) {
		sprite_index = spr_plains
	} else if(elevation < mountain_height) {
		sprite_index = spr_hills
	} else {
		sprite_index = spr_mountains
	}
}