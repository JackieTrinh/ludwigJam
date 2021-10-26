/// @description Insert description here
// You can write your code in this editor
depth = 0
//show_debug_overlay(true)

//playerStates
enum PLAYERSTATE
{
	FREE,
	TOSS,
	PULL,
	SPIN,
	SPLAT,
	END,
}

state = PLAYERSTATE.FREE

hsp = 0
vsp = 0

vspSplatBuffer = 0
hspSplatBuffer = 0

grounded = 0

jumpBuffer = 0
tossBuffer = 0
roadRunnerBuffer = 0
slopeBuffer = 0

squishX = 1
squishY = 1

charging = 0
grapId = noone
pullX = 0
pullY = 0

whatDirec = 1

firstBonk = 0

spinTotalHeight = 0
splatTimer = 0

scarfX = x
scarfY = y
getUpTimer = 0
doGetUp = 0
skin = 0//0red 2blue 1 green 3mag
//pullPow = 0
firstJolly = 0



isOn = 1

seconds = 0
minutes = 0
hours = 0

