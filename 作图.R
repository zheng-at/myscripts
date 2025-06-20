#
View(mtcars)

getwd()
dir(getwd())
# pdf() starts the graphics device driver for producing PDF graphics.
# 图形不显示
pdf("mygraph.pdf")
# mtcars，列（变量），行（观测），行名是汽车名
# attach(mtcars)绑定数据框mtcars
attach(mtcars)
# wt=variable valve timing；气门开关时间，调节进气（排气）量；Weight（wt，车身重量）
# mpg=mile per gallon，每加仑汽油行驶的英里数
plot(wt,mpg) # x是wt，y是mpg
abline(lm(mpg~wt)) # lm是拟合线性模型Fitting Linear Models（Y~X），abline是添加直线
title("Regression of MPG on Weight") # MPG~Weight，添加图片的上端标题
# detach()解除绑定
detach(mtcars)
# dev.off() shuts down the specified (by default the current) device.
# 将图形保存为当前工作目录的mygraph.pdf
dev.off()

# 历史->记录，产生历史记录
# dev是指graphics devices
dev.new()
dev.off()
getwd() #查询当前工作目录
setwd() #设置当前工作目录
#
dose<-c(20,30,40,45,60)
drugA<-c(16,20,27,40,60)
drugB<-c(15,18,25,31,40)
# plot()是泛型函数，输出根据绘制对象的不同而不同；type="b"同时绘制点和线
plot(dose,drugA) # x是dose，x轴标签是dose，x轴刻度值是dose的向量值，y是drugA
plot(x=dose,y=drugA,type="b") # type="b"同时绘制点和线
plot(dose,drugA,type="b",lty=2,pch=17) # lty和pch没有出现在plot帮助中，是从par来的，lty是线条类型the line type，pch是绘制点符号points character
# par=parameter（参数）
plot(dose,drugA,type="b",pch=21,bg="green",col="red") # bg是绘制点符号的背景色，大约只能和pch=21~25配合使用，col是绘制点和线段的颜色
# par()：set or query graphical parameters
# opar是保存的当前图形参数，no.readonly=TRUE表示可修改图形参数
# dev.off()恢复默认
plot(dose,drugA,type="b",col.axis="green") # col.axis是X和Y坐标轴刻度值的颜色
plot(dose,drugA,type="b",col.lab="yellow") # col.lab是X和Y坐标轴标签的颜色，即向量名的颜色
plot(dose,drugA,type="b",main="Top Title",sub="Bottom Title") # main是上端主标题，sub是下端次标题
plot(dose,drugA,type="b",main="Top Title",col.main="red",sub="Bottom Title",col.sub="green") # col.main是上端主标题颜色，col.sub是下端次标题颜色
plot(dose,drugA,type="b",fg="purple") # fg是坐标轴框的颜色

opar<-par(no.readonly = TRUE)
# lty（the line type），pch（plotting character）
# lty=2，虚线；pch=17，实心三角
par(lty=2,pch=17)
plot(x=dose,y=drugA,type="b")
# pch和lty的参数值已改变
par()$pch
par()$lty
# 重新读入保存的原图形参数
par(opar)

# lwd（the line width,defaulting to 1）是线条宽度
# cex是绘制点符号大小，默认是1，1.5表示放大到1.5倍
# col（plotting color）
# col=rgb(0,0,200,maxColorValue=255)
# R的复合语句用分号（;）分隔
install.packages("RColorBrewer")
library(RColorBrewer)
dev.new()
mycolors<-brewer.pal(n=9,name="Set1")[3:5]
barplot(rep(1,6),col=mycolors)

# 生成10阶灰度色
mygrays<-gray(1:10/10)
# labels是每个扇区slices的标签
pie(rep(1,10),labels=mygrays,col=mygrays)

# font.axis坐标轴上刻度文字字体，1=常规，2=粗体，3=斜体，4=粗斜体，5=符号字体
# 坐标轴上刻度文字即变量值
# font.lab坐标轴外标签字体，坐标轴外标签即变量名
# cex.lab坐标轴外标签大小，cex.lab=1.5（原大小1.5倍）
# main（an overall title for the plot）
# font.main标题字体；cex.main标题大小

dose<-c(20,30,40,45,60)
drugA<-c(16,20,27,40,60)
drug<-c(15,18,25,31,40)
# par():设置图形参数或者查看图形参数；realonly只读
# par(no.readonly=TRUE)返回66个可修改的参数，存储数据的对象类型，对象类型为列表
# par(no.readonly=TRUE)是原始参数列表，原始参数列表保持到opar对象，par(par(no.readonly=TRUE))将参数列表改回默认值
opar<-par(no.readonly = TRUE)
par(opar)
rainbow(10) # 生成10种连续的彩虹颜色（十六进制）


colors() # 返回所有可用颜色的名称
# 创建颜色配对，RColorBrewer很受欢迎
install.packages("RColorBrewer") # 安装RColorBrewer
library(RColorBrewer) # 加载RColorBrewer
(.packages()) # 查看加载的包
brewer.pal.info # 可用调色板列表
display.brewer.all() # 显示每个调色板的颜色

mycolors<-brewer.pal(7,"Set1") # 从Set1调色板中抽取7种十六进制颜色
rep(1,7) # 数字1重复7次
barplot(rep(1,7),col=mycolors) # 条图7条，按mycolors颜色
0:10/10 # 0到10，分别除以10，内置循环

mycolors<-rainbow(10)
pie(rep(1,10),labels=mycolors,col=mycolors) # labels是饼图的标签，col是饼块的颜色
mygrays<-gray(0:10/10) # 灰度色是0到1之间
pie(rep(1,10),labels=mygrays,col=mygrays)

plot(dose,drugA,type="b")
plot(dose,drugA,type="b",cex.axis=1.25) # cex.axis是坐标轴刻度值的大小，刻度值来源于向量值
plot(dose,drugA,type="b",cex.lab=1.25) # cex.lab是坐标轴标签的大小，标签是向量名
plot(dose,drugA,type="b",main="Top Title",cex.main=1.25) # cex.main是主标题的大小
plot(dose,drugA,type="b",sub="Bottom Title",cex.sub=1.25) # cex.sub是次标题的大小
plot(dose,drugA,type="b",font.axis=2) # font.axis是坐标轴刻度值的字体，1=常规、2=粗体、3=斜体、4=粗斜体、5=符号字体
plot(dose,drugA,type="b",font.lab=4) # font.lab是坐标轴标签的字体
plot(dose,drugA,type="b",main="Top Title",font.main=3) # font.main是主标题的字体
plot(dose,drugA,type="b",sub="Bottom Title",font.sub=2) # font.sub是次标题的字体
plot(dose,drugA,type="b",family="serif") # family是主题字体，取值：serif、sans、mono
windowsFonts() # family取值
opar<-par(no.readonly = TRUE)
dev.new()
par(pin=c(2,3)) # pin以英寸表示图形的宽和高
par(mai=c(1,.5,1,.2)) # mai比pin的优先级高，设置图形的边距（下，左，上，右）
par(opar)

plot(
  dose,drugA,type="b",
  col="red",lty=2,pch=2,lwd=2,
  main="Clinical Trials for Drug A",
  sub="This is hypothetical data",
  xlab="Dosage",ylab="Drug Response", # xlab是X轴标签，ylab是Y轴标签
  xlim=c(0,60),ylim=c(0,70) # xlim是X轴范围，ylim是Y轴范围
)
plot(dose,drugA,type="b",ann=FALSE) # ann=FALSE是关掉默认的标签
title(                              # title函数添加标题和坐标轴标签
  main="My Title",col.main="red",
  sub="My Subtitle",col.sub="blue",
  xlab="My X label",ylab="My Y label",
  col.lab="green",cex.lab=.75       # 0.75可省略0
)
plot(dose,drugA,type="b",axes=FALSE) # axes=FALSE禁用全部坐标轴，包括坐标轴框架线
plot(dose,drugA,type="b",xaxt="n") # xaxt="n"去掉X轴的刻度线和刻度值，只留下框架线
plot(dose,drugA,type="b",yaxt="n") # yaxt="n"去掉Y轴的刻度线和刻度值，只留下框架线

x<-c(1:10)
y<-x
z<-10/x
opar<-par(no.readonly=TRUE)
par(mar=c(5,4,4,8)+0.1)
plot(
  x,y,type="b",
  pch=21,col="red",
  yaxt="n",lty=3,ann=FALSE
)
lines(x,z,type="b",pch=22,col="blue",lty=2) # lines函数作连线，添加在plot函数作图上

# axis函数向图形框架线添加坐标轴，side值1下2左3上4右，at是刻度值（x向量），labels以at为基础，不作改变
# las是par函数的参数，las=2横向刻度值垂直于纵轴，col.axis是刻度值颜色
axis(side=2,at=x,labels=x,las=2,col.axis="red")

# round函数四舍五入，digits=2保留2位小数，这次labels对at值有调整，col.axis是刻度值颜色，cex.axis是刻度值大小
# tck是刻度线长度，正值为向左，负值为向右，-0.01可写成-.01
axis(side=4,at=z,labels=round(z,digits=2),col.axis="blue",las=2,cex.axis=0.7,tck=-.01)

# 坐标轴刻度值、刻度线和标签
# mtext函数是在图形边界写标签，line参数是标签的边界位置
mtext("y=1/x",side=4,line=3,cex.lab=1,las=2,col="blue")
# title函数能写图形的主标题和常规XY轴标签
title("An Example of Creative Axes",xlab="X values",ylab="Y=X")
par(opar) # 恢复原图形参数集合

# Hmisc包的minor.tick()函数创建次要刻度线
install.packages("Hmisc")
library(Hmisc)
plot(dose,drugA,type="b")
# nx=2是X轴每2条主刻度线之间划分出2个区间，即添加1条次要刻度线
# ny=3是Y轴每2条主刻度线之间划分出3个区间，即添加2条次要刻度线
minor.tick(nx=2,ny=3,tick.ratio=0.5)
# abline函数为图形添加参考线，h参数添加水平线，
abline(h=c(20,30,40))
# seq函数产生步进数列，seq(20,60,5)起始20终止60步进为5的数列
# v参数添加垂直线，线类型lty是虚线，线颜色col为蓝色
abline(v=seq(20,60,5),lty=2,col="blue")

#
dose<-c(20,30,40,45,60)
drugA<-c(16,20,27,40,60)
drugB<-c(15,18,25,31,40)
plot(
  dose,drugA,type="b",
  pch=15,lty=1,col="red", # pch是绘制点符号，lty是线段类型，col是绘制点符合和线段的颜色
  lwd=2,cex=1.5,font.lab=2, # lwd是线段宽度，cex是绘制点符号大小，font.lab是坐标轴标签大小
  ylim=c(0,60), # ylim是Y轴范围从0到60
  main="Drug A vs. Drug B", # main添加主标题
  xlab="Drug Dosage",ylab="Drug Response" # xlab和ylab修改X轴标签和Y轴标签
)

lines(
  dose,drugB,type="b",
  pch=17,lty=2,col="blue", # 
  lwd=2,cex=1.5,font.lab=2 # lwd、cex和font.lab参数在plot函数和lines函数中都一样，所以可先用par(lwd=2,cex=1.5,font.lab=2)设置，但要还原默认图形参数
)
abline(h=c(30),lwd=1.5,lty=2,col="gray") # 添加水平参考线
library(Hmisc)
# 添加次刻度线，X轴主刻度线间划分3个区间，Y轴主刻度线间划分3个区间，次刻度线长度是主刻度线的0.5
minor.tick(nx=3,ny=3,tick.ratio=0.5)
# legend函数添加图例，"topleft"图例位于左上角，inset是图例位置参数，title是图例的标题，legend是绘制点符合对应的图例名称
legend(
  x="topleft",inset=0.05,title="Drug Type",legend=c("A","B"),
  lty=c(1,2),pch=c(15,17),col=c("red","blue") # plot函数画drugA，lines函数添加drugB，drugA（lty=1、pch=15、red）drugB（lty=2、pch=17、blue）
)

View(mtcars) # 视图数据框mtcars
# 数据框由多个向量组成，且具有二维格式
# mtcars$mpg和mtcars[["mpg"]]都可以提取出mpg向量的向量值，且无二维格式
# mtcars["mpg"]提取的mpg向量的向量值带有二维格式（列名和行名）
# attach(mtcars)捕获数据框mtcars，使用向量名（列名）可直接提取无二维格式的向量值，detach(mtcars)为去除捕获
# mtcars数据框中，wt是车身重量weight，mpg是每加仑汽油行驶英里数mile per gallon
attach(mtcars)
plot(
  wt,mpg,
  main="Mileage vs. Car Weight",xlab="Weight",ylab="Mileage",
  pch=18,col="blue" # col是绘制点符号的颜色
)
# text函数向绘图区域内部添加文本，mtext函数是在图形边界写标签
# row.names(mtcars)是取mtcars数据框的行名
text(
  x=wt,y=mpg, # plot函数的XY是（wt，mpg）text函数添加行名（车名）时与坐标点对应上
  labels=row.names(mtcars), # labels是添加文本
  cex=0.6,col="red",pos=4 # cex是文本的大小，col是文本的颜色，pos是文本的位置参数
)
detach(mtcars)

#
opar<-par(no.readonly=TRUE)
par(cex=1.5) # cex指大小，图形设备RStudioGD中，plot函数中cex指绘制点符合大小，text函数中cex指文本大小
plot(1:7,1:7,type="n") # "n" for no plotting
text(3,3,"Example of default text")
text(4,4,family="mono","Example of mono-spaced text")
text(5,5,family="serif","Example of serif text")
par(opar)

# par()函数中使用图形参数mfrow=c(nrows,ncols)来创建按行填充的图形矩阵，行数为nrows，列数为ncols
# 使用mfcol=c(nrows,ncols)来创建按列填充的图形矩阵，行数为nrows，列数为ncols
attach(mtcars)
opar<-par(no.readonly=TRUE)
par(mfrow=c(2,2)) # 创建按行填充的图形矩阵，2行2列
plot(wt,mpg,main="Scatterplot of wt vs. mpg")
plot(wt,disp,main="Scatterplot of wt vs. disp")
hist(wt,main="Histogram of wt")
boxplot(wt,main="Boxplot of wt")
par(opar)
detach(mtcars)

#
attach(mtcars)
opar<-par(no.readonly=TRUE)
par(mfrow=c(3,1)) # 创建按行填充的图形矩阵，3行1列
hist(wt,main="") # hist函数包含默认标题，main=""禁用标题
hist(mpg,ann=FALSE) # ann=FALSE禁用标题和标签
hist(disp)
par(opar)
detach(mtcars)

# layout函数布局图形，通过矩阵指定组合图形的位置
# 矩阵matrix是二维数组，矩阵的每个元素都拥有相同的模式（数值型、字符型或逻辑型）
# matrix(vector,nrow,ncol,byrow=TRUE)，矩阵中填入向量vector，几行几列，按行填充
# matrix(c(1,1,2,3),2,2,byrow=TRUE)，矩阵中填入向量c(1,1,2,3)，2行2列，按行填充byrow=TRUE
attach(mtcars)
# 矩阵的第1行是1、1，说明第1幅图占第1行，矩阵的第2行是2、3，说明第2幅图和第3幅图按从左到右的顺序占第2行，第1、2、3幅图的顺序是根据代码的顺序产生的
layout(matrix(c(1,1,2,3),2,2,byrow=TRUE))
hist(wt)
hist(mpg)
hist(disp)
detach(mtcars)

# 
# par函数的fig参数能精细控制图形布局，完整绘图区域的左下角坐标（0,0）右上角坐标（1,1）即X轴占长为1、Y轴占长为1
# fig取值c(x1,x2,y1,y2)，新绘图的下边从左到右为x1到x2、左边从下到上为y1到y2
opar<-par(no.readonly=TRUE)
par(fig=c(0,0.8,0,0.8)) # 散点图横向占据0~0.8（横向总长0~1）、纵向占据0~0.8（纵向总长0~1）
plot(mtcars$wt,mtcars$mpg,
     xlab="Miles Per Gallon",
     ylab="Car Weight")
# 使用par函数默认新建一幅图形，new=TRUE是添加新图形到现有图形
# 新添上方箱线图横向占据0~0.8，纵向占据0.55~1
par(fig=c(0,0.8,0.55,1),new=TRUE)
# 箱线图boxplot，horizontal=TRUE箱线图水平X轴，axes=FALSE坐标框架线消失
boxplot(mtcars$wt,horizontal=TRUE,axes=FALSE)
# 新添右侧箱线图横向占据0.65~1，纵向占据0~0.8
par(fig=c(0.65,1,0,0.8),new=TRUE)
boxplot(mtcars$mpg,axes=FALSE)
# mtext函数是在图形边界添加文字，side=3在上方添加，line参数是位置参数
# outer=TRUE，mtext添加文字使用图形外部边界，以整个绘图区域为主（中间对齐）
mtext(text="Enhanced Scatterplot",side=3,outer=TRUE,line=-3)
par(opar)

#
# 图形系统：base、grid、lattice和ggplot2；基础安装中包含base、grid和lattice，不包含ggplot2；base不需要显式加载，grid、lattice和ggplot2需要显式加载
install.packages("ggplot2")
library(ggplot2)
(.packages()) #查看加载的包
# 使用3个数据集解释ggplot2的使用：lattice包中的singer数据集（包括纽约合唱团歌手的高度和语音变量），mtcars数据集，car包中的Salaries数据集（包含大学教授的收入信息）
# 安装gridExtra包，gridExtra包可将多个ggplot2所绘图形放在一个图中

# ggplot函数初始化图形，aes函数是视觉映射aesthetic mappings，mtcars数据集中的wt向量值作X轴取值、mpg向量值作Y轴取值
# ggplot函数没有视觉输出，需要几何函数（geometry n.几何学）添加几何对象（简写为geom）
# geom_point函数在图形中画点，创建散点图
# geom_smooth函数增加一条“平滑”曲线，method="lm"是线性拟合，size参数指线宽
# labs函数定义XY轴标签和主标题（title=）
ggplot(data=mtcars,aes(x=wt,y=mpg))+
  geom_point(pch=17,color="blue",size=2)+
  geom_smooth(method="lm",color="red",linetype=2,size=.5)+
  labs(title="Automobile Data",x="Weight",y="Miles Per Gallon")

# ggplot2包提供了分组和小面化（faceting）（facet n.（宝石的）小平面）的方法
# 分组指一个图形中显示两组或多组的观察结果
# 小面化指的是在单独、并排的图形上显示观察组
# ggplot2包在定义组或面时使用因子
# 变量（variable）分为定量变量（quantitative variable）和定性变量（qualitative variable）
# 定量变量也称为数值变量（numerical variable），根据取值之间有无缝隙（gap），分为连续变量（continuous variable）和离散变量（discrete variable）
# 定性变量也称为分类变量（categorical variable），根据类别之间是否有顺序，分为有序变量（ordinal variable）和名义变量（nominal variable）
# 有序变量和名义变量，根据类别数，分为二项分类变量（binomial classification variable）和多项分类变量（polynomial classification variable）
# 有序变量和名义变量，在R中称为因子（factor）

# 创建一个数据框patientdata
patientID<-c(1,2,3,4)
age<-c(25,34,28,52)
diabetes<-c("Type1","Type2","Type1","Type1")
status<-c("Poor","Improved","Excellent","Poor")
patientdata<-data.frame(patientID,age,diabetes,status)
View(patientdata)

# 
diabetes<-c("Type1","Type2","Type1","Type1")
# factor函数将字符型向量转变为因子，Levels代表因子有两个分类，但没有顺序，因子是名义型变量
diabetes<-factor(diabetes)
# factor函数将字符型向量转变为有序型变量（因子），使用参数ordered=TRUE，使用levels参数修改默认排序
status<-c("Poor","Improved","Excellent","Poor")
status<-factor(status,ordered=TRUE,levels=c("Poor","Improved","Excellent"))

# factor函数将数值型向量转变为因子（名义型变量），levels参数指定因子有两个分类0和1
factor(mtcars$am,levels=c(0,1))
# levels是factor函数的一个参数，被赋予向量c(0,1)，与levels赋值向量同顺序，参数labels的赋值向量替换参数levels的赋值向量
factor(mtcars$am,levels=c(0,1),labels=c("Automatic","Manual"))
mtcars$am<-factor(mtcars$am,levels=c(0,1),labels=c("Automatic","Manual"))

mtcars$vs<-factor(mtcars$vs,levels=c(0,1),labels=c("V-Engine","Straight Engine"))
# 汽缸cylinder
mtcars$cyl<-factor(mtcars$cyl)

#
df<-data.frame(hp=mtcars$hp,mpg=mtcars$mpg,cyl=mtcars$cyl,am=mtcars$am,vs=mtcars$vs)
View(df)

# 马力horsepower/hp，每加仑汽油行驶的英里数mile per gallon/mpg，汽缸cylinder/cyl，自动挡automatic/am，V型或直列式发动机V-Engine/Straight Engine/vs
# cyl向量已转变为因子，以mtcars数据框为基础，将(hp,mpg)的坐标点分类
# am向量和vs向量已转变为因子，am因子的分类是Automatic和Manual，vs因子的分类是V-Engine和Straight Engine
# am因子有2个分类，vs因子有2个分类，共形成4个刻面
# am~vs：am因子2个分类从上到下，vs因子2个分类从左到右
ggplot(data=mtcars,aes(x=hp,y=mpg,shape=cyl,color=cyl))+
  geom_point(size=3)+
  facet_grid(am~vs)+
  labs(title="Automobile Data by Engine Type",x="Horsepower",y="Miles Per Gallon")

library(lattice) # 加载lattice包
detach("package:lattice") # 移除加载的lattice包
(.packages()) # 查看加载的包

View(singer)
#
ggplot(singer,aes(x=height))+geom_histogram()
# voice.part向量是因子，有8个分类（X轴）
ggplot(singer,aes(x=voice.part,y=height))+geom_boxplot()

#
install.packages("car")
# 加载carData包的Salaries数据框
data(Salaries,package="carData")
# rank向量是因子，有3个分类（X轴），每个分类对应一个salary数据集合
# 几何函数的fill参数（填充着色）color参数（点线着色）alpha参数（颜色透明度0完全透明1不透明）
# sides参数（地毯图的位置）
ggplot(Salaries,aes(x=rank,y=salary))+
  geom_boxplot(fill="cornflowerblue",color="green",notch=TRUE)+
  geom_point(position="jitter",color="red",alpha=.5)+
  geom_rug(sides="l",color="blue")

# 
data(singer,package="lattice")
# voice.part向量是因子，有8个分类（X轴），每个分类对应一个height数据集合
# width参数（箱线图宽度）
ggplot(singer,aes(x=voice.part,y=height))+
  geom_violin(fill="lightblue")+
  geom_boxplot(fill="lightgreen",width=.2)

# rank向量是因子，有3个分类，aes函数的fill参数指定根据因子类别分组
data(Salaries,package="carData")
ggplot(data=Salaries,aes(x=salary,fill=rank))+
  geom_density(alpha=.3)

# rank向量是因子，有3个分类；sex向量是因子，有2个分类
# aes函数的color参数是坐标点的颜色，根据rank因子分类
# aes函数的shape参数是坐标点的形状，根据sex因子分类
ggplot(Salaries,aes(x=yrs.since.phd,y=salary,color=rank,shape=sex))+
  geom_point()

# rank因子有3个分类，每个分类再根据sex因子进行二分类
# geom_bar条形图函数，position="stack"（X轴每个分类项的分组数据堆叠出现且为计数count）
# position="dodge"（X轴每个分类项的分组数据并排出现）position="fill"（X轴每个分类项的分组数据堆叠出现但为比例proportion）
# title="position='stack'"外面是双引号里面要用单引号
ggplot(Salaries,aes(x=rank,fill=sex))+
  geom_bar(position="stack")+
  labs(title="position='stack'")

ggplot(Salaries,aes(x=rank,fill=sex))+
  geom_bar(position="dodge")+
  labs(title="position='dodge'")

ggplot(Salaries,aes(x=rank,fill=sex))+
  geom_bar(position="fill")+
  labs(title="position='fill'",y="proportion")

# rank因子3项分类，条形图的长度是每项分类的计数，每项分类再根据sex因子的2项分类进行区分，geom_bar()条形图函数
ggplot(Salaries,aes(x=rank,fill=sex))+geom_bar()
# rank因子3项分类，条形图的长度是每项分类的计数，geom_bar函数中的fill参数指定填充颜色
ggplot(Salaries,aes(x=rank))+geom_bar(fill="red")
# rank因子3项分类，aes函数内的fill参数是指定一个因子（变量）对rank因子进行再分类的；变量设在aes函数内，常数设在aes函数外
ggplot(Salaries,aes(x=rank,fill="green"))+geom_bar()

#
# 使用facet_wrap()函数和facet_grid()函数创建网格图形，ggplot2中也称为刻面图
data(singer,package="lattice")
# 根据频率表制作频率直方图，直方图有若干组段，落在各组段内的频数为该组段计数
# 该组段的频数占个体总数的百分比称为该组段的频率，所有组段的频率和为1，定义：频率/组距（条形图底边）=频率密度，因此频率直方图的Y轴为频率密度，频率密度×组距=频率（总和为1）
# 直方图的Y轴仅为频数（计数count）
# geom_histogram()直方图函数，根据height向量X轴映射出组段，Y轴为组段计数
# voice.part向量是因子，是8项分类
# facet_wrap函数根据数据框中的其他向量（因子）作刻面，nrow=4是作4行，逐行从左往右排图
ggplot(data=singer,aes(x=height))+
  geom_histogram()+
  facet_wrap(~voice.part,nrow=4)

# yrs.since.phd和salary向量均为数值型向量，映射在XY轴，通过geom_point散点图函数形成坐标点
# rank向量是因子，3项分类；sex向量是因子，2项分类
# 分组和刻面都需要根据因子，aes函数是分组，有color和shape参数，根据因子rank的分类，在一幅图形中通过颜色和形状来区分坐标点
# 刻面是根据因子的分类，显示出多幅图，目的是增加图形维度
# 根据（yrs.since.phd，salary）是图形的第一维度，在一幅图形中根据aes函数指定的rank因子类别区分是第二维度
# 根据facet_grid函数指定的sex因子类别区分而形成的多幅图形是第三维度
# facet_grid(.~sex)根据sex因子刻面，单行多列
ggplot(Salaries,aes(x=yrs.since.phd,y=salary,color=rank,shape=rank))+
  geom_point()+
  facet_grid(.~sex)

# 
# geom_density()几何函数密度图，voice.part因子8项分类
# 先根据aes函数指定voice.part因子进行一幅图形的颜色填充分组，再根据facet_grid函数指定voice.part因子进行多幅图形的刻面
# facet_grid(voice.part~.)根据voice.part因子刻面，单列多行
ggplot(data=singer,aes(x=height,fill=voice.part))+
  geom_density()+
  facet_grid(voice.part~.)

# 
# 几何函数geom_smooth()拟合曲线
# 图形显示经验和薪水不是线性关系
ggplot(data=Salaries,aes(x=yrs.since.phd,y=salary))+
  geom_point()+
  geom_smooth()
# 下一步根据sex因子拟合二次多项式回归，aes函数的linetype、shape和color是根据因子设定的，作用是区分分组
# 几何函数的参数size指定点的尺寸和线的宽度
# geom_smooth函数的method参数指定平滑函数，默认值smooth，对应非参数平滑曲线（loess），lm对应线性
# formula参数指定平滑函数使用的公式，y~poly(x,n)表示n次多项式拟合，se参数绘制置信区间，se=FALSE关闭置信区间
ggplot(data=Salaries,aes(x=yrs.since.phd,y=salary,linetype=sex,shape=sex,color=sex))+
  geom_point(size=2)+
  geom_smooth(method=lm,formula=y~poly(x,2),se=FALSE,size=1)

# 函数cat（连接concatenate和输出print）
# Windows系统路径中使用\，但R中\是转义符
# 转义字符：\n回车，\t制表符，\'单引号，\b退格Backspace
name<-"Bob"
cat("Hello",name,"\b.\n","Isn\'t R","\t","GREAT?\n")


# 
# 改变基本图形参数对ggplot2图形没有影响
# 几何函数geom_boxplot()箱线图，箱线图的每组数据可呈现最小值、下四分位数QL、中位数M、上四分位数QU、最大值
# rank因子是3项分类，salary数值型向量，sex因子是2项分类
# X轴是rank因子的3项分类，向量salary是计算数据集，再根据sex因子的2项分类分组
# discrete离散的，continuous连续的
# rank因子的3项分类AsstProf、AssocProf和Prof的本身顺序不改变，breaks参数是展示因子类别
# labels参数根据breaks参数的展示顺序修改因子类别的名称
# 坐标轴刻度值、坐标轴刻度线、坐标轴标签
# X轴的刻度值来自rank因子的类别（离散），因此使用函数scale_x_discrete()
# Y轴的刻度值的本身顺序不变，breaks参数展示刻度值，labels参数根据breaks参数的展示顺序修改刻度值名称
# Y轴的刻度值来自数值型salary向量（连续），因此使用函数scale_y_continuous()
# labs函数的fill参数指定图例的标题
# theme函数的legend.position参数指定图例位置
# legend.position=c(0.1,0.8)图例的左上角距离左侧边缘10%的位置、距离底部边缘80%的位置
# theme(legend.position="none")去除图例

ggplot(data=Salaries,aes(x=rank,y=salary,fill=sex))+
  geom_boxplot()+
  scale_x_discrete(breaks=c("AsstProf","AssocProf","Prof"),
                   labels=c("Assistant\nProfessor",
                            "Associate\nProfessor",
                            "Full\nProfessor"))+
  scale_y_continuous(breaks=c(50000,100000,150000,200000),
                     labels=c("$50K","$100K","$150K","$200K"))+
  labs(title="Faculty Salary by Rank and Sex",x="",y="",fill="Gender")+
  theme(legend.position=c(.1,.8))

# 
# 发动机排量显示Engine Displacement/disp、车身重量Weight/wt、每加仑汽油行驶英里数Mile Per Gallon/mpg
# size指定点的尺寸和线的宽度，aes函数中的size参数具有分组的作用
# 几何函数geom_point散点图，如果参数shape是空心，则参数color是轮廓色、参数fill是填充色
# 如果参数shape是实心，则参数color是填充色、参数fill不起作用
# labs函数的size参数修改原有的图例标题

ggplot(mtcars,aes(x=wt,y=mpg,size=disp))+
  geom_point(shape=21,color="green",fill="cornsilk")+
  labs(x="Weight",y="Miles Per Gallon",title="Bubble Chart",size="Engine\nDisplacement")

# 
# rank因子3项分类，aes函数中的color参数根据rank因子分组
# 根据rank因子的分组/类别顺序，函数scale_color_manual指定对应颜色
ggplot(data=Salaries,aes(x=yrs.since.phd,y=salary,color=rank))+
  geom_point(size=2)+
  scale_color_manual(values=c("orange","olivedrab","navy"))

# 
colors() # 返回所有可用颜色的名称
# 创建颜色配对，RColorBrewer很受欢迎
install.packages("RColorBrewer") # 安装RColorBrewer
library(RColorBrewer) # 加载RColorBrewer
(.packages()) # 查看加载的包
brewer.pal.info # 可用调色板列表
display.brewer.all() # 显示每个调色板的颜色

mycolors<-brewer.pal(7,"Set1") # 从Set1调色板中抽取7种十六进制颜色
rep(1,7) # 数字1重复7次
barplot(rep(1,7),col=mycolors) # 条图7条，按mycolors颜色

# 
# RColorBrewer包是颜色配对包，首先加载RColorBrewer包
# dev.new()新建图形设备，作用是可以看清颜色组名称
# display.brewer.all()显示所有颜色组
# display.brewer.pal(name="Set1",n=9)显示Set1颜色组的所有9种颜色

# rank因子3项分类，aes函数根据rank因子对坐标点分组
# 函数scale_color_brewer使用的是RColorBrewer包中的颜色组，palette参数指定颜色组名称
# RColorBrewer包中有配好的颜色，就不用自己指定了
ggplot(data=Salaries,aes(x=yrs.since.phd,y=salary,color=rank))+
  geom_point(size=2)+
  scale_color_brewer(palette="Set1")

# 
# rank因子3项分类
# theme主题函数—plot.title参数—element_text函数
#              —axis.title参数—element_text函数
#              —axis.text参数—element_text函数
#              —panel.background参数—element_rect函数
#              —panel.grid.major.y参数—element_line函数
#              —panel.grid.minor.y参数—element_line函数
#              —panel.grid.minor.x参数—element_blank函数
#              —legend.position参数

# plot.title参数设置图形主标题
# axis.title参数设置XY轴的标签（坐标轴的刻度值、刻度线和标签）
# axis.text参数设置XY轴的刻度值
# element_text函数的hjust参数是文字位置水平调整[0,1]、face参数是字体（bold.italic是粗体斜体、bold是粗体）、size参数是字号、color参数是文字颜色
# panel.background参数设置图形背景，element_rect函数设置矩形框架，fill参数的矩形填充，color参数是矩形轮廓颜色
# panel.grid.major.y参数设置垂直于Y轴的主网格线，element_line函数设置主网格线特征，color是网格线颜色，linetype是网格线类型
# panel.grid.minor.y参数设置垂直于Y轴的次网格线
# element_blank函数的作用是去除
# legend.position参数指定图例的位置
# 也可以把theme()函数赋值给mytheme列表：mytheme<-theme(...)；后面代码时+mytheme即可

ggplot(Salaries,aes(x=rank,y=salary,fill=sex))+
  geom_boxplot()+
  labs(title="Salary by Rank and Sex",x="Rank",y="Salary")+
  theme(plot.title=element_text(hjust=0.5,face="bold.italic",size=14,color="brown"),
        axis.title=element_text(face="bold.italic",size=10,color="brown"),
        axis.text=element_text(face="bold",size=9,color="darkblue"),
        panel.background=element_rect(fill="white",color="darkblue"),
        panel.grid.major.y=element_line(color="grey",linetype=1),
        panel.grid.minor.y=element_line(color="grey",linetype=2),
        panel.grid.minor.x=element_blank(),
        legend.position="top")

# 
# R代码中Tab键的作用是匹配关键字
# 通过gridExtra包的grid.arrange()函数可将多个ggplot2图形保存到一个图形中
# 几何函数geom_bar()条形图，rank因子的3项分类作X轴刻度，Y轴为rank因子每项分类的计数，将此图形保存为列表对象p1
# sex因子的2项分类作为X轴刻度，Y轴为sex因子每项分类的计数，将此图形保存为列表对象p2；第3幅图形保存为列表对象p3
# layout

install.packages("gridExtra")
library(gridExtra)
p1<-ggplot(data=Salaries,aes(x=rank))+geom_bar()
p2<-ggplot(data=Salaries,aes(x=sex))+geom_bar()
p3<-ggplot(data=Salaries,aes(x=yrs.since.phd,y=salary))+geom_point()

# grid.arrange函数指定的p1,p2,p3的3个列表对象自身带有顺序
# layout_matrix参数指定矩形布局，其中的数值带有自身顺序，并与列表对象顺序相呼应
# matrix函数的byrow=TRUE（按行填充）byrow=FALSE（按列填充）
grid.arrange(p1,p2,p3,layout_matrix=matrix(c(1,1,2,3),nrow=2,ncol=2,byrow=TRUE))

# 列表对象一共有两个（p1和p3）对应matrix函数的自然数顺序2和3，自然数4没有对应的列表对象所以布局显示为空白
grid.arrange(p1,p3,layout_matrix=matrix(c(2,2,2,4,3,4),nrow=3,ncol=2,byrow=FALSE))

# 矩阵是2行2列，widths=c(3,1)左右两列宽度比为3:1，heights=c(1,2)上下两行高度比为1:2
grid.arrange(p1,p2,p3,layout_matrix=matrix(c(1,1,2,3),nrow=2,ncol=2,byrow=TRUE),widths=c(3,1),heights=c(1,2))

# getwd()显示当前的工作目录；函数mode()显示对象的存储模式
# ggsave函数保存图像，plot参数指定要保存的图形对象，保存为名为mygraph.png的5英寸×4英寸（12.7厘米×10.2厘米）PNG格式图片
getwd()
myplot<-ggplot(data=mtcars,aes(x=mpg))+geom_histogram()
mode(myplot)
ggsave(file="mygraph.png",plot=myplot,width=5,height=4)

# 如果无plot参数指定，最近创建的图形将被保存，图形可被保存为PDF格式
ggsave(file="mygraph.pdf")

# 
y<-c(15.437094,9.637082,5.313095,3.604152,1.123084)
groups<-c("a","b","c","d","e")
Day<-c("Thu","Tue","Wed","Fri","Mon")
sd<-c(1.0688850,0.9955075,0.5475116,0.7055487,0.9363923)
re2<-data.frame(y,groups,Day,sd)
# magrittr包定义了4个管道操作符：%>%、%T>%、%$%、%<>%
library(magrittr) 
re2$Day<-factor(re2$Day,levels=c("Mon","Tue","Wed","Thu","Fri"))
ggplot(re2,aes(Day,y))+
  geom_col(aes(fill=Day),width=.4)+
  geom_line(aes(group=""),color="red",linetype="dashed")
