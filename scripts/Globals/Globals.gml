#macro tile_size 32
#macro left "go left"
#macro right "go right"
#macro up "go up"
#macro down "go down"
#macro no_move "stay where you are"

// Allows the user to start and stop moving whenever they want, but still puts space between their moves
#macro frames_between_moves 15

// Triggers custom event to make AI move
#macro trigger_turn event_perform(ev_user0, 0)