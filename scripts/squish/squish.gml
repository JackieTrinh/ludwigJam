// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function doSplat(){
	state = PLAYERSTATE.SPLAT
	sprite_index = Spr_splat
	image_index = 0
	splatTimer = 5
	doGetUp = 0
	squishX = 1.1
	squishY = 0.9
	
	with (Obj_npc) {
		sprite_index = Flin
		image_index = 0
	}
	
	audio_play_sound(S_slap2,1,false)
	if (spinTotalHeight-y < -650) {
		Obj_camera.shakePow = 3
		Obj_camera.shakeLen = 5
		splatTimer = 10
		squishX = 1.3
		squishY = 0.7
	}
	
	if (spinTotalHeight-y < -1400) {
		Obj_camera.shakePow = 6
		Obj_camera.shakeLen = 10
		splatTimer = 15
		squishX = 1.5
		squishY = 0.5
		
		var eff = instance_create_depth(x+32,y+4,Obj_player.depth+2,Obj_wind)//wind eff
		eff.image_xscale = -1
		instance_create_depth(x-32,y+4,Obj_player.depth+2,Obj_wind)
	}
	
	if (spinTotalHeight-y < -3000) {
		Obj_camera.shakePow = 12
		Obj_camera.shakeLen = 15
		splatTimer = 20
		squishX = 1.5
		squishY = 0.5
	}
}