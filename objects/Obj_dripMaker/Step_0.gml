/// @description Insert description here
// You can write your code in this editor
if (delay < 0) {
	timer--
	if (timer < 0) {
		timer = dripCade+random_range(-20,20)
		var oo = instance_create_depth(x,y,depth,Obj_drip)
		oo.yMax = y+yMax
	}
	
}
delay--