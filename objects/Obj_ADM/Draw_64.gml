#region divisão da tela customizada e feia

// Desenha a linha APENAS se a tela dividida estiver ativa
if (global.split_active)
{
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();
    var _center_x = _gui_w / 2;

    // ... (Seu código da linha estilizada, como no exemplo anterior) ...
    
    // Exemplo:
    draw_set_color(c_dkgray); 
    draw_rectangle(_center_x - 4, 0, _center_x + 4, _gui_h, false);
    draw_set_color(c_white);
}
#endregion