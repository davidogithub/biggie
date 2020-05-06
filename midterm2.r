install.packages('rstatix')
library(rstatix)
library(ggplot2)
View(midwest)
pilot = midwest


#INST314 Midterm 2 r code portion
#Number 5

b1 = c(45, 38, 52, 47, 45, 42, 43)
b2 = c(39, 44, 50, 54, 48, 46, 40)
b3 = c(50, 46, 43, 48, 57, 33, 48)

df = data.frame(cbind(b1, b2, b3))
stacked = stack(df)
stacked
ans5 = aov(values ~ ind, data = stacked)
summary(ans5)

#Number 9 
sj1 = c(8,22,24,34)
sj2 = c(14,22,20,32)
sj3= c(4,10,17,29)
sj4 = c(11,9,11,21)
sj5 = c(8,12,13,19)
df_9 = data.frame(sj1, sj2, sj3, sj4, sj5)
df_9
df_9=stack(df_9)
df_9$group = c(1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4)
res.aov <- anova_test(data=df_9, dv = values, wid = ind, within = group)
get_anova_table(res.aov)


#Number 10
aa = c(65,70,60,60,50,55,80,65,50,55,80,65,70,75,75,65)
bb = c(70,65,60,70,65,60,60,50,45,60,85,65,70,70,80,60)
cc = c(55,65,70,55,55,60,50,50,35,40,35,55,35,40,45,40)
df_10 = data.frame(aa, bb, cc)
df_10 = stack(df_10, select=c(aa,bb,cc))
df_10$met = c(1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2)
res.aov2 = aov(values ~ ind + met, data = df_10)
summary(res.aov2)


#Number 11
dir = c(1,2,4.5,11,3,4.5)
non = c(9,6,12,10,7,8)
wilcox.test(dir, non)



#Number 12
bef = c(22,15,10,21,14,3,11,8,15)
af = c(14,7,0,22,10,3,10,7,12)
wilcox.test(bef, af, paired=TRUE)


#Number 13 
groupa = c(27,2,4,18,7,9)
groupb = c(20,8,14,36,21,22)
groupc = c(34,31,3,23,30,6)
r = c(groupa, groupb, groupc)
all = c('A','A','A','A','A','A',
        'B','B','B','B','B','B',
        'C','C','C','C','C','C')
df_13 = data.frame(all, r)
df_13$Channel = ordered(df_13$all, levels = c('B','A','C'))
kruskal.test(r ~ Channel, data = df_13)
pairwise.wilcox.test(df_13$r, df_13$Channel, p.adjust.method='BH')


#Number 13
sub_o = pilot[which(pilot$state==('OH')),]
sub_m = pilot[which(pilot$state==('MI')),]
pc_o = sub_o$percollege
pc_m = sub_m$percollege
t.test(pc_m, pc_o, mu=0, alt='two.sided', paired=FALSE, conf.level = .95,
       var.equal=TRUE)

#Number 14
t.test(pilot$percollege, mu=25, alternative = 'less', conf.level = .95)
