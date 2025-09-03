# Carregar os dados
base = read.csv2("car_base.csv")

# Filtrar para remover carros com tração "4wd"
base1 = base[base$drivewheel != "4wd", ]

# Selecionar amostra de 120 carros
set.seed(06062001) # COLOQUE O SEU DIA MÊS E ANO DE NASCIMENTO NA SET.SEED
base1 = base1[sample(nrow(base1), 120),]

# Converter a variável 'drivewheel' para qualitativa
base1$drivewheel = as.factor(base1$drivewheel)

# Ajustar o modelo com interação
modelo_interacao = lm(price ~ carwidth*drivewheel, data=base1)
summary(modelo_interacao)

# Modelo sem interação
modelo_sem_interacao <- lm(price ~ carwidth+drivewheel, data=base1)
summary(modelo_sem_interacao)

# Conclusão (Interpretação dos Coeficientes):
# Os coeficientes representam o efeito médio de cada variável no preço do carro. 
# A variável 'carwidth' indica o aumento esperado no preço para cada polegada adicional na largura do carro. 
# Para as variáveis categóricas (drivewheel), o coeficiente mostra a diferença no preço em relação à categoria de referência.

# Gráfico para representar a interação no modelo
library(ggplot2)

ggplot(base1, aes(x=carwidth, y=price, color=drivewheel)) +
  geom_point() +
  geom_smooth(method="lm", se=FALSE) +
  labs(title="Interação entre largura do carro e tipo de tração")

# Intervalo de confiança e um intervalo de predição carro 70 pol
novo_carro <- data.frame(carwidth=70, drivewheel="fwd")

# Intervalo de confiança
predict(modelo_sem_interacao, novo_carro, interval="confidence", level=0.95)

# Intervalo de predição
predict(modelo_sem_interacao, novo_carro, interval="predict", level=0.95)

# Conclusão (Diferença entre Intervalo de Confiança e Intervalo de Predição):
# O intervalo de confiança refere-se à estimativa da média esperada do preço 
# para carros com essas características. 
# Já o intervalo de predição reflete a faixa de valores para o preço de um carro específico 
# com essas características, incluindo a variação de erros individuais.
