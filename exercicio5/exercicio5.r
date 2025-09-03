library(tidyverse)
library(forecast)

# Carregar a base de dados
base <- read.csv2("ipca.csv")

# Separar os dados de análise e de validação
dados_analise <- base[1:341, ] # até dezembro/2022
dados_validacao <- base[342:350, ] # de janeiro a setembro/2023

# Transformar a coluna com o índice IPCA em série temporal
ipca_ts <- ts(dados_analise$IPCA, frequency = 12, start = c(1994, 1))

# Ajuste dos modelos
ses_model <- ses(ipca_ts) # suavização exponencial simples
holt_model <- holt(ipca_ts) # holt
holt_winter_model <- hw(ipca_ts, seasonal = "additive") # holt Winter aditivo

# Calcular a acurácia dos modelos
modelos <- list(Simples = ses_model, Holt = holt_model, HoltWinter = holt_winter_model)
resultados <- map(modelos, accuracy)

# Exibir os resultados
resultados_df <- bind_rows(resultados, .id = "Modelo")
print(resultados_df)

#######################################################
# Conclusão:
#
# c) O modelo que melhor se ajustou aos dados foi o HOLT, 
#    visto que o ME dele é o mais próximo de zero. 
#    Utiliza-se essa medida pois as outras métricas não foram conclusivas 
#    para a decisão.
#######################################################

# Ajustando o modelo holt
holt_model <- holt(ipca_ts)

# Previsão para os próximos 9 períodos (janeiro a setembro de 2023)
previsao <- forecast(holt_model, h = 9)

# Combinar com os dados reais
dados_validacao$Previsao <- as.numeric(previsao$mean)
dados_validacao$LI <- as.numeric(previsao$lower[, 2]) # limite inferior 95%
dados_validacao$LS <- as.numeric(previsao$upper[, 2]) # limite superior 95%

# Comparar previsões com dados reais
print(dados_validacao)

# Visualização gráfica
library(ggplot2)

ggplot(dados_validacao, aes(x = 1:9)) +
  geom_line(aes(y = IPCA, color = "Real")) +
  geom_line(aes(y = Previsao, color = "Previsão")) +
  geom_ribbon(aes(ymin = LI, ymax = LS), fill = "red", alpha = 0.2) +
  labs(x = "Período", y = "IPCA", title = "Comparação entre valores reais e previsão (Modelo Holt)") +
  scale_color_manual(values = c("Real" = "black", "Previsão" = "red")) +
  theme_minimal()

# Calcular erro absoluto médio (MAE) para a previsão
mae_previsao <- mean(abs(dados_validacao$IPCA - dados_validacao$Previsao))

cat("Erro Absoluto Médio (MAE) da previsão:", mae_previsao)
## Erro Absoluto Médio (MAE) da previsão: 0.2683731
