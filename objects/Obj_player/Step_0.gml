/// @description Insert description here
// You can write your code in this editor
key_right = keyboard_check(ord("D"))+keyboard_check(vk_right)
key_right = sign(key_right)

key_right_pressed = keyboard_check_pressed(ord("D"))+keyboard_check_pressed(vk_right)
key_right_pressed = sign(key_right_pressed)

key_left = -keyboard_check(ord("A"))-keyboard_check(vk_left)
key_left = sign(key_left)

key_left_pressed = -keyboard_check_pressed(ord("A"))-keyboard_check_pressed(vk_left)
key_left_pressed = sign(key_left_pressed)

key_up = keyboard_check(ord("W"))+keyboard_check(vk_up)
key_up = sign(key_up)

key_down = -keyboard_check(ord("S"))+keyboard_check(vk_down)
key_down = sign(key_down)

key_jump = keyboard_check(vk_space)+keyboard_check(ord("Z"))+keyboard_check(ord("W"))+keyboard_check(vk_up)
key_jump = sign(key_jump)

key_jump_pressed = keyboard_check_pressed(vk_space)+keyboard_check_pressed(ord("Z"))+keyboard_check_pressed(ord("W"))+keyboard_check_pressed(vk_up)
key_jump_pressed = sign(key_jump_pressed)

key_toss = keyboard_check(ord("J"))+keyboard_check(ord("X"))
key_toss = sign(key_toss)

key_toss_down = keyboard_check_pressed(ord("J"))+keyboard_check_pressed(ord("X"))
key_toss_down = sign(key_toss_down)

key_toss_released = keyboard_check_released(ord("J"))+keyboard_check_released(ord("X"))
key_toss_released = sign(key_toss_released)



if (key_jump_pressed) {
	jumpBuffer = 16
}
if (key_toss_down) {
	tossBuffer = 12
}

jumpBuffer--
tossBuffer--
splatTimer--
roadRunnerBuffer--
slopeBuffer--
getUpTimer--
switch(state)
{
	case PLAYERSTATE.FREE:  
		PS_free(); 
	break;
	case PLAYERSTATE.TOSS:  
		PS_toss(); 
	break;
	case PLAYERSTATE.PULL:  
		PS_pull(); 
	break;
	case PLAYERSTATE.SPIN:  
		PS_spin(); 
	break;
	case PLAYERSTATE.SPLAT:  
		PS_splat(); 
	break;
	case PLAYERSTATE.END:  
		PS_end(); 
	break;
}

scarfX = lerp(scarfX,x,0.05)
scarfY = lerp(scarfY,y,0.05)

squishX = lerp(squishX,1,0.3)
squishY = lerp(squishY,1,0.3)


if (instance_exists(Obj_jolly)) {
	var jol = instance_place(x,y,Obj_jolly)
	if(jol != noone) {
		skin = jol.col
		audio_play_sound(S_snap,1,false)
		instance_create_depth(jol.x,jol.y,depth+2,Obj_pop2)
		if (firstJolly = 0) {
			firstJolly = 1
			var yee = instance_create_depth(736,29824,jol.depth,Obj_jolly2)
			yee.col = 0
			yee.image_index = 0
		}
		if (jol.col = 1) {
			var yee = instance_create_depth(896,29824,jol.depth,Obj_jolly2)
			yee.col = 1
			yee.image_index = 1
		}
		if (jol.col = 2) {
			var yee = instance_create_depth(1056,29824,jol.depth,Obj_jolly2)
			yee.col = 2
			yee.image_index = 2
		}
		if (jol.col = 3) {
			var yee = instance_create_depth(1216,29824,jol.depth,Obj_jolly2)
			yee.col = 3
			yee.image_index = 3
		}
		
		instance_destroy(jol)
	}
}

if (instance_exists(Obj_jolly2)) {
	var jol = instance_place(x,y,Obj_jolly2)
	if(jol != noone && skin != jol.col) {
		skin = jol.col
		audio_play_sound(S_snap,1,false)
		instance_create_depth(jol.x,jol.y,depth+2,Obj_pop2)
	}
}

var ungs = instance_place(x,y,Obj_unga)
if (ungs != noone) {
	x = ungs.goalx
	y = ungs.goaly
}

if (place_meeting(x,y,Obj_end) && state != PLAYERSTATE.END) {
	state = PLAYERSTATE.END
	instance_create_depth(x,y,Obj_player.depth-2,Obj_pop1)
	Obj_end.state = 1
	Obj_end.sprite_index = Sprite116
	Obj_end.rumbleTimer = 15
	Obj_end.shakePow = 4
	Obj_end.shakeLen = 20
	//audio_sound_gain(music,0,20)
	//audio_play_sound(S_fmttm,1,false)
	isOn = 0
}








if (isOn = 1) {
	seconds += (delta_time*0.000001)*room_speed;
}
if seconds >= 60
{
seconds -= 60;
minutes += 1;
}
if minutes>= 60
{
minutes -= 60;
hours+= 1;
}






//show_debug_message(hsp)
/*
if (place_meeting(x,y-1,Obj_coll)) {
	show_debug_message("fdsafdsaffsad")
}

/*
show_debug_message("__________________")
show_debug_message(state)
show_debug_message(hsp)
show_debug_message(vsp)
*/