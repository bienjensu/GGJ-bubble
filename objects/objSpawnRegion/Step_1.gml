if !init {
	init = true
	randWidth = random(width)
	randHeight = random(height)
	enemy = irandom_range(0, array_length(enemies)-1)
	instance_create_depth(x+randWidth, y+randHeight, 1, enemies[enemy])
}