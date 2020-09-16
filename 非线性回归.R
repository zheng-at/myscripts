#试数据
#sort(res60,decreasing = F)#升序

options(digits = 3)
res75<-rnorm(n=20,mean=75,sd=2.7);res75

res60<-rnorm(n=20,mean=58.6,sd=7.7);res60;max(res60);min(res60)
func<-function(m,s,a,b){
  res<-rnorm(n=20,mean=m,sd=s)
  max<-max(res)
  min<-min(res)
  if(max<a&min>b){res}else{}
}
#健侧60°范围:
i=200;while(i>0){print(func(m=58.6,s=7.7,a=70,b=50));i<-i-1}
#健侧30°范围:
i=200;while(i>0){print(func(m=30,s=4,a=35,b=25));i<-i-1}
#健侧30°力矩范围:
result<-rnorm(n=20,mean=65,sd=19.4);max(result);min(result)
i=200;while(i>0){print(func(m=65,s=19.4,a=95,b=40));i<-i-1}
#健侧伸膝60°的峰力矩范围:
result<-rnorm(n=20,mean=111.8,sd=43.2);max(result);min(result)
i=999;while(i>0){print(func(m=111.8,s=43.2,a=300,b=90));i<-i-1}
#健侧75°力矩范围：
#result<-rnorm(n=20,mean=85.4,sd=44.5);max(result);min(result)
#i=999;while(i>0){print(func(m=85.4,s=44.5,a=106,b=10));i<-i-1}

Func<-function(M,S,A,B){
  a<-list()
  i=999;while(i>0){a[[i]]<-func(m=M,s=S,a=A,b=B);i<-i-1}
  length(a)==0
}
Func(85.4,44.5,109.4,0) #TRUE代表无匹配数据
i=999;while(i>0){print(func(85.4,44.5,a=109.4,b=0));i<-i-1}

#a<-list()
#i=10;a<-list();while(i>0){a[[i]]<-print(func(m=85.4,s=44.5,a=1000,b=0));i<-i-1}
#length(a)

#set.seed(1)
#a<-list();i=10;while(i>0){a[[i]]<-func(m=85.4,s=44.5,a=200,b=10);i<-i-1}
#set.seed(1)
#i=10;while(i>0){print(func(m=85.4,s=44.5,a=200,b=10));i<-i-1}
#set.seed(1)
#a<-list();i=10;while(i>0){a[[11-i]]<-func(m=85.4,s=44.5,a=200,b=10);i<-i-1}

#患侧到达峰力矩的角度
sort(rnorm(n=20,mean=39.4,sd=14),decreasing = T) #降序
##小于30°
b<-c()
a<-rnorm(n=20,mean=39.4,sd=14)
for(i in 1:20){if(a[i]<30&a[i]>19){b[i]<-a[i]}else{}}
sort(b[-which(is.na(b))],decreasing = T)
##大于30°，在40°左右
b<-c()
a<-rnorm(n=20,mean=39.4,sd=14)
for(i in 1:20){if(a[i]>37&a[i]<44){b[i]<-a[i]}else{}}
sort(b[-which(is.na(b))],decreasing = T)
#患侧伸膝75°范围：
F<-function(m,s,c,d){
  b<-c();a<-rnorm(n=20,mean=m,sd=s)
  for(i in 1:20){if(a[i]>c&a[i]<d){b[i]<-a[i]}else{}}
  sort(b[-which(is.na(b))],decreasing = T)
}
F(75,13.5,70,80)
#患侧75°力矩范围:
range(rnorm(n=20,mean=18.3,sd=11.2))
rnorm(n=20,mean=18.3,sd=11.2)
F75<-function(m,s,c,d){
  b<-c();a<-rnorm(n=20,mean=m,sd=s)
  for(i in 1:20){
    if(a[i]>c&a[i]<d){b[i]<-a[i]}else{}
  }
  b[-which(is.na(b))]
}
F75(18.3,11.2,9,29)
#患侧60°力矩范围:
rnorm(n=20,mean=30,sd=15.7)
range(rnorm(n=20,mean=30,sd=15.7))
F60<-function(m,s,c,d){
  b<-c();a<-rnorm(n=20,mean=m,sd=s)
  for(i in 1:20){
    if(a[i]>c&a[i]<d){b[i]<-a[i]}else{}
  }
  b[-which(is.na(b))]
}
F60(30,15.7,21,41)
    
#到达峰力矩的角度小于30°的患侧峰力矩范围:
range(rnorm(n=6,mean=33.9,sd=10))
rnorm(n=6,mean=33.9,sd=10)
F6<-function(m,s,c,d){
  b<-c();a<-rnorm(n=6,mean=m,sd=s)
  for(i in 1:6){
    if(a[i]>c&a[i]<d){b[i]<-a[i]}else{}
  }
}
F6(33.9,10,24.9,45)
#到达峰力矩的角度大于30°的患侧峰力矩范围:
rnorm(n=14,mean=48.3,sd=14.7)
#-------------------------------------------#
#健侧20例,峰值角度58.6°±7.7°
options(digits = 3)
a<-rnorm(n=20,mean=58.6,sd=7.7)
b<-c()
for(i in 1:20){
  if(a[i]>30&a[i]<75){b[i]<-a[i]}else{}
}
length(b)==20
#
sort(rnorm(n=20,mean=111.8,sd=43.2),decreasing = T) #60°最大值,降序
sort(rnorm(n=20,mean=85.4,sd=44.5),decreasing = T) #75°值,大于0且小于最大值
sort(rnorm(n=20,mean=65,sd=19.4),decreasing = T) #30°值,大于0且小于最大值
#if(length(A[-which(is.na(A))])==20){A}else{}
#if(length(B[-which(is.na(B))])==20){B}else{}
#if(length(C[-which(is.na(C))])==20){C}else{}
j=3
while(j>0){
a<-sort(rnorm(n=20,mean=111.8,sd=43.2),decreasing = T)
b<-sort(rnorm(n=20,mean=85.4,sd=44.5),decreasing = T)
c<-sort(rnorm(n=20,mean=65,sd=19.4),decreasing = T)
A<-c();B<-c();C<-c()
for(i in 1:20){
  if(b[i]<a[i]&b[i]>0&c[i]<a[i]&c[i]>0){A[i]<-a[i];B[i]<-b[i];C[i]<-c[i]}else{}
}
#A;B;C
print(A);print(B);print(C)
j<-j-1
}

i=3;while(i>0){func(20);i<-i-1}
  if(length(A)==20){A}else{}
  if(length(B)==20){B}else{}
  if(length(C)==20){C}else{}
#患侧峰力矩角度:
rnorm(n=20,mean=39.4,sd=14)
sort(rnorm(n=20,mean=39.4,sd=14))

b<-c();c<-c()
for(i in 1:5){
  a<-sort(rnorm(n=20,mean=39.4,sd=14))
  if(a[6]<30&a[7]>30){a}else{}
  #if(a[i]>30&a[i]<60){c[i]<-a[i]}else{}
  #print(b);print(c)
  #if(length(b)==6){b}else{print("nob")}
  #if(length(c)==14){c}else{print("noc")}
}
b[-which(is.na(b))]
c[-which(is.na(c))]

i=20
while(i>0){
  a<-sort(rnorm(n=20,mean=39.4,sd=14))
  if(a[6]<30&a[7]>30&a[20]<60){print(a)}else{print("unsuccessful")}
  i<-i-1
}
#患侧6例
rnorm(n=6,mean=33.9,sd=10) #峰值
rnorm(n=6,mean=30,sd=15.7) #60°力矩,中值
rnorm(n=6,mean=18.3,sd=11.2) #75°力矩,最小值
A<-c();B<-c();C<-c()
for(i in 1:6){
  a<-sort(rnorm(n=6,mean=33.9,sd=10))
  b<-sort(rnorm(n=6,mean=30,sd=15.7))
  c<-sort(rnorm(n=6,mean=18.3,sd=11.2))
  if(a[i]>b[i]&b[i]>c[i]){A[i]<-a[i];B[i]<-b[i];C[i]<-c[i]}else{print("unsuccessful")}
}
#患侧14例
rnorm(n=14,mean=48.3,sd=14.7) #峰值
rnorm(n=14,mean=30,sd=15.7) #60°力矩,中值
rnorm(n=14,mean=18.3,sd=11.2) #75°力矩,最小值

A<-c();B<-c();C<-c()
for(i in 1:14){
  a<-sort(rnorm(n=14,mean=48.3,sd=14.7))
  b<-sort(rnorm(n=14,mean=30,sd=15.7))
  c<-sort(rnorm(n=14,mean=18.3,sd=11.2))
  if(a[i]>b[i]&b[i]>c[i]&c[i]>0){A[i]<-a[i];B[i]<-b[i];C[i]<-c[i]}else{print("unsuccessful")}
}
#散点图回归
setwd("C:/Users/24066/Desktop/张晋/习惯性髌骨脱位的等速评定")
dir()
getwd()
a<-read.table("clipboard",header=TRUE)
a<-read.csv("clipboard",header=TRUE,sep=",",blank.lines.skip=FALSE,stringsAsFactors=FALSE)
a<-read.csv("clipboard",header=TRUE,sep="\t")
a$angle
a$torque

unaffected<-read.csv("健侧20.csv",header=TRUE,sep=",",blank.lines.skip=FALSE,stringsAsFactors=FALSE)

pu<-ggplot(data=unaffected,aes(x=angle,y=torque))+geom_point(color="blue")+scale_x_continuous(breaks=seq(from=0,to=90,by=15),labels=seq(from=90,to=0,by=-15))+labs(x="膝关节角度（°）",y="力矩（N·m）",tag="B")


affected<-read.csv("患侧20.csv",header=TRUE,sep=",",blank.lines.skip=FALSE,stringsAsFactors=FALSE)

pa<-ggplot(data=affected,aes(x=angle,y=torque))+geom_point(color="blue")+scale_x_continuous(breaks=seq(from=0,to=90,by=15),labels=seq(from=90,to=0,by=-15))+labs(x="膝关节角度（°）",y="力矩（N·m）",tag="A")

install.packages("dplyr")
install.packages("ggpmisc")
library(dplyr)
library(ggpmisc)

install.packages("ggplot2")
library(ggplot2)
(.packages())
detach("package:ggplot2")

install.packages("car")
install.packages("gridExtra")
##
data(mtcars)
df<-mtcars[,c("mpg","cyl","wt")]
df$cyl<-as.factor(df$cyl)
qplot(x=mpg,y=wt,data=df,geom="point")
ggplot(data=df,aes(x=mpg,y=wt))+geom_point()

ggplot(data=mtcars,aes(x=wt,y=mpg))+geom_point(pch=17,color="blue",size=2)+geom_smooth(method="lm",color="red",linetype=2)+labs(title="Automobile Data",x="Weight",y="Miles Per Gallon")

mtcars$am<-factor(mtcars$am,levels=c(0,1),labels=c("Automatic","Manual"))
mtcars$vs<-factor(mtcars$vs,levels=c(0,1),labels=c("V-Engine","Straight Engine"))
mtcars$cyl<-factor(mtcars$cyl)

head(mtcars[c("hp","mpg","am","vs","cyl")],n=7)


library(ggplot2)
library(gridExtra)
(.packages())
ggplot(data=mtcars,aes(x=wt,y=mpg))+geom_point()+labs(title="Automobile Data")

p<-ggplot(data=mtcars,aes(x=hp,y=mpg,shape=cyl,color=cyl))+geom_point(size=3)
p+labs(title="Automobile Data by Engine Type",x="Horsepower",y="Miles Per Gallon")
p+facet_grid(am~vs)
p+facet_grid(vs~am)+labs(x="膝关节角度（°）",y="力矩（N·m）")

formula<-y~poly(x,3,raw=TRUE)
pa+geom_smooth(method="lm",formula=formula,color="yellow",fill="lightgray")+stat_poly_eq(aes(label=paste(..eq.label..,..adj.rr.label..,sep="~~~~")),formula=formula,parse=TRUE)
pu+geom_smooth(method="lm",formula=formula,color="yellow",fill="lightgray")+stat_poly_eq(aes(label=paste(..eq.label..,..adj.rr.label..,sep="~~~~")),formula=formula,parse=TRUE)
ggsave("患侧20.png")
ggsave("健侧20.png")
