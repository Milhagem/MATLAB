%{
Equipe Milhagem UFMG - 16/05/2024
Este código tem como objetivo calcular a velocidade do motor BLDC
usado atualmente pela equipe a partir do pino M do inversor v3.1.
%}

clc;
close all;
clear all;

%% Entrada de dados

% Insira aqui o nome do arquivo .csv que você vai analisar
arquivo = 'Velocidade3.csv';

% Leitura dos dados de tensão e tempo
tensao = readmatrix(arquivo,'Range','B17:B125016');
tempo = readmatrix(arquivo,'Range','A17:A125016');

% Ajusta a escala de tempo para começar em zero
tempo = tempo - tempo(1);

% Limitar a tensão a 4.5V se ultrapassar deste valor
limite_tensao = 4.5;
tensao_filtrada = min(tensao, limite_tensao);

%% Identificação das bordas de subida

limiar = limite_tensao / 2; % Limiar para identificar bordas (metade entre 0V e limite_tensao)

% Encontra as posições onde a tensão cruza o limiar de subida
rising_edges = find(tensao_filtrada(1:end-1) <= limiar & tensao_filtrada(2:end) > limiar);

% Garante que o número de bordas de subida é suficiente
num_bordas = length(rising_edges);

%% Cálculo dos períodos e frequência

% Calcula os períodos entre bordas de subida consecutivas
periodos = diff(tempo(rising_edges));

% Calculo da frequência em Hz a partir dos períodos
frequencias = 1 ./ periodos;

% Calculo da velocidade em RPM 
velocidades_rpm = frequencias * 5; 
%% Filtro médio móvel para melhorar a leitura dos dados

% Parâmetro do filtro médio móvel (ajuste conforme necessário)
filtro_tamanho = 5; % Tamanho da janela do filtro

% Aplicação do filtro médio móvel 
velocidades_rpm_suavizadas = movmean(velocidades_rpm, filtro_tamanho);

%% Resultados finais

figure;

% Subplot 1: Dados que vem do osciloscópio e dados que foram filtrados
subplot(2, 1, 1);
plot(tempo, tensao);
hold on;
plot(tempo, tensao_filtrada, 'r', 'LineWidth', 2);
xlabel('tempo (s)');
ylabel('tensão saída (V)');
legend('Pulsos originais', 'Pulsos filtrados (max 4.5V)');
title('Dados do pino M');

% Subplot 2: Velocidade em RPM
subplot(2, 1, 2);
plot(tempo(rising_edges(2:num_bordas)), velocidades_rpm_suavizadas); 
xlabel('Tempo (s)');
ylabel('Velocidade (RPM)');
title('Velocidade em RPM');