function setup_outside() {
	hor_tiles = 40
	ver_tiles = 30
	outside_width_px = hor_tiles * tile_size
	outside_height_px = ver_tiles * tile_size
	layer_create(50, "terrain")
	layer_create(0, "vegetation")
	layer_create(-100, "entities")
	layer_create(-150, "player")

	for(i = 0; i < hor_tiles; i++) {
		for(j = 0; j < ver_tiles; j++) {
			switch(i % 4) {
				case 0:
					terrain = obj_plains;
					break;
				case 1:
					terrain = obj_hills;
					break;
				case 2:
					terrain = obj_mountains;
					break;
				case 3:
					terrain = obj_river;
					break;
			}
			switch(j % 3) {
				case 0:
					vegetation = obj_no_veg;
					break;
				case 1:
					vegetation = obj_tall_grass;
					break;
				case 2:
					vegetation = obj_forest;
			}
			instance_create_layer(i * tile_size, j * tile_size, "terrain", terrain)
			instance_create_layer(i * tile_size, j * tile_size, "vegetation", vegetation)
		}
	}
}