// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PS_toss(){
	//if (vsp < 12) {//24
	//	vsp += 0.30
	//}
	vsp = 0
	hsp = 0
	
	if (key_toss = 0) {
		charging = 0
	}
	
	
	
	if (place_meeting(x,y+1,Obj_walls)) {
		grounded = 1
	} else {
		grounded = 0
	}
	
	if (vsp < 0) {
		spinTotalHeight = y
	}
	
	//coll
	/*
	var wall = instance_place(x+hsp,y,Obj_coll)
	if (wall != noone) {
		if (!place_meeting(x+hsp,y-6,Obj_coll)) {//going up slopes
			if (vsp > 0) {
				while (place_meeting(x+hsp,y-1,Obj_coll)) {
					y-=1
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
				while (!place_meeting(x+hsp,y-1,Obj_coll)) {
					y+=1
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
	*/
}