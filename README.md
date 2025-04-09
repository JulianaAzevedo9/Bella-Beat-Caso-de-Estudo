# Estudo de caso do Bellabeat

## 📝 Introdução 

O **Estudo de caso da Bella Beat** é um projeto de conclusão do **Google Data Analytics Professional Certificate** no Coursera. Neste estudo de caso, realizarei várias tarefas do mundo real de um analista de dados júnior em uma empresa fictícia chamada Bella Beat. Perguntar, preparar, processar, analisar, partilhar e agir são as etapas do processo de análise de dados que utilizarei para resolver os principais problemas empresariais.

## 💬 Histórico

Urška Sršen e Sando Mur co-fundaram a Bellabeat, uma empresa tecnológica especializada em produtos de saúde inteligentes projetados para as mulheres. Ao recolher informações sobre a atividade, o sono, o stress e a saúde reprodutiva, a Bellabeat ajuda as mulheres a compreender melhor o seu bem-estar e os seus hábitos diários. Fundada em 2013, a empresa expandiu-se rapidamente, tornando-se líder no bem-estar das mulheres através de tecnologia inovadora.

## Cenário

Como analista de dados júnior na equipa de marketing da **Bella Beat**, a sua tarefa é analisar dados de fitness de dispositivos inteligentes para descobrir tendências de utilização por parte dos consumidoras. A Bella Beat, uma empresa tecnológica em crescimento especializada em produtos de bem-estar para mulheres, tem como objetivo expandir a sua presença global. Urška Sršen, co-fundadora e diretora criativa, acredita que o estudo destes dados pode revelar oportunidades de crescimento. Sua análise focará em um dos produtos da Bellabeat, e os insights gerados orientarão a estratégia de marketing da empresa. Você apresentará suas descobertas e recomendações estratégicas à diretoria executiva, contribuindo para o sucesso futuro da Bellabeat.

Este projeto segue o processo de análise de dados em seis etapas descrito no certificado do Google Data Analytics:

    Perguntar - Definir o problema da empresa.

    Preparar - Recolher e organizar os dados relevantes.

    Processo - Limpar e validar os dados.

    Analisar - Identificar padrões e tendências.

    Partilhar - Apresentar resultados através de visualizações e relatórios.

    Agir - Recomendar estratégias com base em informações.

## ⚙ Abordagem/etapas
### 1. Perguntar

Urška Sršen designou você para analisar dados de uso de dispositivos inteligentes da Bellabeat, identificando padrões comportamentais dos consumidoras. Com base nessas descobertas, você selecionará um produto Bellabeat como foco e demonstrará como esses insights podem orientar sua estratégia de marketing.

A análise deve abordar as três questões-chave seguintes:


   1. Quais são as tendências na utilização de dispositivos inteligentes?
   2. Como essas tendências podem se relacionar com os usuários da Bellabeat??
   3. Como é que estas tendências podem ajudar a influenciar a estratégia de marketing da Bellabeat?

### 2. Preparar

Usarei os dados do FitBit Fitness Tracker, um valioso conjunto de dados históricos fornecido pela Motivate International Inc. sob licença, para analisar as tendências de uso do BellaBeat a partir de 2016.
Este conjunto de dados do Kaggle inclui dados de rastreio de fitness de 33 utilizadoras do Fitbit que concordaram em partilhar as suas métricas de atividade pessoal. O conjunto de dados fornece detalhes granulares ao nível do minuto sobre movimento físico, frequência cardíaca e padrões de sono, juntamente com resumos diários de passos e atividades em geral. Estas métricas oferecem informações valiosas sobre o comportamento das consumidoras e as tendências de exercício.

**Fonte de dados:** [Bella-Beat](https://www.kaggle.com/arashnic/fitbit)<br>
Nota-se que os dados foram disponibilizados pela Motivate International Inc. ao abrigo desta [<ins>license</ins>](https://creativecommons.org/publicdomain/zero/1.0/).

**Ferramentas:** <br>
- Limpeza e tratamento de dados - SQL em PostgreSQL
- Visualização de dados - Microsoft Power BI

### 3. Processo
A base para esta análise são os dados de **2016** e os passos para o processamento dos dados são os seguintes:

![Modelação de dados](https://github.com/JulianaAzevedo9/BellaBeat-Estudo-De-Caso/blob/main/DataModelingBellaBeat.sql)

![Transformação de dados](https://github.com/JulianaAzevedo9/BellaBeat-Estudo-De-Caso/blob/main/DataTransformationBellaBeat.sql)

![Combinação de dados](https://github.com/JulianaAzevedo9/BellaBeat-Estudo-De-Caso/blob/main/DataCombiningBellaBeat.sql)

![Exploração de dados](https://github.com/JulianaAzevedo9/BellaBeat-Estudo-De-Caso/blob/main/DataExplorationBellaBeat.sql)

![Análise de dados](https://github.com/JulianaAzevedo9/BellaBeat-Estudo-De-Caso/blob/main/Data%20Analysis.sql)

#### Combinação de dados

Depois de exportar 6 tabelas para PostgreSQL, o passo seguinte envolveu a fusão das tabelas hourly_calories, hourly_intensities e hourly_steps para consolidar métricas relevantes como calorias consumidas, intensidade total, intensidade média e contagem de passos numa estrutura unificada.

Uma vez que as tabelas têm Id, date_new e time_new em comum, foi utilizada a Inner Join para facilitar a análise de dados e a elaboração de relatórios.

#### Exploração de dados

Antes de limpar os dados, um dos primeiros passos que dei foi familiarizar-me com a estrutura da tabela e os seus dados para identificar potenciais inconsistências.

Durante a avaliação inicial dos dados, verificou-se que apenas a tabela sleep_data continha registos de 24 utilizadoras distintas, enquanto todas as outras tabelas incluíam consistentemente dados de 33 consumidoras. Esta discrepância na representação dos participantes em todos os conjuntos de dados pode introduzir preconceitos ou limitações ao analisar as relações entre as métricas do sono e outras variáveis de atividade (por exemplo, passos, calorias). 

Uma revisão completa das seis tabelas confirmou a ausência de valores nulos e registros duplicados, indicando alta integridade e qualidade dos dados.

### 4. Analisar

A questão da análise é:

Como é que estas tendências podem ajudar a influenciar a estratégia de marketing da Bellabeat?

Para otimizar a análise e garantir consistência, as tabelas de dados - que monitoram métricas de fitness como passos, calorias, distância, sono e atividade - serão categorizadas por intervalos de tempo (diários ou horários). Como todas as tabelas compartilham a coluna 'Id' como identificador comum, esse agrupamento facilita a identificação de padrões e a extração de conclusões. Essa organização torna a análise mais estruturada e gerenciáve.

![Gráfico circular Tempo despendido num dia](https://github.com/JulianaAzevedo9/BellaBeat-Estudo-De-Caso/blob/main/Tempo%20Gasto%20em%20Dia%20-%20Pie%20Chart.png)

Principais informações:

* Predomina o tempo sedentário (73,29%)
* A atividade leve é modesta (22,29%)
* Atividade Intensa é Muito Baixa (2,58% muito ativo, 1,84% razoavelmente ativo)

![Distância total e calorias médias queimadas por dia da semana](https://github.com/JulianaAzevedo9/BellaBeat-Estudo-De-Caso/blob/main/Total%20distancia%20e%20calorias%20gastas%20por%20semana%20-%20Column%20Chart.png)

Principais pontos:

* Pico de Distância: Terça-feira, às 17:73, registrou a maior distância total (45,74% superior ao domingo, que teve o menor registro: 1.216,58).
* Correlação Direta: Distância total e calorias totais apresentam relação positiva (quanto maior a distância, maior o gasto calórico).
* Representatividade: Terça-feira concentrou 17,18% do total de distâncias semanais.
* Divergência Notável: Na terça-feira, o total de calorias (714.455) superou significativamente a distância total, indicando maior intensidade de atividade nesse dia.

![Distância média e calorias médias queimadas por dia da semana](https://github.com/JulianaAzevedo9/BellaBeat-Estudo-De-Caso/blob/main/Media%20da%20distancia%20e%20de%20calorias%20gastas%20por%20semana.png)

principais pontos:

* Pico de Desempenho: O sábado registrou a maior distância média (5,85), superando o domingo em 16,46% (este com a menor média: 5,03).
* Relação Consistente: Distância média e calorias médias queimadas apresentam correlação positiva – aumentam proporcionalmente.
* Destaque Semanal: Os percursos de sábado representaram 15,26% da distância média total semanal.
* Anomalia na Terça-feira: Neste dia, observou-se a maior divergência entre métricas Calorias queimadas (2.350,18 a mais que a distância média) e sugere maior intensidade de atividades comparado a outros dias.

![Tabela](https://github.com/JulianaAzevedo9/BellaBeat-Estudo-De-Caso/blob/main/Tabela.png)
![Scarter plot 3 together](https://github.com/JulianaAzevedo9/BellaBeat-Estudo-De-Caso/blob/main/3%20Scatter%20plot%20intensidade%20de%20atividades%20vc%20calorias%20gastas.png)

Principais pontos:

* Minutos Pouco Ativos (R² = 0,0118): Correlação mínima com gasto calórico.
* Minutos Moderadamente Ativos (R² = 0,0391): Relação ligeiramente mais forte, mas ainda fraca.
* Minutos Muito Ativos (R² = 0,3865): Demonstra uma correlação significativamente mais forte, indicando que atividades de alta intensidade têm um impacto relevante na queima de calorias.

À medida que a intensidade e a duração da atividade aumentam, os valores de R² sobem, revelando um padrão claro: exercícios mais vigorosos e prolongados resultam em um maior gasto calórico. Isso sugere que treinos de alta intensidade são muito mais eficazes para queimar calorias em comparação com atividades leves ou moderadas.

![gráfico de colunas calorias queimadas vc hora do dia](https://github.com/JulianaAzevedo9/BellaBeat-Estudo-De-Caso/blob/main/Total%20Calorias%20Gastas%20por%20Hora.png)

Principais pontos:

* Os dados sugerem uma forte ligação entre a intensidade da atividade e as calorias queimadas, sendo provável que os movimentos de maior intensidade contribuam significativamente para o gasto de energia.
* Além disso, o gráfico indica que os picos de atividade ocorrem entre 7h e 20h, alinhando-se com o período diurno em que os usuários estão mais ativos fisicamente.
  
![gráficos de tabelas](https://github.com/JulianaAzevedo9/BellaBeat-Estudo-De-Caso/blob/main/Tabela%20Comparacoes%20de%20tempo%20de%20sono.png)
![gráfico mais assustador](https://github.com/JulianaAzevedo9/BellaBeat-Estudo-De-Caso/blob/main/Total%20Sono%20vs%20calorias%20gastas%20e%20tabela.png)

Principais pontos:

* Forte Correlação Positiva (R² = 0,8727): Há uma relação significativa entre duração do sono e calorias queimadas, indicando que sono mais longo e de qualidade está associado a um maior gasto calórico.
* Não Linearidade: A relação não é linear indefinidamente – ultrapassar a duração ideal de sono não aumenta a queima de calorias e pode até reduzi-la. Isso sugere que, embora o sono adequado favoreça o metabolismo, o excesso pode ter retornos decrescentes ou até impactos negativos no gasto energético.

![tabela e gráfico de escarificação](https://github.com/JulianaAzevedo9/BellaBeat-Estudo-De-Caso/blob/main/Tabela%20vs%20mets%20vc%20calorias%20gastas.png)

Principais pontos:

* O valor R-quadrado é de 0,5504 
* Indicando uma forte correlação positiva entre os MET e as calorias médias queimadas.

s dados demonstram que os valores MET diários exercem influência significativa no número de calorias queimadas pelos usuários, conforme comprovado por um alto coeficiente de determinação (R²), que indica forte correlação entre a linha de tendência e os pontos do conjunto de dados. Essa relação destaca o papel crítico da intensidade das atividades (medida em MET) no gasto energético individual.

### 5. Partilhar

Após processar os conjuntos de dados por meio de coleta, transformação, limpeza, organização e análise, obtivemos evidências factuais suficientes para responder às questões de negócios inicialmente propostas.

Os resultados indicam que tanto a duração como a intensidade das actividades físicas influenciam significativamente o gasto de calorias. Os METs (Metabolic Equivalent of Task) oferecem informações valiosas sobre a intensidade da atividade e as calorias queimadas por minuto. Embora a maioria das consumidoras tenha um sono adequado , uma pequena parte dorme demais ou de menos. Além disso, as utilizadoras tendem a praticar actividades de baixa a alta intensidade, principalmente entre as 7:00 e as 20:00 horas do dia.

### 6. Atuar

Recomendações fundamentais para os estrategas de marketing:

1.Promover o Acompanhamento MET como Destaque
Utilize o rastreamento MET (Equivalente Metabólico da Tarefa) em campanhas de marketing para educar os usuários sobre como essa métrica mede a intensidade das atividades e fornece insights em tempo real sobre a queima calórica. Isso ajudará os usuários a otimizar seus treinos e manter a motivação.
2. Incentivar Atividade nos Horários de Pico
Como os dados mostram maior atividade entre 7h e 20h, os dispositivos podem enviar lembretes inteligentes nesses períodos para estimular movimento, combatendo o sedentarismo e promovendo um estilo de vida mais ativo.
3. Aprimorar o Monitoramento do Sono e Notificações
Implemente alertas inteligentes para incentivar um sono consistente e de qualidade. Adicione métricas avançadas, como monitoramento REM (Movimento Rápido dos Olhos), para oferecer análises mais profundas e melhorar os hábitos de sono dos usuários.
4. Desafios de Calorias com Elementos de Gamificação
Aumente o engajamento com desafios diários/semanais de queima calórica e um sistema de recompensas. Os melhores desempenhos podem ganhar pontos resgatáveis (ex.: descontos em compras futuras), promovendo fidelização e motivação contínua.

Ao incorporar estas estratégias, a empresa pode promover a participação das consumidoras, melhorar os resultados em termos de saúde e desbloquear novas oportunidades de crescimento.

## 🔮 Conclusão
Essa análise oferece informações importantes sobre os diferentes comportamentos e preferências dos usuários do BellaBeat. Ao adaptar as estratégias a essas diferenças, a empresa pode incentivar de forma mais eficaz os utilizadores casuais a tornarem-se membros potenciais.


        
