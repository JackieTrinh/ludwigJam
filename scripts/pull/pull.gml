// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PS_pull(){
	
	if (key_toss = 0) {
		charging = 0
	}
	
	if (grapId != noone) {
		if (Obj_tongueObj.isNormal = 1) {
			if (charging = 1 && Obj_tongueObj.spd < 16) {
				Obj_tongueObj.spd += 0.25//1.5
			}
		} else {
			if (charging = 1 && Obj_tongueObj.spd < 26) {
				Obj_tongueObj.spd += 0.50//1.5
			}
		}
		hsp = Obj_tongueObj.x-x
		vsp = Obj_tongueObj.y-y
		var dist = distance_to_point(grapId.x,grapId.y)
		if (dist < 15 || charging = 0) {
			state = PLAYERSTATE.SPIN
			sprite_index = Spr_spin
			image_index = 0
			audio_play_sound(S_dash,1,false)
			Obj_camera.shakeLen = 2
			Obj_camera.shakePow = 4
			var tee = instance_create_depth(x,y-12,Obj_player.depth+2,Obj_pop3)
			tee.image_xscale = whatDirec
			if (Obj_tongueObj.isNormal = 1) {//isnormal
				vsp = -Obj_tongueObj.spd
				vsp = lerp(vsp,-12,0.2)
				hsp = Obj_tongueObj.spd*whatDirec
			} else {//point M
				vsp -= 10
			}
			instance_destroy(grapId)
			grapId = noone
		}
		
	} else {
		state = PLAYERSTATE.SPIN
		sprite_index = Spr_spin
		image_index = 0
		Obj_camera.shakeLen = 2
		Obj_camera.shakePow = 4
		audio_play_sound(S_dash,1,false)
		instance_create_depth(x,y,Obj_player.depth+2,Obj_pop1)
	}
	
	
	if (place_meeting(x,y+1,Obj_walls)) {
		grounded = 1
	} else {
		grounded = 0
	}
	
	//coll
	if (place_meeting(x+hsp,y+vsp-4,Obj_coll)) {
		state = PLAYERSTATE.SPIN
		sprite_index = Spr_spin
		image_index = 0
		Obj_camera.shakeLen = 2
		Obj_camera.shakePow = 4
		audio_play_sound(S_dash,1,false)
		instance_create_depth(x,y,Obj_player.depth+2,Obj_pop1)
		vsp = -Obj_tongueObj.spd
		vsp = lerp(vsp,-12,0.2)
		hsp = Obj_tongueObj.spd*whatDirec
		if (place_meeting(x+hsp,y,Obj_coll)) {
			hsp = -hsp*0.8
		} else {
			hsp = hsp*0.8
		}
		if (vsp < 0) {
			vsp -= 4
		}
		
		squishX = 0.7
		squishY = 1.4
		
		instance_destroy(grapId)
		grapId = noone
	} else {
		x += hsp
		y += vsp
	}
	
	if (vsp < 0) {
		spinTotalHeight = y
	}
	
}