//inicializando o gamepad
global.gamepad_id = noone;

gamepad_connect = function(){
	var _gamepad_slots = gamepad_get_device_count();
	
	for(var _i = 0; _i < _gamepad_slots; _i++){
		if(gamepad_is_connected(_i)){
			global.gamepad_id = _i;
			return true;
		}
	}
	return false;
}

//movimentação inicial sem valor - controles

up		= noone;
down	= noone;
left	= noone;
right	= noone;

//variaveis de movimento
velh = 0;
velv = 0;

//velocidade
vel = 2;