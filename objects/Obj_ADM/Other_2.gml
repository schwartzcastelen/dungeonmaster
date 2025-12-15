#region variaveis do gamepad

// 1. Definições Globais
global.MAX_PLAYERS = 2; 
global.AXIS_DEADZONE = 0.2; 
global.gamepad_ids = array_create(global.MAX_PLAYERS, noone);
global.split_active = false; // Estado inicial da tela
global.x_inicial_p2 = 500; 
global.y_inicial_p2 = 500;

// 2. Detecção Inicial de Gamepads
gamepad_connect_multi();

#endregion