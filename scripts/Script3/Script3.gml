// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function makeGrapple(){
	var grapple = instance_create_depth(x,y,depth-3,Obj_grapple)
	grapId = grapple
	var pow = 18
	if (whatDirec = 1) {
		grapple.hsp = pow
		grapple.oldX = 1
	} else {
		grapple.hsp = -pow//180 - grapAng
		grapple.oldX = -1
	}
	grapple.vsp = -pow
	grapple.oldY = -1
	
	/*
	if (whatDirec = 1) {
		grapple.direction = 45//0 + grapAng
	} else {
		grapple.direction = 135//180 - grapAng
	}
	grapple.speed = 20
	
	*/
}