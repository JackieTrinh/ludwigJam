/// @description Insert description here
// You can write your code in this editor
timer--
if (timer < 0 && stage = 1) {
	instance_create_depth(x,y,Obj_player.depth+2,Obj_pop1)
	stage = 0
	audio_play_sound(S_sodaR,1,false)
}