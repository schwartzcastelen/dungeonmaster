//definindo gamepad
gamepad_connect();
show_debug_message(global.gamepad_id)
//definindo os input's de movimentação

up		= keyboard_check(ord("W")) or gamepad_axis_value(global.gamepad_id,gp_axislv) < -0.25;
down	= keyboard_check(ord("S")) or gamepad_axis_value(global.gamepad_id,gp_axislv) > 0.25;
left	= keyboard_check(ord("A")) or gamepad_axis_value(global.gamepad_id,gp_axislh) < -0.25;
right	= keyboard_check(ord("D")) or gamepad_axis_value(global.gamepad_id,gp_axislh) > 0.25;

// José tem érnia de disco :C

//aplicando a velocidade vertical
velv = (down - up) * vel;

//aplicando a velocidade horizontal
velh = (right - left) * vel;