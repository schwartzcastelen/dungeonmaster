#region movimentação e checagem 

// --- 1. ENCONTRAR E VALIDAR ALVO ---

alvoF = instance_nearest(x, y, Obj_Pai); 
velh = 0;
velv = 0;

if (alvoF != noone) 
{
    var _distancia_alvo = point_distance(x, y, alvoF.x, alvoF.y);
    var _direcao_alvo = point_direction(x, y, alvoF.x, alvoF.y);
    
    // 1.1. VERIFICAR LINHA DE VISÃO (LOS)
    var _obstaculo = collision_line(x, y, alvoF.x, alvoF.y, Obj_Col, false, true);
    
    // Variáveis para a lógica de movimento unificada
    var _vel_mov = 0;
    var _direcao_mov = 0; // Direção ideal (em linha reta para alvo ou LKP)
    var _alvo_mov_x = -1; // Ponto X para onde o inimigo deve ir
    var _alvo_mov_y = -1; // Ponto Y para onde o inimigo deve ir

    if (_obstaculo == noone && _distancia_alvo <= alcance_visao)
    {
        // ----------------------------------------
        // ESTADO 1: VISÃO CLARA (KITING / ATAQUE)
        // ----------------------------------------
        
        // SALVA A MEMÓRIA
        memoria_x = alvoF.x;
        memoria_y = alvoF.y;
        alvo_visto = true;
        
        // Determina o movimento para Kiting
        if (_distancia_alvo <= alcance_ataque) // MUITO PERTO: FUGIR
        {
            _vel_mov = velocidade_kiting;
            _direcao_mov = _direcao_alvo + 180; // Direção de fuga
        }
        else if (_distancia_alvo > alcance_ideal_max) // MUITO LONGE: APROXIMAR
        {
            _vel_mov = velocidade_kiting;
            _direcao_mov = _direcao_alvo; // Direção de perseguição
        }
        
        // Define o ponto de destino como o alvo (para a lógica de desvio)
        _alvo_mov_x = alvoF.x;
        _alvo_mov_y = alvoF.y;
        
        // --- LÓGICA DE ATAQUE (KITING) ---
        if (_distancia_alvo >= alcance_ataque && _distancia_alvo <= alcance_visao)
        {
            tempo--;
            if (tempo <= 0) 
            {
                disparar_flecha(alvoF.x, alvoF.y);
                tempo = tempoRE;
            }
        }
    }
    else // Perdeu a linha de visão
    {
        // ----------------------------------------
        // ESTADO 2: PERSEGUIR MEMÓRIA (LKP)
        // ----------------------------------------
        
        if (alvo_visto == true) // Se o alvo foi visto recentemente
        {
            var _dist_lkp = point_distance(x, y, memoria_x, memoria_y);

            // Verifica se o inimigo chegou perto do ponto de memória
            if (_dist_lkp > dist_parada_memoria) 
            {
                _vel_mov = velocidade_kiting;
                _direcao_mov = point_direction(x, y, memoria_x, memoria_y); // Direção para o LKP
                
                // Define o ponto de destino como o LKP (para a lógica de desvio)
                _alvo_mov_x = memoria_x; 
                _alvo_mov_y = memoria_y;
            }
            else 
            {
                // Chegou no LKP. Desiste da memória.
                alvo_visto = false;
            }
        }
        
        // ----------------------------------------
        // ESTADO 3: DESISTÊNCIA (SE _alvo_visto == false)
        // ----------------------------------------
    }

    // --- APLICAR MOVIMENTO E DESVIO DE OBSTÁCULOS (UNIFICADO) ---
    
    // O movimento só é executado se _vel_mov for definido (estado 1 ou 2)
    if (_vel_mov > 0) 
    {
        var _direcao_final = _direcao_mov; // Começa com a direção ideal (para alvo ou LKP)
        
        // 1. Calcula o ponto à frente na direção ideal
        var _x_frente = x + lengthdir_x(distancia_desvio, _direcao_mov);
        var _y_frente = y + lengthdir_y(distancia_desvio, _direcao_mov);
        
        // 2. Verifica se há uma parede na frente (Raycasting)
        if (collision_line(x, y, _x_frente, _y_frente, Obj_Col, false, true))
        {
            // Caminho BLOQUEADO. Tentar desviar:
            
            // Tenta desviar para a Esquerda
            var _dir_esq = _direcao_mov + angulo_desvio;
            var _x_esq = x + lengthdir_x(distancia_desvio, _dir_esq);
            var _y_esq = y + lengthdir_y(distancia_desvio, _dir_esq);
            
            if (!collision_line(x, y, _x_esq, _y_esq, Obj_Col, false, true))
            {
                _direcao_final = _dir_esq; // Desvia para a Esquerda
            }
            else 
            {
                // Se a Esquerda também estiver bloqueada, tenta desviar para a Direita
                var _dir_dir = _direcao_mov - angulo_desvio;
                var _x_dir = x + lengthdir_x(distancia_desvio, _dir_dir);
                var _y_dir = y + lengthdir_y(distancia_desvio, _dir_dir);
                
                if (!collision_line(x, y, _x_dir, _y_dir, Obj_Col, false, true))
                {
                     _direcao_final = _dir_dir; // Desvia para a Direita
                }
                else
                {
                    // Está cercado. Para o movimento.
                    _vel_mov = 0;
                }
            }
        }

        // Aplica o movimento usando a direção FINAL
        velh = lengthdir_x(_vel_mov, _direcao_final);
        velv = lengthdir_y(_vel_mov, _direcao_final);
    }
    
    // Se _vel_mov for 0 (parado, na zona ideal ou desistiu), velh/velv já foram resetados para 0.
}
// Se não houver alvo, velh e velv já são 0.

// Se não houver alvo, velh e velv já são 0.
#endregion


#region procura o alvo
// 1. Lógica de Encontrar Alvo (O jogador mais próximo)
alvoF = instance_nearest(x, y, Obj_Pai);

// Verifique se um alvo foi encontrado E está dentro do alcance de ataque
if (alvoF != noone) 
{
    var _distancia_alvo = point_distance(x, y, alvoF.x, alvoF.y);
    
    if (_distancia_alvo <= alcance_ataque) 
    {
        // Ataque Cooldown
        tempo--;
        
        if (tempo <= 0) 
        {
            //dispara a flecha
            disparar_flecha(alvoF.x, alvoF.y);
            
            // Resetar o contador de recarga
            tempo = tempoRE;
        }
    } else {
        // Se o alvo estiver fora do alcance, o tempo atual começa a recarregar mais rápido (ou não, dependendo do design)
     
    }
}

#endregion

#region cria a flecha, definindo o dano e velocidade de projétil
// Função para criar a flecha e dar a direção

function disparar_flecha(_alvo_x, _alvo_y) {
    
    // 1. Calcule a direção do inimigo para o alvo
    var _direcao = point_direction(x, y, _alvo_x, _alvo_y);
    
    // 2. Crie a flecha (Projétil)
    var _flecha = instance_create_layer(x, y, "Instances", Obj_flecha);
    
    // 3. Configure a flecha
    _flecha.direction = _direcao;
    _flecha.speed = 8; // Velocidade da flecha
    _flecha.image_angle = _direcao; // Para a flecha apontar na direção do movimento
    _flecha.dano = dano_flecha; // Passa a variável de dano
}

#endregion