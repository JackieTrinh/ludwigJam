/// @description Insert description here
// You can write your code in this editor
key_right = keyboard_check(ord("D"))+keyboard_check(vk_right)
key_right = sign(key_right)

key_right_pressed = keyboard_check_pressed(ord("D"))+keyboard_check_pressed(vk_right)
key_right_pressed = sign(key_right_pressed)

key_left = -keyboard_check(ord("A"))-keyboard_check(vk_left)
key_left = sign(key_left)

key_left_pressed = -keyboard_check_pressed(ord("A"))-keyboard_check_pressed(vk_left)
key_left_pressed = sign(key_left_pressed)

key_up = keyboard_check(ord("W"))+keyboard_check(vk_up)
key_up = sign(key_up)

key_down = -keyboard_check(ord("S"))+keyboard_check(vk_down)
key_down = sign(key_down)

key_jump = keyboard_check(vk_space)+keyboard_check(ord("Z"))+keyboard_check(ord("W"))+keyboard_check(vk_up)
key_jump = sign(key_jump)

key_jump_pressed = keyboard_check_pressed(vk_space)+keyboard_check_pressed(ord("Z"))+keyboard_check_pressed(ord("W"))+keyboard_check_pressed(vk_up)
key_jump_pressed = sign(key_jump_pressed)

key_toss = keyboard_check(ord("J"))+keyboard_check(ord("X"))
key_toss = sign(key_toss)

key_toss_down = keyboard_check_pressed(ord("J"))+keyboard_check_pressed(ord("X"))
key_toss_down = sign(key_toss_down)

key_toss_released = keyboard_check_released(ord("J"))+keyboard_check_released(ord("X"))
key_toss_released = sign(key_toss_released)


if (key_jump_pressed) {
	didStart = 1
}
if (key_toss_down) {
	didStart = 1
}
if (key_left+key_right != 0) {
	didStart = 1
}
if (didStart = 1) {
	menueY += 10
}

if (menueY > why+2000) {
	instance_destroy()	
}