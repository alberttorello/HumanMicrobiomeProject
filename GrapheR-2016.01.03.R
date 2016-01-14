#----------------------------------------
# GrapheR - session of 2016.01.03
#----------------------------------------

#------------------------------
# GRAPH 6: Bar plot
#------------------------------

# Loading of the dataset

dataset <- mtcars
attach(dataset)

# Preliminary data creation

means <- tapply(mpg,cyl,function(x) mean(x,na.rm=TRUE))

std.err <- tapply(mpg,cyl,function(x) sd(x,na.rm=TRUE)/sqrt(length(na.omit(x))))

# Graph

graph <- barplot(means, axes=FALSE, ann=FALSE, col="grey",
  ylim=c(0,50), names=c("4","6","8"), xpd=FALSE)

abline(h=0)
axis(2)

# Error bars

arrows(graph, means - std.err, graph, means + std.err, code=3, angle=90, length=0.1)

detach(dataset)

# Added: p-value

segments(0.7, 32.23, 3.1, 32.23)
segments(0.7, 30.27, 0.7, 32.23)
segments(3.1, 18.03, 3.1, 32.23)
text(1.9, 34.47, labels="****", cex=1)

