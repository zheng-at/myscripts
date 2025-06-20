#人体重60kg,小鼠体重0.02kg,大鼠体重0.3kg,大鼠1体重0.15kg,大鼠2体重0.3kg,犬10kg,猴3kg
#noael(mg/kg/day)

h_w<-60;m_w<-0.02;r_w<-0.2;r1_w<-0.15;r2_w<-0.3;d_w<-10;mon_w<-3

h_area<-10^(0.698*log10(h_w*10^3)+0.8762)/10^4
m_area<-10^(0.698*log10(m_w*10^3)+0.8762)/10^4
r_area<-10^(0.698*log10(r_w*10^3)+0.8762)/10^4
r1_area<-10^(0.698*log10(r1_w*10^3)+0.8762)/10^4
r2_area<-10^(0.698*log10(r2_w*10^3)+0.8762)/10^4
d_area<-10^(0.698*log10(d_w*10^3)+0.8762)/10^4
m_area<-10^(0.698*log10(m_w*10^3)+0.8762)/10^4
mon_area<-10^(0.698*log10(mon_w*10^3)+0.8762)/10^4

h_km<-10^4*h_w/10^(0.698*log10(h_w*10^3)+0.8762)
m_km<-10^4*m_w/10^(0.698*log10(m_w*10^3)+0.8762)
r_km<-10^4*r_w/10^(0.698*log10(r_w*10^3)+0.8762)
r1_km<-10^4*r1_w/10^(0.698*log10(r1_w*10^3)+0.8762)
r2_km<-10^4*r2_w/10^(0.698*log10(r2_w*10^3)+0.8762)
d_km<-10^4*d_w/10^(0.698*log10(d_w*10^3)+0.8762)
mon_km<-10^4*mon_w/10^(0.698*log10(mon_w*10^3)+0.8762)

shell('cls')

mrsd_fibonacci<-function(noael,x){
  a1<-round(noael/(h_km/x)/10*60,3)
  a2<-round(a1*2,3)
  a3<-round(a2*1.67,3)
  a4<-round(a3*1.5,3)
  a5<-round(a4*1.33,3)
  a6<-round(a5*1.33,3)
  a7<-round(a6*1.33,3)
  paste(c(a1,a2,a3,a4,a5,a6,a7),'mg')
}

hnstd_fibonacci<-function(hnstd,x){
  a1<-round(hnstd/(h_km/x)/6*60,3)
  a2<-round(a1*2,3)
  a3<-round(a2*1.67,3)
  a4<-round(a3*1.5,3)
  a5<-round(a4*1.33,3)
  a6<-round(a5*1.33,3)
  a7<-round(a6*1.33,3)
  paste(c(a1,a2,a3,a4,a5,a6,a7),'mg')
}

mtd<-function(noael,x){
  a<-round(noael/(h_km/x)*60/2,3)
  paste(a,'mg')
}

mabel<-function(dose,x){
  a<-round(dose/(h_km/x)*60,3)
  paste(a,'mg')
}

shell('cls')

