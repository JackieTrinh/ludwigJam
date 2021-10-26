// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PS_free(){
	if (vsp < 14) {//24
		vsp += 0.65
	}
	//hsp
	var direc = key_left+key_right
	var grnSpd = 1
	var grnTrac = 1
	if (grounded = 0) {
		var grnSpd = 0.5
		grnTrac = 0.1
	} else {
		if (direc != 0) {
			whatDirec = direc
			didStart = 1
		}
	}
	//movement
	if (hsp > -4) {
		if (hsp <= 0) {
			hsp += key_left*grnSpd
		} else {
			hsp += key_left*(grnSpd/2)
		}
	} 
	if (hsp < 4) {
		if (hsp >= 0) {
			hsp += key_right*grnSpd
		} else {
			hsp += key_right*(grnSpd/2)
		}
	}
	if (grounded = 1) {
		hsp = clamp(hsp,-4,4)
	} else {
		if (sign(hsp) != 0) {
			whatDirec = sign(hsp)
		}
	}
	//slowdown
	if (direc = 0 || direc = -sign(hsp)) {
		if (grnTrac = 1) {
			hsp = 0
		} else {
			hsp = lerp(hsp,0,grnTrac)
		}
	}
	
	
	
	if (jumpBuffer > 0 && key_jump = 1) {
		if (grounded = 1 || roadRunnerBuffer > 0) {
			jumpBuffer = -10
			instance_create_depth(x,y-12,depth+2,Obj_woosh)
			var jumpS = audio_play_sound(S_jump3,1,false)
			audio_sound_pitch(jumpS,0.7)
			squishX = 0.7
			squishY = 1.4
			
			roadRunnerBuffer = -10
			grounded = 0//?
			vsp = -10
			sprite_index = Spr_up
			image_index = 0
		}
	}
	
	if (sprite_index = Spr_up || sprite_index = Spr_upHold) {
		if (vsp > -4) {
			sprite_index = Spr_upToDown
			image_index = 0
		}
	}
	
	
	if (tossBuffer > 0) {
		tossBuffer = -10
		state = PLAYERSTATE.TOSS
		sprite_index = Spr_mouth
		image_index = 0
		var direc = key_left+key_right
		if (direc != 0) {
			whatDirec = direc
			//image_xscale = direc
		}
		makeGrapple()
		audio_play_sound(S_tSound,1,false)
		spinTotalHeight = y
		Obj_tongueObj.spd = 6
		firstBonk = 1
		
		charging = 1// if key down????
	}
	
	if (vsp >= 0 && place_meeting(x,y+1,Obj_coll)) {
		grounded = 1
		roadRunnerBuffer = 8
	} else {
		grounded = 0
	}
	
	//coll
	var wall = instance_place(x+hsp,y,Obj_coll)
	if (wall != noone) {
		if (!place_meeting(x+hsp,y-6,Obj_coll)) {//going up slopes
			if (vsp > 0) {
				var check = 0
				while (place_meeting(x+hsp,y-1,Obj_coll)) {
					check++
					y-=1
					if (check > 10) {
						break
					}
				} 
			}
		} else {
			while (!place_meeting(x+sign(hsp),y,Obj_coll)) {
				x+=sign(hsp)
			}
			hsp = 0
		}
	} else {//going down slopes
		if (grounded) {
			if (place_meeting(x+hsp,y+6,Obj_coll)) {
				var check = 0
				while (!place_meeting(x+hsp,y-1,Obj_coll)) {
					check++
					y+=1
					if (check > 10) {
						break
					}
				} 
			}
		}
	}
	
	x += hsp;
	
	if (place_meeting(x,y+vsp,Obj_coll)) {
		while (!place_meeting(x,y+sign(vsp),Obj_coll)) {
			y+=sign(vsp) 
		}
		vsp = 0
	}

	y += vsp;
	
	
	//ani
	var doChangeSprite = 1
	if (sprite_index = Spr_mouth || sprite_index = Spr_mouthHold) {
		doChangeSprite = 0
	}
	if (doChangeSprite = 1) {
		if (grounded) {
			if (direc != 0) {
				sprite_index = Spr_walk
			} else {
				sprite_index = Spr_idel
			}
		} else {
			if (sprite_index != Spr_up && sprite_index != Spr_upToDown) {
				sprite_index = Spr_down
			}
		}
	}
}


/*
	var wall = instance_place(x+hsp,y,Obj_walls)
	if (wall != noone) {
		if (hsp < 0 && x > wall.x || hsp > 0 && x < wall.x ) {
			if (!place_meeting(x+hsp,y-40,wall)) {
				y -= 4
			} else {
				while (!place_meeting(x+sign(hsp),y,Obj_walls)) {
					x+=sign(hsp)
				}
				hsp = 0
			}
		}
	}
	x += hsp;
	*/