/// @description Take turn
// You can write your code in this editor

trader_size = 0
for(i = 0; i < global.num_sizes; i++) {
	probability = logistic(size, global.max_prob[i], global.midpoints[i], global.steepness);
	if(probability < 0.1) {
		probability = 0;
	}
	if(random(1) < probability) {
		pos = random_nearby_position();
		trader_size = i;

	}
}

if(trader_size > 0) {
	trader = instance_create_layer(pos[0], pos[1], "ActorLayer", obj_trader)
	with (trader) {
		size = other.trader_size;
	}
}
