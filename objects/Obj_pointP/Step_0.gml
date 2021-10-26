/// @description Insert description here
// You can write your code in this editor

sin_value += (pi*2)/steps_per_cycle
if (sin_value >= pi*2) sin_value = 0;



var _ropeAngleAcceleration = -0.2 * dcos(ropeAngle)
ropeAV += _ropeAngleAcceleration
ropeAngle += ropeAV
//ropeAV *= 0.99

ropeX = grappleX +lengthdir_x(ropeLength, ropeAngle)
ropeY = grappleY +lengthdir_y(ropeLength, ropeAngle)

hsp = ropeX - x
vsp = ropeY - y

x += hsp// ex + sin(sin_value)*200
y += vsp//why - sin(sin_value2)*200



shakeLen--
if (shakeLen > 0) {
	
	shakeX = choose(-shakePow,shakePow) //random_range(-shakePow,shakePow)
	shakeY = choose(-shakePow,shakePow) //random_range(-shakePow,shakePow)
	//shakePow -= shakeDis
} else {
	shakeX = 0
	shakeY = 0
}


//ropeAV += sin(sin_value)/3

//ropeAV += sin(sin_value)/5
//hsp = sin(sin_value)*15
//x += hsp
//y += vsp 

/*
timer--
howLong--

if (timer < 0) {
	if (state = 0) {
		timer = 90
		state = 1	
		
		howLong = 10
		hsp = (newEx-ex)/10
		vsp = (newWhy-why)/10
	} else {
		timer = 90
		state = 0
		howLong = 30
		
		howLong = 30
		hsp = (ex-newEx)/30
		vsp = (why-newWhy)/30
	}
}

if (howLong < 0) {
	hsp = 0
	vsp = 0
}

x += hsp
y += vsp 


