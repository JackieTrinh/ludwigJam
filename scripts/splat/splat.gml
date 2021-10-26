// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PS_splat(){
	hsp = 0
	if (vsp < 12) {//24
		vsp += 0.65
	}
	
	if (splatTimer < 8) {
		var wallB = instance_place(x,y+1,Obj_wallsB)
		if (wallB != noone && spinTotalHeight-y < -550) {
			wallB.state = 1
			audio_play_sound(S_wood,1,false)
			hsp = hspSplatBuffer
			vsp = vspSplatBuffer
			state = PLAYERSTATE.SPIN
			sprite_index = Spr_spin
				image_index = 0
		}
	}
	
	
	
	
	if (splatTimer < 0) {
		if (grounded = 1) {
			var direc = key_left+key_right
			if (direc != 0 || jumpBuffer > 0) {
				if (doGetUp = 0) {
					getUpTimer = 6
					doGetUp = 1
					audio_play_sound(S_plunge,1,false)
				}
			}
		}
		
	}
	
	if (getUpTimer < 0 && doGetUp = 1) {
		jumpBuffer = -10
		grounded = 0//?
		vsp = -5
		sprite_index = Spr_up
		image_index = 0
		state = PLAYERSTATE.FREE
		
		/*
		var direc = key_left+key_right
		if (direc != 0) {
			whatDirec = direc
			hsp = 0//(direc)*4
			vsp = -5
			sprite_index = Spr_up
			image_index = 0
			state = PLAYERSTATE.FREE
			audio_play_sound(S_plunge,1,false)
		} else if (jumpBuffer > 0) {
			jumpBuffer = -10
			grounded = 0//?
			vsp = -5
			sprite_index = Spr_up
			image_index = 0
			state = PLAYERSTATE.FREE
			audio_play_sound(S_plunge,1,false)
		}*/
	}
	
	
	if (vsp >= 0 && place_meeting(x,y+1,Obj_coll)) {
		grounded = 1
	} else {
		grounded = 0
	}
	
	//coll
	if (place_meeting(x+hsp,y,Obj_coll)) {
		while (!place_meeting(x+sign(hsp),y,Obj_coll)) {
			x+=sign(hsp) 
		}
		hsp = 0
	}
	x += hsp;
	
	
	if (place_meeting(x,y+vsp,Obj_coll)) {
		while (!place_meeting(x,y+sign(vsp),Obj_coll)) {
			y+=sign(vsp) 
		}
		vsp = 0
	}
	y += vsp;
}