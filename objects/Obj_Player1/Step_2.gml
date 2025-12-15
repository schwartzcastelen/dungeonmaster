#region movimentação e colisão 

//colocando a movimentação e colisão em ação :D

move_and_collide(velh, velv, Obj_Col);

#endregion

#region camera centralizada
var _cam = view_camera[0];
// Use camera_get_view_width/height para obter o valor atual (960x540 ou 1920x1080)
var _cam_w = camera_get_view_width(_cam); 
var _cam_h = camera_get_view_height(_cam);

// 3. Calcula a nova posição X e Y da Câmera (View) no mundo do jogo.
// A posição da Câmera deve ser o ponto do Player, subtraído pela metade da largura/altura da Câmera.
var _cam_x = x - (_cam_w / 2);
var _cam_y = y - (_cam_h / 2);

// 4. Aplica a nova posição da Câmera (Atualiza a View)
camera_set_view_pos(_cam, _cam_x, _cam_y);

#endregion