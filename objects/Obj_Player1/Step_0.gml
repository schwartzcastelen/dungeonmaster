#region aplica o controle

var _gamepad_id = global.gamepad_ids[0];

#endregion

#region definindo input's

//definindo os input's de movimentação

up		= keyboard_check(ord("W")) or gamepad_axis_value(global.gamepad_ids[0],gp_axislv) < -global.AXIS_DEADZONE;
down	= keyboard_check(ord("S")) or gamepad_axis_value(global.gamepad_ids[0],gp_axislv) > global.AXIS_DEADZONE;
left	= keyboard_check(ord("A")) or gamepad_axis_value(global.gamepad_ids[0],gp_axislh) < -global.AXIS_DEADZONE;
right	= keyboard_check(ord("D")) or gamepad_axis_value(global.gamepad_ids[0],gp_axislh) > global.AXIS_DEADZONE;

#endregion

#region calculo da direção

//aplicando a velocidade vertical
velv = (down - up) * vel;

//aplicando a velocidade horizontal
velh = (right - left) * vel;

#endregion