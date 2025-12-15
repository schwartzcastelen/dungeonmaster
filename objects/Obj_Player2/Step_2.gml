#region movimentação e colisão 
//colocando a movimentação e colisão em ação :D

move_and_collide(velh, velv, Obj_Col);

#endregion

#region camera centralizada

// Centraliza Câmera 2
// O End Step é chamado apenas se a instância existir, então está seguro.
var _cam = view_camera[1];
var _cam_w = camera_get_view_width(_cam);
var _cam_h = camera_get_view_height(_cam);

var _cam_x = x - (_cam_w / 2);
var _cam_y = y - (_cam_h / 2);

camera_set_view_pos(_cam, _cam_x, _cam_y);

#endregion