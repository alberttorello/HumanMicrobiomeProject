#======================================================================
# Microbioma Bucal. Code script
#======================================================================

#------------------------------
# STEP 1. Loading required packages
#------------------------------

library(xlsx)
library(tidyr)
library(dplyr)
library(xtable)

#------------------------------
# STEP 2. Reading datasets
#------------------------------
Cataluna <- read.xlsx("Cataluna.xlsx", sheetIndex = 1, header = TRUE)
datos <- read.xlsx("datos.xlsx", sheetIndex = 1, header = TRUE)

#------------------------------
# STEP 3. Tyding datasets
#------------------------------
names(datos) <- c("Fumador", "Fumador.pas", "ID")
Cataluna <- as.matrix(Cataluna)
Cataluna <- t(Cataluna)
Cataluna <- as.data.frame(Cataluna, row.names = NULL, header = TRUE)
write.csv(x = Cataluna, file = "Cataluna.csv")
Cataluna <- read.csv("Cataluna.csv", header = TRUE, skip = 1)

Cataluna1 <- separate(Cataluna, Idmostra, c("CA", "ID"), 8)
datos1 <- separate(data = datos, col = ID, into = c("CodiLL", "Codi1", "ID"), sep = "-")

def <- merge(Cataluna1, datos1, by = 0, all = TRUE)

def1 <- subset(def, CA == "Cataluna")

spec <- mutate(def1, suma = rowSums(def1[4:355], na.rm = TRUE))
spec2 <- select(spec, ID.x, suma, Fumador, Fumador.pas)

# n fumadors
sum(spec$Fumador %in% "a. S?")

#n no fumadors
sum(spec$Fumador %in% "b. No")

# n fumadors passius
sum(spec$Fumador.pas %in% "a. S?, otros")

#n fumadors no passius
sum(spec$Fumador.pas %in% "e. No")

# ANOVA Fumadors per c?rrega bacteriana
summary(aov(suma~Fumador, data = spec))

# ANOVA fumadors passius per c?rrega bacteriana
summary(aov(suma~Fumador, data = spec))