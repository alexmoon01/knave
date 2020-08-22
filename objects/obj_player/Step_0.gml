/// @description General event
// You can write your code in this editor
frames_since_move++

// Get most recent movement key
for(i = 0; i < array_length_1d(global.movement_keys); i++) {
	if(keyboard_check_pressed(global.movement_keys[i])) {
		ds_list_insert(movement_keys_down, 0, global.movement_keys[i])
	}
	if(keyboard_check_released(global.movement_keys[i])) {
		key_index = ds_list_find_index(movement_keys_down, global.movement_keys[i])
		ds_list_delete(movement_keys_down, key_index)
	}
}

// Move
if (frames_since_move >= frames_between_moves) {
	moved = true;
	switch (ds_list_find_value(movement_keys_down, 0)) {
		case vk_left:
		case ord("A"):
			move(left);
			break;
		case vk_right:
		case ord("D"):
			move(right);
			break;
		case vk_up:
		case ord("W"):
			move(up);
			break;
		case vk_down:
		case ord("S"):
			move(down);
			break;
		case vk_space:
			move(no_move)
			break;
		default:
			moved = false;
			break;
	}
	if(moved) {
		frames_since_move = 0
		trigger_turn
	}
}