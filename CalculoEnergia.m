%%
%{
Equipe Milhagem UFMG - 06/05/2024
Autor: Thiago Wriel
Esse código tem como objetivo ler um arquivo .csv, analizar seus dados e
encontrar a energia cunsumida pelo motor
%}

clc

% Configuracoes Iniciais e leitura do .csv
filepath = '/inversor1_dina.csv';
data1 = readtable(filepath, 'HeaderLines', 16);
TIME1 = data1.Var1;
CH11 = data1.Var2;
CH21 = data1.Var4;

filepath = '/inversor3_dina.csv';
data2 = readtable(filepath, 'HeaderLines', 16);
TIME2 = data2.Var1;
CH12 = data2.Var2;
CH22 = data2.Var4;

% Plota o grafico da tensao
figure ('name', 'Gráficos da Tensão')
subplot (2,1,1);
plot (TIME1, CH11, 'Color', 'b');
xlabel('Tempo s');
ylabel ('Tensao');
title('Inversor 1.0');

subplot (2,1,2);
plot (TIME2, CH12, 'Color', 'r');
xlabel('Tempo s');
ylabel ('Tensao');
title('Inversor 3.0');

% Plota o grafico da corrente
figure ('name', 'Gráficos de Corrente')
subplot (2,1,1);
plot (TIME1, CH21, 'Color', 'b');
xlabel('Tempo s');
ylabel ('Corrente');
title('Inversr 1.0');

subplot (2,1,2);
plot (TIME2, CH22, 'Color', 'r');
xlabel('Tempo s');
ylabel ('Corrente');
title('Inversor 3.0');

% Calculo da potencia, U.i
figure ('name', 'Gráficos de Potência')
subplot (2,1,1);
MATH1 = CH11 .* CH21;
plot (TIME1, MATH1, 'Color', 'b');
xlabel('Tempo s');
ylabel ('Potencia');
title('Inverson 1.0');

subplot (2,1,2);
MATH2 = CH12 .* CH22;
plot (TIME2, MATH2, 'Color', 'r');
xlabel('Tempo s');
ylabel ('Potencia');
title('Inversor 3.0');

% Calculo da energia em kwh
intervalo1 = TIME1 >= -20 & TIME1 <= 20;
TIME_intervalo1 = TIME1(intervalo1);
MATH_intervalo1 = MATH1(intervalo1);
energia_J_intervalo1 = trapz(TIME_intervalo1, MATH_intervalo1);
disp (['Energia Inversor 1.0: ', num2str(energia_J_intervalo1), ' J'])
energia_kWh_intervalo1 = energia_J_intervalo1 / (3600000);
disp(['Consumo Inversor 1.0: ', num2str(energia_kWh_intervalo1), ' kWh']);

intervalo2 = TIME2 >= -20 & TIME2 <= 20;
TIME_intervalo2 = TIME2(intervalo2);
MATH_intervalo2 = MATH2(intervalo2);
energia_J_intervalo2 = trapz(TIME_intervalo2, MATH_intervalo2);
disp (['Energia Inversor 3.0: ', num2str(energia_J_intervalo2), ' J'])
energia_kWh_intervalo2 = energia_J_intervalo2 / (3600000);
disp(['Consumo Inversor 3.0: ', num2str(energia_kWh_intervalo2), ' kWh']);