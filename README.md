# Estudo de caso do Bellabeat

## 📝 Introdução 

O **Estudo de caso da BellaBeat** é um projeto de conclusão do **Google Data Analytics Professional Certificate** no Coursera. Neste estudo de caso, realizarei várias tarefas do mundo real de um analista de dados júnior em uma empresa fictícia chamada Bella Beat. Perguntar, preparar, processar, analisar, partilhar e agir são as etapas do processo de análise de dados que utilizarei para resolver os principais problemas empresariais.

## 💬 Background

Urška Sršen e Sando Mur co-fundaram a Bellabeat, uma empresa tecnológica especializada em produtos de saúde inteligentes concebidos para as mulheres. Ao recolher informações sobre a atividade, o sono, o stress e a saúde reprodutiva, a Bellabeat ajuda as mulheres a compreender melhor o seu bem-estar e os seus hábitos diários. Fundada em 2013, a empresa expandiu-se rapidamente, tornando-se líder no bem-estar das mulheres através de tecnologia inovadora.

## Cenário

Como analista de dados júnior na equipa de marketing da Bellabeat, a sua tarefa é analisar dados de fitness de dispositivos inteligentes para descobrir tendências de utilização por parte dos consumidores. A Bellabeat, uma empresa tecnológica em crescimento especializada em produtos de bem-estar para mulheres, tem como objetivo expandir a sua presença global. Urška Sršen, co-fundadora e diretora criativa, acredita que o estudo destes dados pode revelar oportunidades de crescimento. A sua análise centrar-se-á num dos produtos da Bellabeat e as informações que gerar irão moldar a estratégia de marketing da empresa. Apresentará as suas conclusões e recomendações estratégicas à equipa executiva para ajudar a impulsionar o sucesso futuro da Bellabeat.

Este projeto segue o processo de análise de dados em seis etapas descrito no certificado do Google Data Analytics:

    Perguntar - Definir o problema da empresa.

    Preparar - Recolher e organizar os dados relevantes.

    Processo - Limpar e validar os dados.

    Analisar - Identificar padrões e tendências.

    Partilhar - Apresentar resultados através de visualizações e relatórios.

    Agir - Recomendar estratégias com base em informações.

## ⚙ Abordagem/etapas
### 1. Perguntar

Urška Sršen encarregou-o de analisar os dados sobre a forma como os consumidores utilizam os dispositivos inteligentes que não são da Bellabeat para descobrir tendências de comportamento. Com base nestas informações, escolherá um produto Bellabeat para se concentrar e demonstrará como estas conclusões podem informar a sua estratégia de marketing.

A análise deve abordar as três questões-chave seguintes:


   1. Quais são as tendências na utilização de dispositivos inteligentes?
   2. Como é que estas tendências se podem aplicar aos clientes da Bellabeat?
   3. Como é que estas tendências podem ajudar a influenciar a estratégia de marketing da Bellabeat?

### 2. Preparar

Usarei os dados do FitBit Fitness Tracker, um valioso conjunto de dados históricos fornecido pela Motivate International Inc. sob licença, para analisar as tendências de uso do BellaBeat a partir de 2016.
Este conjunto de dados do Kaggle inclui dados de rastreio de fitness de 30 utilizadores do Fitbit que concordaram em partilhar as suas métricas de atividade pessoal. O conjunto de dados fornece detalhes granulares ao nível do minuto sobre movimento físico, frequência cardíaca e padrões de sono, juntamente com resumos diários de passos e atividade geral. Estas métricas oferecem informações valiosas sobre o comportamento do utilizador e as tendências de exercício.

**Fonte de dados:** [Bella-Beat](https://www.kaggle.com/arashnic/fitbit)<br>
[Note-se que os dados foram disponibilizados pela Motivate International Inc. ao abrigo desta [<ins>licença</ins>] (https://creativecommons.org/publicdomain/zero/1.0/).

**Ferramentas:** <br>
- Limpeza e tratamento de dados - SQL em PostgreSQL
- Visualização de dados - Microsoft Power BI

### 3. Processo
A base para esta análise são os dados de **2016** e os passos para o processamento dos dados são os seguintes:

![Modelação de dados](https://github.com/Juliana-89/Bellabeat-Case-Study-SQL-and-Power-BI/blob/main/DataModelingBellaBeat.sql)

![Transformação de dados](https://github.com/Juliana-89/Bellabeat-Case-Study-SQL-and-Power-BI/blob/main/DataTransformationBellaBeat.sql)

![Combinação de dados](https://github.com/Juliana-89/Bellabeat-Case-Study-SQL-and-Power-BI/blob/main/DataCombiningBellaBeat.sql)

![Exploração de dados](https://github.com/Juliana-89/Bellabeat-Case-Study-SQL-and-Power-BI/blob/main/DataExplorationBellaBeat.sql)

![Análise de dados](https://github.com/Juliana-89/Bellabeat-Case-Study-SQL-and-Power-BI/blob/main/Data%20Analysis.sql)

#### Combinação de dados

Depois de exportar 6 tabelas para PostgreSQL, o passo seguinte envolveu a fusão das tabelas hourly_calories, hourly_intensities e hourly_steps para consolidar métricas relevantes como calorias consumidas, intensidade total, intensidade média e contagem de passos numa estrutura unificada.

Uma vez que as tabelas têm Id, date_new e time_new em comum, foi utilizada a Inner Join para facilitar a análise de dados e a elaboração de relatórios.

#### Exploração de dados

Antes de limpar os dados, um dos primeiros passos que dei foi familiarizar-me com a estrutura da tabela e os seus dados para identificar potenciais inconsistências.

Durante a avaliação inicial dos dados, verificou-se que apenas a tabela sleep_data continha registos de 24 utilizadores distintos, enquanto todas as outras tabelas incluíam consistentemente dados de 33 utilizadores cada. Esta discrepância na representação dos participantes em todos os conjuntos de dados pode introduzir preconceitos ou limitações ao analisar as relações entre as métricas do sono e outras variáveis de atividade (por exemplo, passos, calorias). 

Uma análise dos seis quadros confirmou a ausência de valores nulos e de registos duplicados, o que indica um elevado grau de exaustividade e limpeza dos dados. 

### 4. Analisar

A questão da análise é:

Como é que estas tendências podem ajudar a influenciar a estratégia de marketing da Bellabeat?

Para simplificar a análise e manter a consistência, as tabelas de dados - que registam várias métricas de fitness, como passos, calorias, distância, sono e atividade - serão categorizadas com base nos seus intervalos de tempo (diários ou horários). Uma vez que todas as tabelas partilham a coluna "Id" como um identificador comum, este agrupamento permite um reconhecimento de padrões e conclusões mais fáceis. Ao organizar os dados desta forma, a análise torna-se mais estruturada e fácil de gerir.

![Gráfico circular Tempo despendido num dia](https://github.com/Juliana-89/Bellabeat-Case-Study-SQL-and-Power-BI/blob/main/pie%20chart.png)

Principais informações:

* Predomina o tempo sedentário (73,29%)
* A atividade ligeira é modesta (22,29%)
* Tempo de atividade muito baixo (2,58% muito ativo, 1,84% razoavelmente ativo)

![Distância total e calorias médias queimadas por dia da semana](https://github.com/Juliana-89/Bellabeat-Case-Study-SQL-and-Power-BI/blob/main/Total%20Distance.png)

Principais informações:

* A terça-feira, às 1773 horas, registou a distância total mais elevada, 45,74% superior à de domingo, que registou a distância total mais baixa, 1 216,58.
* A distância total e o total de calorias totais estão positivamente correlacionados entre si.
* A terça-feira representou 17,18% do total de distâncias.
* O total de calorias e a distância total divergiram mais quando o dia_da_semana foi terça-feira, quando o total de calorias foi 714455 superior ao total de distância.

![Distância média e calorias médias queimadas por dia da semana](https://github.com/Juliana-89/Bellabeat-Case-Study-SQL-and-Power-BI/blob/main/average%20distance.png)

principais percepções:

* Com 5,85, o sábado registou a distância média mais elevada e foi 16,46% superior ao domingo, que registou a distância média mais baixa, com 5,03.
* A distância média e o total de calorias médias queimadas estão positivamente correlacionados entre si.
* O sábado representou 15,26% da distância média.
* As Calorias Médias Queimadas e a Distância Média divergiram mais quando o Dia da Semana foi Terça-feira, quando as Calorias Médias Queimadas foram 2.350,18 mais altas do que a Distância Média.

![Tabela](https://github.com/Juliana-89/Bellabeat-Case-Study-SQL-and-Power-BI/blob/main/Screenshot%202025-04-07%20at%2009.56.48.png)
![Scarter plot 3 together](https://github.com/Juliana-89/Bellabeat-Case-Study-SQL-and-Power-BI/blob/main/3%20scarter%20plot.png)

Principais informações:

* Minutos pouco activos (R² = 0,0118): Correlação mínima com o gasto calórico.
* Minutos razoavelmente activos (R² = 0,0391): Correlação um pouco mais forte, mas ainda assim fraca.
* Minutos muito activos (R² = 0,3865): Demonstra uma correlação muito mais forte, indicando que as actividades de maior intensidade têm um impacto significativo na queima de calorias.

À medida que a intensidade e a duração da atividade aumentam, os valores do R-quadrado aumentam, mostrando uma tendência clara: exercícios mais vigorosos e prolongados levam a um maior gasto de calorias. Isto sugere que a concentração em exercícios de alta intensidade é muito mais eficaz para queimar calorias do que uma atividade baixa ou moderada.

![gráfico de colunas calorias queimadas vc hora do dia](https://github.com/Juliana-89/Bellabeat-Case-Study-SQL-and-Power-BI/blob/main/column%20chart.png)

Principais informações:

* Os dados sugerem uma forte ligação entre a intensidade da atividade e as calorias queimadas, sendo provável que os movimentos de maior intensidade contribuam significativamente para o gasto de energia.
* Além disso, o gráfico indica que os períodos de pico de atividade ocorrem entre as 7:00 e as 20:00, o que corresponde às horas típicas de vigília em que os utilizadores estão mais envolvidos em actividades físicas. 

![gráficos de tabelas](https://github.com/Juliana-89/Bellabeat-Case-Study-SQL-and-Power-BI/blob/main/table.png)
![gráfico mais assustador](https://github.com/Juliana-89/Bellabeat-Case-Study-SQL-and-Power-BI/blob/main/table%20and%20scarter%20chart.png)

Principais conclusões:

* A análise revela uma forte correlação positiva (R² = 0,8727) entre a duração do sono e as calorias queimadas, indicando que um sono mais longo e de qualidade está associado a um maior gasto calórico.
* No entanto, a relação não é linear indefinidamente - exceder a duração ideal do sono não aumenta a queima de calorias e pode, pelo contrário, reduzi-la. Isto sugere que, embora o sono adequado apoie o metabolismo, o sono excessivo pode ter um retorno decrescente ou mesmo efeitos negativos no gasto de energia.

![tabela e gráfico de escarificação](https://github.com/Juliana-89/Bellabeat-Case-Study-SQL-and-Power-BI/blob/main/table%20and%20scarter%20plot.png)

Principais informações:

* O valor R-quadrado é de 0,5504 
* Indicando uma forte correlação positiva entre os MET e as calorias médias queimadas.

O número de calorias queimadas por cada utilizador é significativamente influenciado pelos seus valores MET diários. Esta relação é evidenciada por um valor r-quadrado elevado, indicando uma forte correlação entre a linha de tendência e os pontos do conjunto de dados.

### 5. Partilhar

Após o processamento dos conjuntos de dados fornecidos através da recolha, transformação, limpeza, organização e análise, dispomos de provas factuais suficientes para responder às questões iniciais relacionadas com a atividade.

Os nossos resultados indicam que tanto a duração como a intensidade das actividades físicas influenciam significativamente o gasto de calorias. Os METs (Metabolic Equivalent of Task) oferecem informações valiosas sobre a intensidade da atividade e as calorias queimadas por minuto. Embora a maioria dos consumidores tenha um sono adequado , uma pequena parte dorme demais ou de menos. Além disso, os utilizadores tendem a praticar actividades de baixa a alta intensidade, principalmente entre as 7:00 e as 20:00 horas do dia.

### 6. Atuar

Recomendações fundamentais para os estrategas de marketing:

1. Promova o acompanhamento MET como uma caraterística essencial - Utilize o acompanhamento MET (Metabolic Equivalent of Task) nas campanhas de marketing para informar os utilizadores sobre a forma como mede a intensidade da atividade e fornece informações sobre a queima de calorias em tempo real. Isto pode ajudar os utilizadores a optimizarem os seus treinos e a manterem-se motivados.
2. Incentivar a atividade durante as horas de ponta - Uma vez que os dados mostram que os utilizadores são mais activos entre as 7:00 e as 20:00, os dispositivos inteligentes podem enviar lembretes atempados durante estas janelas para incentivar o movimento, ajudando a combater o comportamento sedentário e promovendo um estilo de vida mais ativo.
3. Melhorar o controlo do sono e as notificações - Implementar notificações inteligentes para incentivar um sono consistente e de qualidade. Introduzir métricas avançadas do sono, como o rastreio do REM (Movimento Rápido dos Olhos), para fornecer informações mais aprofundadas e melhorar os hábitos de sono dos utilizadores.
4. Introduzir desafios de calorias gamificados - Aumente o envolvimento estabelecendo desafios diários/semanais de queima de calorias com um sistema de recompensas. Os melhores desempenhos podem ganhar pontos que podem ser trocados por descontos em compras futuras, promovendo a lealdade e a motivação.

Ao incorporar estas estratégias, a empresa pode promover a participação dos utilizadores, melhorar os resultados em termos de saúde e desbloquear novas oportunidades de crescimento.

## 🔮 Conclusão
Essa análise oferece informações importantes sobre os diferentes comportamentos e preferências dos usuários do BellaBeat. Ao adaptar as estratégias a essas diferenças, a empresa pode incentivar de forma mais eficaz os utilizadores casuais a tornarem-se membros potenciais.


        
