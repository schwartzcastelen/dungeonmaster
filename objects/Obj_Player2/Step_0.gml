#region aplica o controle 2

var _gamepad_id = global.gamepad_ids[1];

#endregion

#region definindo input's

//definindo os input's de movimentação

up		= keyboard_check(ord("I")) or gamepad_axis_value(global.gamepad_ids[1],gp_axislv) < -global.AXIS_DEADZONE;
down	= keyboard_check(ord("K")) or gamepad_axis_value(global.gamepad_ids[1],gp_axislv) > global.AXIS_DEADZONE;
left	= keyboard_check(ord("J")) or gamepad_axis_value(global.gamepad_ids[1],gp_axislh) < -global.AXIS_DEADZONE;
right	= keyboard_check(ord("L")) or gamepad_axis_value(global.gamepad_ids[1],gp_axislh) > global.AXIS_DEADZONE;

#endregion

#region calcula a movimentação

//aplicando a velocidade vertical
velv = (down - up) * vel;

//aplicando a velocidade horizontal
velh = (right - left) * vel;

#endregion