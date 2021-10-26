/// @description Insert description here
// You can write your code in this editor

sin_value += (pi*2)/steps_per_cycle

if (sin_value >= pi*2) sin_value = 0;


x = ex - sin(sin_value)*300



shakeLen--
if (shakeLen > 0) {
	
	shakeX = choose(-shakePow,shakePow) //random_range(-shakePow,shakePow)
	shakeY = choose(-shakePow,shakePow) //random_range(-shakePow,shakePow)
	//shakePow -= shakeDis
} else {
	shakeX = 0
	shakeY = 0
}


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


