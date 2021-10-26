/// @description Insert description here
// You can write your code in this editor

if (Obj_player.state = PLAYERSTATE.PULL) {
	var goal = Obj_player.grapId
	if (goal != noone) {
		direction = point_direction(x,y,goal.x,goal.y)
		speed = spd
	}
} else {
	x = Obj_player.x
	y = Obj_player.y
}