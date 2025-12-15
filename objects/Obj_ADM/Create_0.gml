
#region //inicializando o gamepad

gamepad_connect_multi = function(){
	var _gamepad_slots = gamepad_get_device_count();
	
	for(var _i = 0; _i < _gamepad_slots; _i++){
		if(gamepad_is_connected(_i)){
			global.gamepad_ids = _i;
			gamepad_set_axis_deadzone(global.gamepad_ids,global.AXIS_DEADZONE);
			return true;
		}
	}
	return false;
}

#endregion

#region carrega o split screen inicial

function ativar_split_screen(_ativar) {
    
	//resolução
    var _largura_total = 1920; 
    var _altura_total = 1080;
    var _largura_metade = _largura_total / 2;
    
    // CONFIGURAÇÃO DO PLAYER 1 (Sempre visível)

    if (_ativar) // Modo Tela Dividida
    {
        // 1. Viewport P1: Ocupa a metade esquerda
        view_wport[0] = _largura_metade;
        view_xport[0] = 0;
        
        // 2. Viewport P2: Ocupa a metade direita
        view_wport[1] = _largura_metade;
        view_xport[1] = _largura_metade;
        
        // Ativa a View 2 (P2)
        view_set_visible(1, true); 
        
    } else { // Modo Tela Cheia (Apenas P1)
        
        // 1. Viewport P1: Ocupa a tela inteira
        view_wport[0] = _largura_total;
        view_xport[0] = 0;
        
        // 2. Desativa a View 2 (P2)
        view_set_visible(1, false); 
    }
}
	
#endregion