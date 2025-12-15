#region define a camera para o modo de 1 player no inicio da área

// 1. Posição inicial do Player 1
var x_inicial_p1 = 300; 
var y_inicial_p1 = 500;

// 2. Criação do Player 1 (Deve existir desde o início)
instance_create_layer(x_inicial_p1, y_inicial_p1, "Instances", Obj_Player1);

// 3. Setup de Tamanho (REMOVIDO daqui! Será feito pela função ativar_split_screen)

// 4. Alvos e Bordas (Mantenha aqui, pois o alvo da Câmera não muda)
camera_set_view_target(view_camera[0], Obj_Player1); 
camera_set_view_target(view_camera[1], Obj_Player2); // Alvo P2 é definido mesmo que não exista
camera_set_view_border(view_camera[0], 100, 100); 
camera_set_view_border(view_camera[1], 100, 100); // Adicionei para P2 por garantia

// 5. Inicializa no modo Tela Cheia (A função define o tamanho da Câmera para 1920x1080)
ativar_split_screen(false); 

// 6. Ativar apenas a View 1 (P1)
view_set_visible(0, true);
// view_set_visible(1, false) será chamado dentro da função ativar_split_screen(false)

#endregion