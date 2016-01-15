#----------------------------------------
# GrapheR - session of 2016.01.15
#----------------------------------------
#------------------------------
# GRAPH 1: Bar plot
#------------------------------

# Loading of the dataset
par(mfrow = c(2, 1))
dataset <- spec2
attach(dataset)

# Preliminary data creation

means <- tapply(suma,Fumador,function(x) mean(x,na.rm=TRUE))

std.err <- tapply(suma,Fumador,function(x) sd(x,na.rm=TRUE)/sqrt(length(na.omit(x))))

# Graph

graph <- barplot(means, axes=FALSE, ann=FALSE, col="grey",
  ylim=c(0,57068.4), names=c("a. Sí","b. No","c. No sabe/No contesta"), xpd=FALSE)

abline(h=0)
axis(2)

# Error bars

arrows(graph, means - std.err, graph, means + std.err, code=3, angle=90, length=0.1)

detach(dataset)

#------------------------------
# GRAPH 2: Bar plot
#------------------------------

# Loading of the dataset

dataset <- spec2
attach(dataset)

# Preliminary data creation

means <- tapply(suma,Fumador.pas,function(x) mean(x,na.rm=TRUE))

std.err <- tapply(suma,Fumador.pas,function(x) sd(x,na.rm=TRUE)/sqrt(length(na.omit(x))))

# Graph

graph <- barplot(means, axes=FALSE, ann=FALSE, col="grey",
                 ylim=c(0,57068.4), names = c("a. Sí, yo", "b. Sí, otros", "c. Sí, yo y otros", "d. No", "e. NS/NC"), xpd=FALSE)

abline(h=0)
axis(2)

# Error bars

arrows(graph, means - std.err, graph, means + std.err, code=3, angle=90, length=0.1)

detach(dataset)