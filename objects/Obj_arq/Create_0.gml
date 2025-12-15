#region movimentação e perseguição

//variaveis de movimento
velh = 0;
velv = 0;

//velocidade

velocidade_perseg = 3; 
alcance_visao = 600; 

// O alvo que está sendo perseguido/atacado
alvoF = noone;

// Variáveis de Memória (LKP - Last Known Position)
alvo_visto = false;          // Flag para indicar que o alvo foi visto recentemente
memoria_x = -999;            // Última posição X conhecida do alvo
memoria_y = -999;            // Última posição Y conhecida do alvo
dist_parada_memoria = 50;    // Distância mínima para considerar que o inimigo chegou ao LKP

//desvio de colisão
distancia_desvio = 32;
angulo_desvio = 20;
#endregion

#region variáveis referente a flecha

// Variáveis de Controle
velocidade_kiting = 1.75;
alcance_visao = 700;
alcance_ideal_max = 450;
alcance_ataque = 250;   // Distância máxima para detectar e atacar o jogador
tempoRE = 120;  // Tempo de espera entre ataques (em frames)
tempo = tempoRE; // Contador inicializa pronto para atirar
dano_flecha = 10;       // Dano que a flecha vai causar

// Variável de Alvo
alvoF = noone; // A instância do jogador que será o alvo (Obj_Player1 ou Obj_Player2)

#endregion