/// @description Insert description here
// You can write your code in this editor

truY = lerp(truY,Obj_player.y-112,0.2)
truX = lerp(goalX,truX,0.9)


if (Obj_player.x > 2112+768) {
	goalX = 2112+1408
} else if (Obj_player.x < 2112-768) {
	goalX = 2112-1408
} else {
	goalX = 2112
}




shakeLen--
if (shakeLen > 0) {
	
	shakeX = choose(-shakePow,shakePow) //random_range(-shakePow,shakePow)
	shakeY = choose(-shakePow,shakePow) //random_range(-shakePow,shakePow)
	shakePow -= shakeDis
} else {
	shakeX = 0
	shakeY = 0
}

distTimer--
if (Obj_player.vsp > 0 && Obj_player.state = PLAYERSTATE.SPIN) {
	if (distY < 224 && distTimer < 0) {
		distY += 4
	}
} else {
	if (Obj_player.state != PLAYERSTATE.SPIN) {
		distY = lerp(distY,0,0.05)
		distTimer = 50
	}
}



x = truX+shakeX
y = clamp(truY+shakeY+distY,5920,40000)






/*
timer--
if (timer < 0) {
	timer = 15
	if (Obj_player.y < y-416) {
		goalY -= 832
	}

	if (Obj_player.y > y+416) {
		goalY += 832
	}
}

y = lerp(y,goalY,0.2)