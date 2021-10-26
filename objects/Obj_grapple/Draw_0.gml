/// @description Insert description here
// You can write your code in this editor

draw_set_color($000000)
draw_line_width(Obj_player.x,Obj_player.y,x,y,20)
draw_circle(Obj_player.x,Obj_player.y,10,false)
if (Obj_player.skin = 0) {
	draw_set_color($0000ff)
} else if (Obj_player.skin = 1) {
	draw_set_color($00FF05)
} else if (Obj_player.skin = 2) {
	draw_set_color($FF0A00)
} else if (Obj_player.skin = 3) {
	draw_set_color($9D00FF)
}

draw_circle(Obj_player.x,Obj_player.y,5,false)
draw_line_width(Obj_player.x,Obj_player.y,x,y,10)

draw_self()