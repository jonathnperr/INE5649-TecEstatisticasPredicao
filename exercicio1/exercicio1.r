# Leitura da base de dados
base = read.csv2("apartamento.csv")

# Amostra
set.seed(06062001)
base1 = base[sample(nrow(base), 85),]

# Variável qualitativa
base1$Local = as.factor(base1$Local)

# Modelo 1
modelo1 <- lm(Valor ~ Area + Idade + Energia + Local, data = base1)
summary(modelo1)

# Modelo 2
modelo2 <- lm(Valor ~ Area + Idade + Energia, data = base1)
summary(modelo2)

# 4 gráficos de diagnóstico
par(mfrow = c(2, 2))
plot(modelo2)

# Conclusão (Análise dos Coeficientes):
# Analisando os coeficientes que restaram no modelo (Área, Idade e Energia),
# observa-se que conforme a área do imóvel em m² aumenta, o valor do imóvel também aumenta. 
# O mesmo fato ocorre para o consumo de energia em kw. 
# Em contrapartida, conforme a idade do imóvel aumenta, seu preço diminui.

# Conclusão (Análise do Coeficiente de Determinação Ajustado - R² Ajustado):
# O R² ajustado no modelo (0,7805) indica que aproximadamente 78,05% da variação 
# no valor dos imóveis (variável dependente) pode ser explicada pelas variáveis independentes 
# Área, Idade e Energia presentes no modelo. 
# Isso sugere que o modelo de regressão ajustado tem um relativo bom poder explicativo, 
# já que uma porcentagem alta da variância total é capturada por essas variáveis.

# Conclusão (Análise dos Resíduos do Modelo):
# No primeiro gráfico (Residuals vs Fitted) é possível perceber uma distribuição aleatória dos valores, 
# o que indica a homocedasticidade e a linearidade do modelo. 
# No segundo gráfico (Q-Q) é possível perceber que os resíduos seguem uma distribuição normal, 
# necessária para a validação do modelo. 
# No terceiro gráfico (Scale-Location) verifica-se que os pontos estão distribuídos de forma horizontal e sem padrão, 
# o que é bom para o modelo. 
# No último gráfico (Residuals vs Leverage) há alguns pontos fora da linha, 
# podendo indicar algum ponto que precisa de atenção no modelo.
