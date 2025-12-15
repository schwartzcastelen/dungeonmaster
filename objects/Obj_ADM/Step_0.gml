#region verifica se o player 2 está ou não instanciado e ativa/desativa o split screen durante o jogo
// Re-detecta gamepads
gamepad_connect_multi(); 

// --- CONTROLE DE PLAYER 2 - ENTRADA---

if (!instance_exists(Obj_Player2)) 
{
    var _gamepad_id_p2 = global.gamepad_ids[1]; 

    // Condição para CONECTAR (Gamepad 2 apertando START OU Teclado ENTER)
    var _p2_conectou = (_gamepad_id_p2 != noone) && gamepad_button_check_pressed(_gamepad_id_p2, gp_start);
    var _p2_teclado_conectou = keyboard_check_pressed(vk_enter); 

    if (_p2_conectou || _p2_teclado_conectou)
    {
        instance_create_layer(global.x_inicial_p2, global.y_inicial_p2, "Instances", Obj_Player2);
        ativar_split_screen(true); // Ativa o Split Screen
    }
} 
else 
// --- CONTROLE DE PLAYER 2 - SAÍDA ---
// 2. Player 2 EXISTE: Tenta sair
{
    var _gamepad_id_p2 = global.gamepad_ids[1]; 
    
    // A) Lógica de SAÍDA MANUAL
    var _p2_desconectou_manual = (_gamepad_id_p2 != noone) && gamepad_button_check_pressed(_gamepad_id_p2, gp_select);
    
    // B) Lógica de SAÍDA POR DESCONEXÃO DO HARDWARE
    var _p2_desconectou_hardware = (_gamepad_id_p2 == noone); 

    if (_p2_desconectou_manual || _p2_desconectou_hardware) 
    {
        instance_destroy(Obj_Player2);
        ativar_split_screen(false); // Retorna à Tela Cheia
    }
}

#endregion