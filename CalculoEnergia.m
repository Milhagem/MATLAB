% TIME = T0001newcsv.TIME
% CH1 = T0001newcsv.CH1
% CH2 = T0001newcsv.CH2
% MATH = T0001newcsv.MATH

%%
%{
Equipe Milhagem UFMG - 06/05/2024
Autor: Thiago Wriel
Esse código tem como objetivo ler um arquivo .csv, analizar seus dados e
encontrar a energia cunsumida pelo motor
%}
clc

% Configuracoes Iniciais e leitura do .csv
filepath = '/inversor3-30V-10maio.csv';
data = readtable(filepath, 'HeaderLines', 1);
TIME = data.Var1;
CH1 = data.Var2;
CH2 = data.Var4;
MATH = data.Var8;

% Plota o grafico da tensao
figure;
subplot (3,1,1);
plot (TIME, CH1);
xlabel('Tempo s');
ylabel ('Tensao');
title('GraficoTensao');

% Plota o grafico da corrente
subplot (3,1,2);
plot (TIME, CH2);
xlabel ('Tempo s');
ylabel ('Corrente');
title ('GraficoCorrente');

% Plota o grafico da potencia, U.i
subplot (3,1,3);
plot (TIME, MATH/1000);
xlabel ('Tempo s');
ylabel ('Potencia');
title ('GraficoPotencia');

% Calculo da energia em kwh
intervalo = TIME >= -10 & TIME <= 20;
TIME_intervalo = TIME(intervalo);
MATH_intervalo = MATH(intervalo);
energia_J_intervalo = trapz(TIME_intervalo, MATH_intervalo);
disp (['Energia: ', num2str(energia_J_intervalo), ' J'])
energia_kWh_intervalo = energia_J_intervalo / (3600000);
disp(['Consumo: ', num2str(energia_kWh_intervalo), ' kWh']);