/// @description Insert description here
// You can write your code in this editor

if (id != Obj_player.grapId) {
	state = GRAPSTATE.RETURN
}
//playerDist = distance_to_object(Obj_player)

switch(state)
{
	case GRAPSTATE.FREE:  
		
		var doGo = 1
		
		if (grapTimer < 15) {
			if (place_meeting(x+(oldX*20),y+(oldX*20),Obj_point) || place_meeting(x+(oldX*20),y+(oldX*20),Obj_coll)) {
				doGo = 0
				if (vsp > -5) {
					hsp = oldX*5
					vsp = -5
				}
				
				hsp += oldX*0.50
				vsp += oldY*0.50
			}	
		}
		
		if (doGo = 1) { 
			grapTimer--
			if (grapTimer < 55) {
				//speed -= 1
				hsp -= oldX
				vsp -= oldY
			}
		}
		
		var toungeSpeed = 12
		
		var point = instance_nearest(x,y,Obj_point)
		if (point_distance(x,y,point.x,point.y) < 50 ) {//place_meeting(x,y,Obj_walls)
			state = GRAPSTATE.STICK
			
			pointId = point
			//speed = 0
			hsp = 0
			vsp = 0
			
			Obj_player.sprite_index = Spr_dash
			Obj_player.image_index = 0
			//var thudS = audio_play_sound(S_thud,1,false)
			//audio_sound_pitch(thudS,0.5)
			Obj_tongueObj.direction = point_direction(Obj_tongueObj.x,Obj_tongueObj.y,x,y)
			
			var dist = point_distance(Obj_player.x,Obj_player.y,point.x,point.y)
			x = Obj_player.x+(dsin(45)*dist)*Obj_player.whatDirec
			y = Obj_player.y-dsin(45)*dist
			
			heldDiffX = x-point.x
			heldDiffY = y-point.y
			
			if (pointId.object_index = Obj_pointM || pointId.object_index = Obj_pointM2 || pointId.object_index = Obj_pointMU || pointId.object_index = Obj_pointP) {
				Obj_tongueObj.isNormal = 0
				Obj_tongueObj.spd = 10.5
			} else {
				Obj_tongueObj.isNormal = 1
				Obj_tongueObj.spd = toungeSpeed//8
			}
			
			point.shakeLen = 3
			point.shakePow = 8
		}
		
		//wall coll
		if (place_meeting(x+hsp,y+vsp,Obj_coll)) {
			while (!place_meeting(x+sign(hsp),y+sign(vsp),Obj_coll)) {
				x += sign(hsp)
				y += sign(vsp)
			}
			
			Obj_tongueObj.isNormal = 1
			hsp = 0
			vsp = 0
			
			state = GRAPSTATE.STICK
			Obj_player.sprite_index = Spr_dash
			Obj_player.image_index = 0
			
			Obj_tongueObj.spd = toungeSpeed//8
			Obj_tongueObj.direction = point_direction(Obj_tongueObj.x,Obj_tongueObj.y,x,y)
		}
	
		if (grapTimer < 0) {
			state = GRAPSTATE.RETURN
		} 
		x += hsp
		y += vsp
	break;
	case GRAPSTATE.STICK:  
		if (Obj_player.state != PLAYERSTATE.PULL) {
			Obj_player.state = PLAYERSTATE.PULL
			//Obj_camera.shakeLen = 2
			//Obj_camera.shakePow = 4
			var thudS = audio_play_sound(S_goodThud,1,false)
			audio_sound_pitch(thudS,0.9)
		}
	break;
	case GRAPSTATE.RETURN:  
		Obj_player.state = PLAYERSTATE.SPIN
		Obj_player.sprite_index = Spr_spin
		Obj_player.image_index = 0
		instance_destroy()
	break;
}



/* was in point coll
			oldX = x
			oldY = y
			x = point.x
			y = point.y
			with (Obj_player) {
				var diffX = -ceil(other.x - other.oldX)
				var diffY = -ceil(other.y - other.oldY)
				 
				for (i = 0; i < diffX; i++) {
					if (!place_meeting(x+sign(diffX),y,Obj_coll)) {
						x += sign(diffX)
					}
				}
				for (i = 0; i < diffY; i++) {
					if (!place_meeting(x+sign(diffY),y,Obj_coll)) {
						x += sign(diffY)
					}
				}
			}
			*/