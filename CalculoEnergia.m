%%
%{
Equipe Milhagem UFMG - 06/05/2024
Autor: Thiago Wriel
Esse código tem como objetivo ler um arquivo .csv, analizar seus dados e
encontrar a energia cunsumida pelo motor
%}

% Configuracoes Iniciais e leitura do .csv
filepath = '/Medida1.csv';
data1 = readtable(filepath, 'HeaderLines', 1);
TIME1 = data1.Var1;
CH11 = data1.Var2;
CH21 = data1.Var4;

filepath = '/Medida2.csv';
data2 = readtable(filepath, 'HeaderLines', 1);
TIME2 = data2.Var1;
CH12 = data2.Var2;
CH22 = data2.Var4;

filepath = '/T0002.CSV';
data3 = readtable(filepath, 'HeaderLines', 15);
TIME3 = data3.TIME;
CH13 = data3.CH1;
CH23 = data3.CH2;

filepath = '/T0004.CSV';
data4 = readtable(filepath, 'HeaderLines', 15);
TIME4 = data4.TIME;
CH14 = data4.CH1;
CH24 = data4.CH2;

% Plota o grafico da tensao
figure ('name', 'Gráficos da Tensão')
subplot (4,1,1);
plot (TIME1, CH11, 'Color', 'b');
xlabel('Tempo s');
ylabel ('Tensao');
title('GraficoTensao 1');

subplot (4,1,2);
plot (TIME2, CH12, 'Color', 'r');
xlabel('Tempo s');
ylabel ('Tensao');
title('GraficoTensao 2');

subplot (4,1,3);
plot (TIME3, CH13, 'Color', 'm');
xlabel('Tempo s');
ylabel ('Tensao');
title('GraficoTensao 3');

subplot (4,1,4);
plot (TIME4, CH14, 'Color', 'g');
xlabel('Tempo s');
ylabel ('Tensao');
title('GraficoTensao 4');

% Plota o grafico da corrente
figure ('name', 'Gráficos de Corrente')
subplot (4,1,1);
plot (TIME1, CH21, 'Color', 'b');
xlabel('Tempo s');
ylabel ('Corrente');
title('GraficoCorrente 1');

subplot (4,1,2);
plot (TIME2, CH22, 'Color', 'r');
xlabel('Tempo s');
ylabel ('Corrente');
title('GraficoCorrente 2');

subplot (4,1,3);
plot (TIME3, CH23, 'Color', 'm');
xlabel('Tempo s');
ylabel ('Corrente');
title('GraficoCorrente 3');

subplot (4,1,4);
plot (TIME4, CH24, 'Color', 'g');
xlabel('Tempo s');
ylabel ('Corrente');
title('GraficoCorrente 4');

% Calculo da potencia, U.i
figure ('name', 'Gráficos de Potência')
subplot (4,1,1);
MATH1 = CH11 .* CH21;
plot (TIME1, MATH1, 'Color', 'b');
xlabel('Tempo s');
ylabel ('Potencia');
title('GraficoPotencia 1');

subplot (4,1,2);
MATH2 = CH12 .* CH22;
plot (TIME2, MATH2, 'Color', 'r');
xlabel('Tempo s');
ylabel ('Potencia');
title('GraficoPotencia 2');

subplot (4,1,3);
MATH3 = CH13 .* CH23;
plot (TIME3, MATH3, 'Color', 'm');
xlabel('Tempo s');
ylabel ('Potencia');
title('GraficoPotencia 3');

subplot (4,1,4);
MATH4 = CH14 .* CH24;
plot (TIME4, MATH4, 'Color', 'g');
xlabel('Tempo s');
ylabel ('Potencia');
title('GraficoPotencia 4');

% Calculo da energia em kwh
intervalo1 = TIME1 >= -2 & TIME1 <= 2;
TIME_intervalo1 = TIME1(intervalo1);
MATH_intervalo1 = MATH1(intervalo1);
energia_J_intervalo1 = trapz(TIME_intervalo1, MATH_intervalo1);
disp (['Energia 1: ', num2str(energia_J_intervalo1), ' J'])
energia_kWh_intervalo1 = energia_J_intervalo1 / (3600000);
disp(['Consumo 1: ', num2str(energia_kWh_intervalo1), ' kWh']);

intervalo2 = TIME2 >= -2 & TIME2 <= 2;
TIME_intervalo2 = TIME2(intervalo2);
MATH_intervalo2 = MATH2(intervalo2);
energia_J_intervalo2 = trapz(TIME_intervalo2, MATH_intervalo2);
disp (['Energia 2: ', num2str(energia_J_intervalo2), ' J'])
energia_kWh_intervalo2 = energia_J_intervalo2 / (3600000);
disp(['Consumo 2: ', num2str(energia_kWh_intervalo2), ' kWh']);

intervalo3 = TIME3 >= -2 & TIME3 <= 2;
TIME_intervalo3 = TIME3(intervalo3);
MATH_intervalo3 = MATH3(intervalo3);
energia_J_intervalo3 = trapz(TIME_intervalo3, MATH_intervalo3);
disp (['Energia 3: ', num2str(energia_J_intervalo3), ' J'])
energia_kWh_intervalo3 = energia_J_intervalo3 / (3600000);
disp(['Consumo 3: ', num2str(energia_kWh_intervalo3), ' kWh']);

intervalo4 = TIME4 >= -2 & TIME4 <= 2;
TIME_intervalo4 = TIME4(intervalo4);
MATH_intervalo4 = MATH4(intervalo4);
energia_J_intervalo4 = trapz(TIME_intervalo4, MATH_intervalo4);
disp (['Energia 4: ', num2str(energia_J_intervalo4), ' J'])
energia_kWh_intervalo4 = energia_J_intervalo4 / (3600000);
disp(['Consumo 4: ', num2str(energia_kWh_intervalo4), ' kWh']);

% Calculo da energia media
energia_media_J = (energia_J_intervalo1 + energia_J_intervalo2 + energia_J_intervalo3 + energia_J_intervalo4) / 4;
disp (['Energia Media: ', num2str(energia_media_J), ' J'])
energia_media_kWh = energia_media_J / (3600000);
disp(['Consumo Medio: ', num2str(energia_media_kWh), ' kWh']);

%%

% Configuracoes Iniciais e leitura do .csv
filepath = '/inversor3-1.csv';
data1 = readtable(filepath, 'HeaderLines', 1);
TIME1 = data1.Var1;
CH11 = data1.Var2;
CH21 = data1.Var4;

filepath = '/inversor3-2.csv';
data2 = readtable(filepath, 'HeaderLines', 1);
TIME2 = data2.Var1;
CH12 = data2.Var2;
CH22 = data2.Var4;

filepath = '/inversor3-3.csv';
data3 = readtable(filepath, 'HeaderLines', 15);
TIME3 = data3.Var1;
CH13 = data3.Var2;
CH23 = data3.Var4;

filepath = '/inversor3-4.csv';
data4 = readtable(filepath, 'HeaderLines', 15);
TIME4 = data4.Var1;
CH14 = data4.Var2;
CH24 = data4.Var4;

% Plota o grafico da tensao
figure ('name', 'Gráficos da Tensão')
subplot (4,1,1);
plot (TIME1, CH11, 'Color', 'b');
xlabel('Tempo s');
ylabel ('Tensao');
title('GraficoTensao 1');

subplot (4,1,2);
plot (TIME2, CH12, 'Color', 'r');
xlabel('Tempo s');
ylabel ('Tensao');
title('GraficoTensao 2');

subplot (4,1,3);
plot (TIME3, CH13, 'Color', 'm');
xlabel('Tempo s');
ylabel ('Tensao');
title('GraficoTensao 3');

subplot (4,1,4);
plot (TIME4, CH14, 'Color', 'g');
xlabel('Tempo s');
ylabel ('Tensao');
title('GraficoTensao 4');

% Plota o grafico da corrente
figure ('name', 'Gráficos de Corrente')
subplot (4,1,1);
plot (TIME1, CH21, 'Color', 'b');
xlabel('Tempo s');
ylabel ('Corrente');
title('GraficoCorrente 1');

subplot (4,1,2);
plot (TIME2, CH22, 'Color', 'r');
xlabel('Tempo s');
ylabel ('Corrente');
title('GraficoCorrente 2');

subplot (4,1,3);
plot (TIME3, CH23, 'Color', 'm');
xlabel('Tempo s');
ylabel ('Corrente');
title('GraficoCorrente 3');

subplot (4,1,4);
plot (TIME4, CH24, 'Color', 'g');
xlabel('Tempo s');
ylabel ('Corrente');
title('GraficoCorrente 4');

% Calculo da potencia, U.i
figure ('name', 'Gráficos de Potência')
subplot (4,1,1);
MATH1 = CH11 .* CH21;
plot (TIME1, MATH1, 'Color', 'b');
xlabel('Tempo s');
ylabel ('Potencia');
title('GraficoPotencia 1');

subplot (4,1,2);
MATH2 = CH12 .* CH22;
plot (TIME2, MATH2, 'Color', 'r');
xlabel('Tempo s');
ylabel ('Potencia');
title('GraficoPotencia 2');

subplot (4,1,3);
MATH3 = CH13 .* CH23;
plot (TIME3, MATH3, 'Color', 'm');
xlabel('Tempo s');
ylabel ('Potencia');
title('GraficoPotencia 3');

subplot (4,1,4);
MATH4 = CH14 .* CH24;
plot (TIME4, MATH4, 'Color', 'g');
xlabel('Tempo s');
ylabel ('Potencia');
title('GraficoPotencia 4');

% Calculo da energia em kwh
intervalo1 = TIME1 >= -2 & TIME1 <= 2;
TIME_intervalo1 = TIME1(intervalo1);
MATH_intervalo1 = MATH1(intervalo1);
energia_J_intervalo1 = trapz(TIME_intervalo1, MATH_intervalo1);
disp (['Energia 1: ', num2str(energia_J_intervalo1), ' J'])
energia_kWh_intervalo1 = energia_J_intervalo1 / (3600000);
disp(['Consumo 1: ', num2str(energia_kWh_intervalo1), ' kWh']);

intervalo2 = TIME2 >= -2 & TIME2 <= 2;
TIME_intervalo2 = TIME2(intervalo2);
MATH_intervalo2 = MATH2(intervalo2);
energia_J_intervalo2 = trapz(TIME_intervalo2, MATH_intervalo2);
disp (['Energia 2: ', num2str(energia_J_intervalo2), ' J'])
energia_kWh_intervalo2 = energia_J_intervalo2 / (3600000);
disp(['Consumo 2: ', num2str(energia_kWh_intervalo2), ' kWh']);

intervalo3 = TIME3 >= -2 & TIME3 <= 2;
TIME_intervalo3 = TIME3(intervalo3);
MATH_intervalo3 = MATH3(intervalo3);
energia_J_intervalo3 = trapz(TIME_intervalo3, MATH_intervalo3);
disp (['Energia 3: ', num2str(energia_J_intervalo3), ' J'])
energia_kWh_intervalo3 = energia_J_intervalo3 / (3600000);
disp(['Consumo 3: ', num2str(energia_kWh_intervalo3), ' kWh']);

intervalo4 = TIME4 >= -2 & TIME4 <= 2;
TIME_intervalo4 = TIME4(intervalo4);
MATH_intervalo4 = MATH4(intervalo4);
energia_J_intervalo4 = trapz(TIME_intervalo4, MATH_intervalo4);
disp (['Energia 4: ', num2str(energia_J_intervalo4), ' J'])
energia_kWh_intervalo4 = energia_J_intervalo4 / (3600000);
disp(['Consumo 4: ', num2str(energia_kWh_intervalo4), ' kWh']);

% Calculo da energia media
energia_media_J = (energia_J_intervalo1 + energia_J_intervalo2 + energia_J_intervalo3 + energia_J_intervalo4) / 4;
disp (['Energia Media: ', num2str(energia_media_J), ' J'])
energia_media_kWh = energia_media_J / (3600000);
disp(['Consumo Medio: ', num2str(energia_media_kWh), ' kWh']);

%%

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