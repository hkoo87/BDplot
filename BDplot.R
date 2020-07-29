#BDplot making

#Set the directory
setwd("~/Desktop/Test/")

#Load a library package
library("ggplot2")

#Upload the data file which includes sample name, values, and group (herein Type) information.
#For example, Test-Table.txt file includes the below information:

#Samples  Values    Type    
#A        2.788414  Group1
#B        2.600294  Group1
#C        2.743374  Group1
#D        2.721035  Group2
#E        3.231245  Group2  
#F        1.723546  Group2

#Load Test-Table.txt file
Table <- read.table(file="Test-Table.txt",header=T,sep="\t",na.strings = "NA", check.names=FALSE) 

#Create a bar plot and save graph information into x.
x<-ggplot(Table, aes(x=Type, y=Values, fill=Type))+
  geom_boxplot(position=position_dodge(0.5),width=0.7) + 
  theme(legend.position="right")+ 
  theme(text = element_text(size=9),axis.text.x =element_text(angle=90,hjust=1,vjust=0.5),
        axis.ticks.x = element_blank(),panel.background = element_rect(fill = "White"),
        panel.grid.major = element_line(colour = "light gray"), 
        legend.text = element_text(size = 8), legend.title = element_text(size = 8))+
  labs(x="Samples", y="Values") #Label information can be changed here

#Add dots, which represent each sample to the bar plot.
x + geom_dotplot(binaxis="y", stackdir='center',stackratio=0.5, dotsize=0.5)+
  stat_summary(fun ="mean", geom="point", shape=8, size=1, color="red")+ #mean value will be added
  stat_summary(fun ="median", geom="point", shape=2, size=1, color="yellow")+ #median value will be added
  scale_fill_manual(values = c("blue", "red"))+ #colors can be maually changed 
  scale_y_continuous(breaks=seq(2.5,5,0.1)) #y-axis ticks can be changed

#Save the BDplots
#This will create .png file in your working directory
ggsave("BDplots.png", height=10, width=9, units="cm", dpi=600)
dev.off()
