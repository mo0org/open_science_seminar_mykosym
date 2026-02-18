install.packages("here")

#uploading a .csv dataset
data<-read.csv(here::here("data/raw_data/raw_data_1.csv"),sep=";",dec=",")

#creating a subset
subset<-data[1:3,2:3]

#creating a dataset saved as .csv from the subset
write.csv(subset,here::here("data/clean_data/subset_1.csv"))

#creating a graph and saving it to outputs
pdf(here::here("outputs/figures","plot1.pdf"))
plot(1,1)
dev.off()
