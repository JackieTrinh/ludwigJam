// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PS_spin(){
	if (vsp < 24) {//24
		vsp += 0.85
	}
	var maxSpd = 4
	if (abs(hsp) > maxSpd && grounded = 0) {
		hsp = hsp*0.95//0.96
	}
	var giver = instance_place(x,y,Obj_chargeGiver)
	if (giver != noone && giver.stage = 0) {
		state = PLAYERSTATE.FREE
		sprite_index = Spr_up
		instance_create_depth(x,y,Obj_player.depth+2,Obj_pop2)
		audio_play_sound(S_sodaB,1,false)
		giver.stage = 1
		giver.timer = 65
		
		Obj_camera.shakeLen = 2
		Obj_camera.shakePow = 4
	}
	
	var doSlow = 1
	//var num = clamp(vsp,50,-1)+4
	var slopeOver = instance_place(x,y+1,Obj_slopeThing)//instance_place(x,y+1,Obj_slopeThing)// vsp was 1
	var wallUnder = instance_place(x,y+1,Obj_walls)
	
	if (wallUnder != noone  && vsp > 0) {
		if (wallUnder.object_index = Obj_walls || wallUnder.object_index = Obj_wallsB) {
			if (slopeOver = noone && grounded = 0 && spinTotalHeight-y < -400) {//!place_meeting(x,y+vsp,Obj_slopeThing) 
				vspSplatBuffer = vsp 
				hspSplatBuffer = hsp
				doSplat()
				hsp = 0
			} else {
				if (place_meeting(x+hsp,y+4,Obj_walls)) {
					vsp = 0
				}
				if (slopeBuffer < 0) {//abs(hsp) < 5
					state = PLAYERSTATE.FREE
					sprite_index = Spr_idel
					hsp = 0//new
				} else {
					doSlow = 0
					hsp = hsp*0.95
				}
			}
		} else {
			doSlow = 0
		}
	} 
	
	
	//coll
	
	if (slopeOver != noone) {
		doSlow = 0
		grounded = 1
		slopeBuffer = 10
		hsp += slopeOver.ang*0.2//sliding
	} else {
		grounded = 0
	}
	
	var slopeColl = instance_place(x+hsp,y,Obj_coll)
	if (slopeColl != noone) {
		if (!place_meeting(x+hsp,y-26,Obj_coll)) {//going up slopes 26
			var check = 0
			while (place_meeting(x+hsp,y+1,Obj_coll)) {//1
				check++
				y-=1
				if (check > 15) {//30
					break
				}
			} 
		} else {
			var check = 0
			while (!place_meeting(x+sign(hsp),y,Obj_coll)) {
				check++
				x+=sign(hsp)
				if (check > 40) {//40
					state = PLAYERSTATE.FREE
					sprite_index = Spr_idel
					break
				}
			}
			if (firstBonk = 1) {
				firstBonk = 0
				hsp = -hsp*0.8
				squishX = 0.7
				squishY = 1.4
				if (vsp < 0) {
					vsp -= 4
				}
			} else {
				hsp = clamp(-hsp,-maxSpd,maxSpd)
			}
		}
	} else {//going down slopes
		if (grounded) {
			if (place_meeting(x+hsp,y+26,Obj_coll)) {//26
				var check = 0
				while (!place_meeting(x+hsp,y+1,Obj_coll)) {//4
					check++
					y+=1
					if (check > 30) {//
						state = PLAYERSTATE.FREE
						sprite_index = Spr_idel
						break
					}
				} 
			}
		}
	}
	x += hsp;
	
	if (place_meeting(x,y+vsp,Obj_coll)) {
		var check = 0
		while (!place_meeting(x,y+sign(vsp),Obj_coll)) {
			check++
			y+=sign(vsp) 
			if (check > 30) {
				break
			}
		}
		
		
		if (doSlow = 1) {
			vsp = 0
			if (slopeOver = noone) {// if jank look here
				hsp = clamp(hsp,-3,3)
			}
		}
		
	}

	y += vsp;
	
	if (vsp < 0) {
		spinTotalHeight = y
	}
}