# Carregar os dados
base <- read.csv2("selecao.csv")

# Amostra de 1.000 observações
set.seed(06062001)
base1 <- base[sample(nrow(base), 1000),]

# Variavel qualitativa
base1$x10 = as.factor(base1$x10)

# Definir o modelo inicial apenas com o intercepto
modelo_inicial <- lm(y ~ 1, data = base1)

# Seleção de variáveis “forward”
modelo_forward <- step(modelo_inicial, direction = "forward", scope = formula(lm(y ~ ., data = base1)))

# Plotando os resíduos padronizados
plot(fitted(modelo_forward), rstandard(modelo_forward), main = "Análise de Resíduos",
xlab = "Valores Ajustados",
ylab = "Resíduos Padronizados")
abline(h = 0, col = "red")

# Gráficos de dispersão individuais
par(mfrow=c(2,5))
for (var in names(base1)[names(base1) != "y"]) {
plot(base1[[var]], base1$y, main=var, xlab=var, ylab="y") }

# Incluindo termo polinomial nas variaveis
modelo_forward <- lm(y ~ x5 + I(x5^2) + x6 + I(x6^2) + x7 + I(x7^2) + x8 + I(x8^2) + x9 + I(x9^2), data=base1)
summary(modelo_forward)

# Plotando os resíduos
par(mfrow=c(1,1))
plot(fitted(modelo_forward), rstandard(modelo_forward),
     main = "Análise de Resíduos - NOVO",
     xlab = "Valores Ajustados",
     ylab = "Resíduos Padronizados")
abline(h = 0, col = "red")
