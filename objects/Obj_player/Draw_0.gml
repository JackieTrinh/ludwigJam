/// @description Insert description here
// You can write your code in this editor

//draw_set_color($0000ff)
//draw_line_width(x,y,scarfX,scarfY,20)
//draw_circle(scarfX,scarfY,10,false)

//draw_sprite_ext(sprite_index,image_index,x,y,whatDirec,1,0,c_white,1)
draw_sprite_ext(sprite_index,image_index,x,y,whatDirec*squishX,1*squishY,0,c_white,1)
draw_set_font(Font1)
draw_set_color(c_white)
draw_text(Object45.x,Object45.y-50,"time")
draw_text(Object45.x,Object45.y,hours)
draw_text(Object45.x+50,Object45.y,minutes)
draw_text(Object45.x+100,Object45.y,seconds)
//draw_sprite(Sprite1,0,x,spinTotalHeight)
