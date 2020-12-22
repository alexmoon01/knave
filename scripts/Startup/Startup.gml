// This is called from obj_init
function setup_outside(num_mountain_ranges, min_range_len, max_range_len) {
	generate_room()
	var starts
	var angle_offset = pi/4
	var minim = min_range_len * tile_size
	var maxim = max_range_len * tile_size
	var num_ranges = (round(num_mountain_ranges/4) + 1) * 4
	for(var i = 0; i < num_ranges; i++) {
		var j = 0
		var quad_x = (i % 2) * hor_tiles / 2
		var quad_y = round(0.25 + ((i % 4) / 4)) * ver_tiles / 2
		starts[i] = [(random(hor_tiles/2) + quad_x) * tile_size, (random(ver_tiles/2) + quad_y) * tile_size]
		var len = random_range(minim, maxim)
		var num_sections = round(random_range(2, len/tile_size))
		gen_mountain_range(starts[i], len, angle_offset, num_sections)
	}
}

// Takes all points as pixel coords
function gen_mountain_range(start, len, angle_offset, num_sections) {
	var init_angle = random(2 * pi)
	var points = [start] 
	for(var i = 1; i < num_sections; i++) {
		var offset = init_angle + random(2 * angle_offset) - angle_offset
		points[i] = [points[i - 1][0] + cos(offset) * len/num_sections,
						points[i - 1][1] + sin(offset) * len/num_sections]
	}
	draw_terrain_curve(bezier(points, 20), mountain_height)
}

// Takes all points as pixel coords
function draw_terrain_curve(points, terrain_type) {
	for(var i = 0; i < array_length(points) - 1; i++) {
		var start_x = points[i][0]
		var start_y = points[i][1]
		var end_x = points[i + 1][0]
		var end_y = points[i + 1][1]
		with(obj_terrain) {
			if(collision_line(start_x, start_y, end_x, end_y, id, false, false)) {
				elevation = terrain_type
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