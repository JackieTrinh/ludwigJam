/// @description Insert description here
// You can write your code in this editor
if (doFall = 0) {
	if (size > 9.5) {
		size = 10
		doFall = 1	
	} else {
		size += 0.8
	}
}

if (doFall = 1) {	
	size = 10
	timer--
	if (timer < 10) {
		shakeX = random_range(-4,4)
		shakeY = random_range(-4,4)
	}
}

	

if (timer < 0) {
	doFall = 2	
}

if (doFall = 2) {
	size = 10
	if (vsp < 30) {
		vsp += 1.5
	}
}
y += vsp
if (y > yMax) {
	instance_create_depth(x,y,depth,Obj_dripSplash)
	instance_create_depth(x,y,depth,Obj_dripSplash)
	instance_destroy(self)	
}