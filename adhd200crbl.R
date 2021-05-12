setwd("/Users/mpawlak/prj/cerebellum")
getwd()
list.files()
volbrain <- read.csv("results20210320a.csv", dec=".", sep=";", header=T)
phenotype <- read.csv("adhd200_cerebellum2021_all.csv", dec=".", sep=";", header=T)
names(volbrain)
names(phenotype)
names(phenotype)[1] <- "SubjID"
names(phenotype)[1]
total <- merge(phenotype,volbrain,by="SubjID")
#
length(phenotype$ID)
summary(total$ICV.cm3)
summary(total$Scale.factor)
#
names(total)
summary(as.factor(total$DX))
#
summary(total$ICV.cm3[total$DX==0])
summary(total$ICV.cm3[total$DX>0])
total$Cerebellum.total.cm3
summary(total$Cerebellum.total.cm3[total$DX==0])
summary(total$Cerebellum.total.cm3[total$DX>0])
t.test(total$Cerebellum.total.cm3[total$DX>0],total$Cerebellum.total.cm3[total$DX==0])
t.test(total$ICV.cm3[total$DX>0],total$ICV.cm3[total$DX==0])
t.test(total$Cerebellum.total.cm3[total$DX>0]/total$ICV.cm3[total$DX>0],total$Cerebellum.total.cm3[total$DX==0]/total$ICV.cm3[total$DX==0])
length(total$ICV.cm3[total$DX==0])
length(total$ICV.cm3[total$DX>0])
# how to divide variable with multiple numeric values into two factors
#mydata$agecat <- ifelse(mydata$age > 70, c("older"), c("younger"))
fDX <- as.factor(ifelse(total$DX > 0, c("ADHD"), c("TD")))
summary(fDX)
attach(total)
t.test(ICV.cm3~fDX)
t.test(Cerebellum.total.cm3~fDX)
names(total)
t.test(Age.x~fDX)
t.test(Age.y~fDX)
lapply( )
#
dat <- iris

# remove one level to have only two groups
dat <- subset(dat, Species != "setosa")
dat$Species <- factor(dat$Species)

# boxplots and t-tests for the 4 variables at once
for (i in 1:4) { 
  t.test(i ~ fDX)
  print(t.test(dat[, i] ~ dat$Species)) # print results of t-test
}
#
lapply(total[,2:10], function(i) {t.test(i ~ fDX)$p.value} )
#
total[,2:10]
#
## Multiple t-tests for time, age, frail between genders.
results25_110 <- lapply(total[,25:110], function(x) t.test(x ~ fDX, var.equal = TRUE, na.rm=T))
results111_300 <- lapply(total[,111:300], function(x) t.test(x ~ fDX, var.equal = TRUE, na.rm=T))


length(total[,10])
length(fDX)
names(total)

