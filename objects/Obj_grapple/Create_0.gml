/// @description Insert description here
// You can write your code in this editor
grapTimer = 26
//playerDist = 0

enum GRAPSTATE
{
	FREE,
	STICK,
	RETURN,
}

state = GRAPSTATE.FREE

pullX = 0
pullY = 0

oldX = 0
oldY = 0

pointId = noone
heldDiffX = 0
heldDiffY = 0

image_speed = 0

image_index = Obj_player.skin