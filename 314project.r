library(ggplot2)
library(plyr)
library(dplyr)


mdata = read.csv(file.choose())
attach(mdata)
View(mdata)
mdata[mdata==0] <- NA

budg = c(mdata$budget)
avg_budg = mean(budg, na.rm = TRUE)
avg_budg
sd_budg = sd(budg, na.rm = TRUE)
sd_budg

pop = c(mdata$popularity)
max_pop = max(pop)
avg_pop = mean(pop)
sd_pop = sd(pop)

rev = c(mdata$revenue)
max_rev = max(rev, na.rm = TRUE)
avg_rev = mean(rev, na.rm = TRUE)
sd_rev = sd(rev, na.rm=TRUE)



time = c(mdata$runtime)
max_time = max(time, na.rm = TRUE)
avg_time = mean(time, na.rm=TRUE)
sd_time = sd(time, na.rm=TRUE)

vcnt = c(mdata$vote_count)
avg_vcnt = mean(vcnt, na.rm=TRUE)
sd_vcnt = sd(vcnt, na.rm=TRUE)
avg_vcnt
sd_vcnt

av = c(mdata$vote_average)
max_av = max(av, na.rm=TRUE)
avg_av = mean(av, na.rm=TRUE)
sd_av = sd(av, na.rm=TRUE)


bud_nozero = filter(mdata, budget>0)
b = bud_nozero$budget
b_hist = ggplot(data=mdata,aes(x=budget), binwidth = 25)+
  geom_histogram(aes(y=..count..))
b_hist

time_curve = ggplot(data=mdata,aes(x=time), binwidth = 25)+
  geom_density(aes(y=..density..))
time_curve

t1 = ggplot(data=mdata, aes(x=time))+
  stat_function(fun=dnorm, n =5000, args=list(mean=107.66, sd=20.75))+ylab("")+
  scale_y_continuous(breaks=NULL)
t1

pop_nonzero = select(mdata, title, popularity)
pop_nonzero
pop_sort = pop_nonzero[order(popularity, decreasing=TRUE),]
pop_5 = head(pop_sort, 5)
View(pop_5)
pop5_plot = barplot(pop_5$popularity, main="Popularity",
                    names.arg = c("Minions", "Interstellar", "Deadpool", 
                                  "Guardians", "Mad Max"), 
                    xlab = "Most Popular 5")

                    