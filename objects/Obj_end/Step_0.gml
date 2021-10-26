/// @description Insert description here
// You can write your code in this editor

rumbleTimer--



if (state = 1) {
	if (rumbleTimer < 0) {
		if (vsp > -10) {//if (vsp > -4) {
			vsp -= 0.05
		}
	} else {
		
	}
	y += vsp
}



shakeLen--
if (shakeLen > 0) {
	shakeX = choose(-shakePow,shakePow) //random_range(-shakePow,shakePow)
	shakeY = choose(-shakePow,shakePow) //random_range(-shakePow,shakePow)
	//shakePow -= shakeDis
} else {
	shakeX = 0
	shakeY = 0
}

