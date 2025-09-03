# LEITURA DA BASE
base <- read.csv2("titanic_data.csv")
base <- na.omit(base)

# AMOSTRA
set.seed(06062001)
base1 <- base[sample(nrow(base), 300), ]

# CLASSIFICANDO VARIÁVEIS QUALITATIVAS COMO FATORES
base1$Pclass <- as.factor(base1$Pclass)
base1$Sex <- as.factor(base1$Sex)
base1$Embarked <- as.factor(base1$Embarked)

# AJUSTE DO MODELO INICIAL APENAS COM O INTERCEPTO PARA SELEÇÃO "FORWARD"
modelo_inicial <- glm(Survived ~ 1, data = base1, family = binomial())

# SELEÇÃO DE VARIÁVEIS "FORWARD" PARA DETERMINAR O MODELO FINAL
modelo_forward <- step(modelo_inicial, direction = "forward",
                       scope = ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked)

# RESUMO DO MODELO FINAL SELECIONADO
summary(modelo_forward)

# CÁLCULO DAS RAZÕES DE CHANCES (OR) E INTERVALOS DE CONFIANÇA
OR <- exp(coef(modelo_forward))
IC <- exp(confint(modelo_forward))

# DATA FRAME PARA INTERPRETAÇÃO
IC_OR <- data.frame(Variável = names(OR), OR = OR, `2.5%` = IC[,1], `97.5%` = IC[,2])
print(IC_OR)

#######################################################
# Análise do OR:
#
# 1) SEXMALE (OR = 0.354): 
#    o valor indica que, para os homens, a chance de sobrevivência 
#    é 0.354 vezes a chance de sobrevivência das mulheres, ou seja, 
#    os homens têm menos chance de sobreviver do que as mulheres. 
#    Pelo IC estar entre 0.212 a 0.583 a relação é estatisticamente significativa.
#
# 2) FARE (OR = 1.008): 
#    o valor indica que, para cada unidade de tarifa paga, 
#    as chances de sobrevivência aumentam 1.008 vezes, ou seja, 
#    quanto mais caro foi o bilhete, maiores as chances de sobrevivência. 
#    Pelo IC estar entre 1.003 a 1.013 a relação é estatisticamente significativa.
#
# 3) EMBARKEDQ (OR = 2.152): 
#    significa que as pessoas que embarcaram em Queenstown (Q) 
#    têm 2.152 vezes mais chances de sobreviver em comparação 
#    com as pessoas que embarcaram em Southampton (S), que é a categoria de referência. 
#    Além disso, pelo IC estar 0.871 a 5.389 infere-se que esta relação 
#    não é estatisticamente significativa pois inclui o 1.
#
# 4) EMBARKEDS (OR = 2.152): 
#    significa que as pessoas que embarcaram em Southampton (S) 
#    têm 2.152 vezes mais chances de sobreviver em comparação 
#    com as pessoas da classe de referência (probabilidade de sobreviver menor). 
#    Além disso, pelo IC estar entre 0.400 a 1.398 infere-se que esta relação 
#    não é estatisticamente significativa pois inclui o 1.
#
# 5) AGE (OR = 0.981): 
#    indica que para cada ano adicional de idade as chances de sobrevivência 
#    diminuem em cerca de 0.981 vezes. 
#    Pelo IC estar entre 0.964 a 0.998 a relação é estatisticamente significativa. 
#    Sendo assim, à medida que a idade aumenta, a chance de sobrevivência 
#    diminui ligeiramente, sendo uma relação significativa e inversamente proporcional.
#######################################################