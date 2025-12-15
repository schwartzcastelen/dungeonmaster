// Variáveis de dimensão (Globalizadas no GameManager)
// global.largura_total = 1920; 
// global.altura_total = 1080; 

function gamepad_connect_multi() {
    // Implementação da função de detecção do Gamepad (Já discutida)
    
    // Zera o array de IDs
    for (var i = 0; i < global.MAX_PLAYERS; i++) {
        global.gamepad_ids[i] = noone;
    }
    
    var _slot_count = gamepad_get_device_count();
    var _players_found = 0;
    
    for (var _i = 0; _i < _slot_count; _i++) {
        if (gamepad_is_connected(_i) && _players_found < global.MAX_PLAYERS) {
            global.gamepad_ids[_players_found] = _i;
            gamepad_set_axis_deadzone(_i, global.AXIS_DEADZONE);
            _players_found++;
        }
        if (_players_found >= global.MAX_PLAYERS) break;
    }
}

function ativar_split_screen(_ativar) {
    
  var _largura_total = 1920; 
    var _altura_total = 1080;
    var _largura_metade = _largura_total / 2; // 960
    var _altura_metade = _altura_total;   // 540 

   if (_ativar) // MODO TELA DIVIDIDA
{
    // 1. TAMANHO DA CÂMERA (VIEW): DEVE SER 960x540
    // Isso garante que a proporção (960/540) é 16:9, corrigindo a distorção.
    camera_set_view_size(view_camera[0], _largura_metade, _altura_metade); 
    camera_set_view_size(view_camera[1], _largura_metade, _altura_metade); 

    // 2. VIEWPORT (PORT): Continua 960x1080 (isso causa barras pretas, mas evita distorção)
    view_wport[0] = _largura_metade;
    view_wport[1] = _largura_metade;
    view_xport[1] = _largura_metade;
        
        view_set_visible(1, true); 
        global.split_active = true;
        
	} else { // Modo Tela Cheia (Apenas P1)
    
    // *** ADIÇÃO CRÍTICA: Redefine o tamanho da Câmera para 1920x1080 ***
    camera_set_view_size(view_camera[0], _largura_total, _altura_total);
    
    // 1. Viewport P1: Ocupa a tela inteira
    view_wport[0] = _largura_total;
    view_xport[0] = 0;
    
    // 2. Desativa a View 2 (P2)
    view_wport[1] = 0; // Limpa o Viewport 1
    view_set_visible(1, false); 
    global.split_active = false; // Desativa a linha de separação
}
    // ... (restante do código) ...
}
