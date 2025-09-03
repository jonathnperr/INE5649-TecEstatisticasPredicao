# INE5649 - Técnicas Estatísticas de Predição

## ℹ️ Sobre o Repositório
Repositório com **exercícios em R** para a disciplina **INE5649 - Técnicas Estatísticas de Predição**.  
Contém análises estatísticas preditivas, modelos de regressão, seleção de variáveis, análise de séries temporais e modelos de classificação desenvolvidos em R, de acordo com o plano de ensino da disciplina.

## 🎯 Objetivo Geral
Desenvolver habilidades para:
- Quantificar relações de causa e efeito
- Construir modelos de regressão preditivos
- Analisar a influência de variáveis independentes em sistemas computacionais
- Controlar processos onde várias variáveis se inter-relacionam
- Realizar análise de séries temporais e previsões

## 🧰 Pré-requisitos
- Instalação do **R** e de um ambiente de desenvolvimento (usado na disciplina: RStudio)  
- Pacotes R utilizados:  
  - `dplyr`, `ggplot2`, `readr` (manipulação e visualização de dados)
  - `stats`, `lmtest` (modelos lineares)
  - `MASS`, `leaps` (seleção de variáveis)
  - `forecast` (séries temporais)
  - `nnet` (regressão logística)

## 📚 Conteúdo Programático

### Módulo 1: Estudos de Correlações
- Diagramas de dispersão
- Coeficiente de correlação de Pearson

### Módulo 2: Regressão Linear Simples
- Modelo de regressão
- Método dos mínimos quadrados
- Intervalos de confiança, predição e testes de hipóteses
- Análise de resíduos e transformações
- Modelos linearizáveis

### Módulo 3: Regressão Linear Múltipla
- Modelo de regressão múltipla
- Estimação e testes sobre coeficientes
- Análise de variância
- Variáveis independentes indicadoras (0-1)
- Regressão polinomial
- Seleção de variáveis

### Módulo 4: Séries Temporais
- Componentes de série temporal
- Modelos e decomposição
- Avaliação de tendência e sazonalidade
- Previsão
- Modelos de suavização exponencial

## 📖 Exercícios Desenvolvidos

### Exercício 1 – Regressão Linear Múltipla (Apartamentos)
- Amostragem aleatória (n=85)
- Ajuste de modelo de regressão múltipla com seleção stepwise
- Interpretação de coeficientes e R² ajustado
- Análise de resíduos com 4 gráficos diagnósticos
- Variáveis: Valor, Área, Idade, Energia, Local

### Exercício 2 – Modelo com Interação (Carros)
- Filtragem de dados (exclusão de drivewheel=4wd)
- Amostragem aleatória (n=120)
- Modelo com interação entre canwidth e drivewheel
- Análise de significância da interação
- Construção de intervalos de confiança e predição
- Gráfico de interação

### Exercício 3 – Seleção de Variáveis Forward
- Amostragem aleatória (n=1000)
- Método de seleção forward para variáveis x1-x10
- Análise de resíduos e verificação de ajuste do modelo
- Aplicação de transformações se necessário

### Exercício 4 – Regressão Logística (Titanic)
- Amostragem aleatória (n=300)
- Classificação de variáveis qualitativas como fatores
- Seleção forward para modelo logístico
- Cálculo de razões de chance e intervalos de confiança
- Interpretação dos resultados

### Exercício 5 – Séries Temporais (IPCA)
- Divisão de dados (treino até dez/2022, teste jan-set/2023)
- Ajuste de modelos de suavização exponencial: Simples, Holt, Holt-Winter
- Comparação de modelos e seleção do melhor
- Previsão para períodos futuros e avaliação de eficácia

## 📖 Referências Bibliográficas

1. **DEVORE, J.L.**  
   *Probabilidade e Estatística para Engenharia e Ciências* – 2ª edição, CENGAGE Learning, 2015

2. **HYNDMAN, R.J. e ATHANASOPOULOS, G.**  
   *Forecasting: principles and practice* – 2ª edição, OTexts, 2012

3. **VIEIRA, S.**  
   *Estatística básica* – 2ª edição, Cengage Learning, 2018



## 👨‍🏫 Professor Responsável
**Professor:** Adriano Ferreti Borgatto  
**Email:** adriano.borgatto@ufsc.br  
**Código da Disciplina:** INE5649  

*Material didático para fins educacionais – UFSC Campus Florianópolis*
