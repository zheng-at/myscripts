# colours()返回所有颜色名称
# colorRampPalette()创建颜色梯度
colours()[grep('blue',colours())]
colorRampPalette(c("yellow3","mediumseagreen"))(6)

# 
library(ggplot2)
install.packages("ggpubr")
library(ggpubr)

library(RColorBrewer)
brewer.pal.info
dev.new()
display.brewer.all()
getwd()
ggsave(file="brewer.png")

# 1.1
#opar<-par(no.readonly=TRUE)
#par(family="serif",lwd)
getwd()
slices<-c(451,28,6)
lbls<-c("三级医院（93%）","肿瘤专科医院（5.8%）","三级或肿瘤专科医院（1.2%）")
pie(slices,lbls,col=c("#00AFBB","#E7B800","#FC4E07"),
    clockwise=T,init.angle=30,border="white",font=3,
    radius=1,cex=1.25)
mtext(text="参与调研的医师的所在医院级别分布",side=3,
      outer=TRUE,line=-3,font=4,cex=1.5)


# 
#par(opar)
##---------------------------------------------------------------
# #00AFBB蓝 #E7B800黄 #FC4E07红
df<-data.frame(group=c("Male","Female","Child"),value=c(25,25,50))
head(df)
ggpie(data=df,x="value",label="group",
      fill="group",color="white",
      palette=c("#00AFBB","#E7B800","#FC4E07"))
labs<-paste0(df$group,"(",df$value,"%)")
ggpie(data=df,x="value",label=labs,
      fill="group",color="white",
      palette=c("#00AFBB","#E7B800","#FC4E07"),
      lab.pos="in",lab.font="white")
##--------------------------------------------
# reorder()函数reorder levels of a factor
# 字符型向量组成数据框后自动变为因子；R会对因子类别进行默认排序
# 默认geom_bar函数只需一个向量，当需要把n作为类别m作为计数时，使用geom_bar(stat="identity")
# reorder(n,m)先返回n值（普外、肾内、皮肤、病理）和默认的因子类别排序（病理、皮肤、普外、肾内）再对应出各自的数字（2，7，1，4）
# 再升序数字得新m（1、2、4、7）再对应出相应因子类别（普外、病理、肾内、皮肤）即最终结果
n<-c("普外科","肾内科","皮肤科","病理科")
m<-c(1,4,7,2)
nm<-data.frame(n,m)
ggplot(nm,aes(x=n,y=m))+geom_bar(stat="identity")
ggplot(nm,aes(reorder(x=n,X=m),y=m))+geom_bar(stat="identity",width=0.8)
# 这是数学，越大的数字加了负号就变得越小，按照数字的升序排列，得到新m同时y=m又取反恢复
ggplot(nm,aes(reorder(x=n,X=-m),y=m))+geom_bar(stat="identity",width=0.8)
# colours()返回所有颜色名称
# 抓取颜色名称中包含green的
colours()[grep("green",colours())]
#
barplot(rep(1,50),col=rainbow(50),names.arg=1:50)
# colorRampPalette()创建渐变色无需加载包，得到的颜色向量按柱状升序填充
cols<-colorRampPalette(c("yellow2","darkorange1"))(8)
library(RColorBrewer)
# 告知调色板Set1的最大值为9
display.brewer.pal(name="Set1",n=10)


# 
# 1.2计数
# View(df)
a<-c("普外科",
     "肿瘤外科",
     "肝胆胰外科/消化外科",
     "胰腺外科/胰腺中心/普外科的胰腺方向",
     "肿瘤内科",
     "消化内科",
     "胰腺中心",
     "其他")
b<-c(42,5,124,94,177,14,17,12)
df<-data.frame(a,b)
noteb<-paste(b,"例",sep="")
cols<-brewer.pal(n=8,name="Set1")
# 因子a的默认类别排序被数值b再排序，b为升序
# aes()函数的fill参数赋值因子而分组填充
# geom_bar()的aes函数先分组填充底色
# 柱形值由升序后的向量b赋值，noteb与b相联系自动对应
# fontface="bold.italic"
ggplot(df,aes(y=reorder(a,b),x=b))+
  geom_bar(stat="identity",width=0.6,aes(fill=reorder(a,b)))+
  labs(title="参与调研的医师的所在科室分布（计数）",x="",y="")+
  scale_fill_manual(values=cols)+
  geom_text(aes(label=noteb),size=5,fontface="italic",hjust=-0.25,color="#E41A1C")+
  xlim(0,200)+
  theme(legend.position="none",
        axis.text.y=element_text(size=15,face="bold.italic"),
        axis.text.x=element_text(size=12,face="bold.italic"),
        plot.title=element_text(hjust=0.5,vjust=2.5,face="bold.italic",size=16))

# text()的labels参数，所有的文字都是从原点出发
# 1.2百分数
slices<-c(191,265,29)
lbls<-c("内科（39.38%）","外科（54.64%）","胰腺中心及其他（5.98%）")
pie(slices,lbls,col=c("#00AFBB","#E7B800","#FC4E07"),
    clockwise=T,init.angle=30,border="white",font=3,
    radius=0.8,cex=1.25)
mtext(text="参与调研的医师的所在科室分布（百分数）",side=3,
      outer=TRUE,line=-3,font=4,cex=1.5)
a<-c("普外科",
     "\n\n肿瘤外科",
     "\n\n\n\n肝胆胰外科/消化外科",
     "\n\n\n\n\n\n胰腺外科/胰腺中心/普外科的胰腺方向")
b<-c("肿瘤内科","\n\n消化内科")
text(x=-1.95,y=0.45,labels=a,font=3,col="#E41A1C",cex=1.25)
text(x=1.8,y=-0.55,labels=b,font=3,col="#E41A1C",cex=1.25)

# 1.3
# 
slices<-c(87,109,140,149)
lbls<-c("主任医师（87例）","副主任医师（109例）","主治医师（140例）","其他（149例）")
yanse<-brewer.pal(n=4,name="Accent")
pie(slices,lbls,col=yanse,clockwise=T,init.angle=-30,
    border="white",font=3,radius=1,cex=1.25)
mtext(text="参与调研的医师的职称分布",side=3,outer=TRUE,line=-3,font=4,cex=1.5)

# 1.4总饼图 
slices<-c(30,455)
lbls<-c("去年＜5人（30例）","去年≥5人（455例）")
pie(slices,lbls,col=c("#E7B800","#00AFBB"),clockwise=T,init.angle=30,border="white",font=3,radius=1,cex=1.25)
mtext(text="参与调研的医师所在科室在过去一年中诊治的胰腺癌患者数量",side=3,outer=TRUE,line=-3,font=4,cex=1.25)

# 1.4大部分分层
a<-c("5~50人",
     "50~100人",
     "100~150人",
     "500~1000人",
     "1000~2000人",
     "2000~5000人",
     "5000人及以上",
     "人数不详")
b<-c(176,82,135,35,12,5,2,8)
df<-data.frame(a,b)
# factor函数改变因子的类别顺序；因子类别排序从0点开始
df$a<-factor(df$a,ordered=TRUE,levels=c("人数不详","5000人及以上",
                                        "2000~5000人","1000~2000人",
                                        "500~1000人","100~150人",
                                        "50~100人","5~50人"))
# 向量反转
# geom_line(group="")实现柱顶端连线；空值""；不加group参数则将所有点连接起来
cols<-brewer.pal(n=8,name="Dark2")[8:1]
noteb<-paste(b,"例",sep="")
ggplot(df,aes(y=a,x=b))+
  geom_bar(stat="identity",width=0.6,aes(fill=a))+
  labs(title="过去一年科室诊治胰腺癌患者≥5人的分层数据",x="",y="")+
  scale_fill_manual(values=cols)+
  geom_line(group="",colour="#FF3D00",linetype="longdash")+
  geom_point(colour="#FFFFB3")+
  geom_text(aes(label=noteb),size=5,fontface="italic",hjust=-0.45,color="#0066FF")+
  xlim(0,200)+
  theme(legend.position="none",
        axis.text.y=element_text(size=15,face="bold.italic"),
        axis.text.x=element_text(size=12,face="bold.italic"),
        plot.title=element_text(hjust=0.5,vjust=2.5,face="bold.italic",size=16))
# 1.5
# 
slices<-c(339,146)
lbls<-c("负责化疗（339例）","不负责化疗（146例）")
yanse<-c("#377EB8","#B3B3B3")
pie(slices,lbls,col=yanse,clockwise=T,init.angle=-30,
    border="white",font=3,radius=1,cex=1.25)
mtext(text="是否负责胰腺癌患者一线化疗的医师比例",side=3,outer=TRUE,line=-3,font=4,cex=1.5)

# 2.1.1
# 
a<-c("体检发现异常",
     "疼痛",
     "食欲减退",
     "血糖异常",
     "黄疸",
     "消瘦",
     "皮肤瘙痒",
     "其他")
b<-c(317,393,108,31,396,175,32,3)
df<-data.frame(a,b)
cols<-brewer.pal(n=8,name="Dark2")[8:1]
noteb<-paste(b,"例",sep="")
ggplot(df,aes(y=reorder(a,b),x=b))+
  geom_bar(stat="identity",width=0.6,aes(fill=reorder(a,b)))+
  labs(title="患者就诊的主要原因有哪些",x="",y="")+
  scale_fill_manual(values=cols)+
  geom_text(aes(label=noteb),size=5,fontface="italic",hjust=-0.25,color="#E41A1C")+
  xlim(0,500)+
  theme(legend.position="none",
        axis.text.y=element_text(size=15,face="bold.italic"),
        axis.text.x=element_text(size=12,face="bold.italic"),
        plot.title=element_text(hjust=0.5,vjust=2.5,face="bold.italic",size=16))

# 2.1.2
# 
a<-c("认为0~20%的患者经历误诊",
     "认为20~50%的患者经历误诊",
     "认为50%以上的患者经历误诊",
     "不清楚")
b<-c(262,78,15,130)
df<-data.frame(a,b)
cols<-brewer.pal(n=8,name="Dark2")[8:4]
noteb<-paste(b,"例",sep="")
ggplot(df,aes(y=reorder(a,b),x=b))+
  geom_bar(stat="identity",width=0.4,aes(fill=reorder(a,b)))+
  labs(title="参与调研的医师认为患者在确诊前曾被误诊的占比分布",x="",y="")+
  scale_fill_manual(values=cols)+
  geom_text(aes(label=noteb),size=5,fontface="italic",hjust=-0.25,color="#E41A1C")+
  xlim(0,400)+
  theme(legend.position="none",
        axis.text.y=element_text(size=15,face="bold.italic"),
        axis.text.x=element_text(size=12,face="bold.italic"),
        plot.title=element_text(hjust=0.5,vjust=2.5,face="bold.italic",size=16))

# 2.1.3
# 
a<-c("认为0~20%的胰腺癌患者在其医院首诊",
     "认为20~50%的胰腺癌患者在其医院首诊",
     "认为50%以上的胰腺癌患者在其医院首诊",
     "不清楚")
b<-c(104,165,161,55)
df<-data.frame(a,b)
# 因子类别排序从0点开始
df$a<-factor(df$a,ordered=TRUE,levels=c("不清楚",
                                        "认为50%以上的胰腺癌患者在其医院首诊",
                                        "认为20~50%的胰腺癌患者在其医院首诊",
                                        "认为0~20%的胰腺癌患者在其医院首诊"))
cols<-brewer.pal(n=8,name="Dark2")[8:4]
noteb<-paste(b,"例",sep="")
ggplot(df,aes(y=a,x=b))+
  geom_bar(stat="identity",width=0.4,aes(fill=a))+
  labs(title="参与调研的医师认为胰腺癌患者在其医院首诊的占比分布",x="",y="")+
  scale_fill_manual(values=cols)+
  geom_line(group="",colour="#FF3D00",linetype="longdash")+
  geom_point(colour="#FFFFB3")+
  geom_text(aes(label=noteb),size=5,fontface="italic",hjust=-0.25,color="#E41A1C")+
  xlim(0,225)+
  theme(legend.position="none",
        axis.text.y=element_text(size=15,face="bold.italic"),
        axis.text.x=element_text(size=12,face="bold.italic"),
        plot.title=element_text(hjust=0.5,vjust=2.5,face="bold.italic",size=16))

# 2.1.4
# 
slices<-c(288,197)
lbls<-c("有MDT门诊（288例）","无MDT门诊（197例）")
# yanse向量与lbls向量同顺序
yanse<-c("#F16913","#B3B3B3")
pie(slices,lbls,col=yanse,clockwise=T,init.angle=-30,
    border="white",font=3,radius=1,cex=1.25)
mtext(text="参与调研的医师所在医院是否有MDT门诊",side=3,outer=TRUE,line=-3,font=4,cex=1.5)

# 2.1.5
# 


