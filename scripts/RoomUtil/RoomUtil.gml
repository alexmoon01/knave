#macro starter_room 0

function make_room(width_px, height_px) {
	hor_tiles = width_px / tile_size
	ver_tiles = height_px / tile_size
	
	room_id = room_add()
	starter_ = room
	room_set_width(room_id, width_px)
	room_set_height(room_id, height_px)
	room_goto(1)
	return room_id
}

