/// @description Insert description here
// You can write your code in this editor

if(stage = 0 && distance_to_object(roof) > 300) {
	stage = 1
	me = Spr_houseB
}

if (stage = 1 && Obj_player.y < y - 1000) {//27808
	stage = 2
	me = Spr_house42
}

/*
if (stage = 3 && Obj_player.y < y - 3000) {//25760
	stage = 0
	me = Spr_house
	roof.stage = 0
}
*/

if (Obj_player.x > x+70 || Obj_player.x < x-20) {
	if (door = 1) {
		audio_play_sound(S_door2,1,false)
	}
	door = 0
} else {
	if (Obj_player.y > y-100) {
		if (door = 0) {
			audio_play_sound(S_door1,1,false)
		}
		door = 1
	} else {
		if (door = 1) {
			audio_play_sound(S_door2,1,false)
		}
		door = 0
	}
}
	
