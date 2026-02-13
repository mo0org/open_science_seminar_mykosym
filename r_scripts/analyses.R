henry_data<-read.csv(here::here("data/raw_data/data_henry.csv"),sep=";",dec=",")
henry_data<-dplyr::mutate(henry_data,biomass=henry_data$root+henry_data$shoot+henry_data$ramet)
pca2<-vegan::rda(henry_data[,7])
henry_data$inok<-as.factor(henry_data$inok)
henry_data$stress<-as.factor(henry_data$stress)
pca<-vegan::rda(henry_data[,4:6])

plot(pca,type="n")
colors_inok<-rainbow(length(levels(henry_data$inok)))
points_type_stress<-c(0,15,17,19,21)[1:length(levels(henry_data$stress))]
points(pca,disp="sites",pch=points_type_stress[henry_data$stress],col=colors_inok[henry_data$inok])
arrows(0,0,vegan::scores(pca)$species[,1],vegan::scores(pca)$species[,2],lwd=2,length=0.15)
text(pca,display="sp",cex=1.5)
legend("topright",legend=levels(henry_data$stress),col="black",pch=points_type_stress,cex=0.5)
legend("bottomright",legend=levels(henry_data$inok),col=colors_inok,pch=19,cex=0.5)

screeplot(pca)
summary(pca)




