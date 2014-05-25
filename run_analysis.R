makeMeanSd<-function(dir="./UCI HAR Dataset/"){
  library(plyr)
  ##columns to extract
  extract<-c(1,2,3,4,5,6,41,42,43,44,45,46,121,122,123,124,125,126)
  ##charge the data
  dirTotal<-paste(dir,"train/X_train.txt",sep="")
  train<-read.table(dirTotal)
  dirTotal<-paste(dir,"test/X_test.txt",sep="")
  test<-read.table(dirTotal)
  t1<-length(train[[1]])
  t2<- length(test[[1]])
  totalrows<-t1 + t2
  ##charging features and activity
  dirTotal<-paste(dir,"features.txt",sep="")
  feature<-read.table(dirTotal)
  dirTotal<-paste(dir,"activity_labels.txt",sep="")
  activity<-read.table(dirTotal)
  vacti<-as.vector(activity[[2]])
  len<-length(extract)
  datos<-data.frame(subject=rep(0,totalrows),activity=rep(0,totalrows))
  l<-as.vector(feature[["V2"]])
  for (i in 1:len){
     aux=data.frame(x=rep(0,totalrows))
     datos<-cbind(datos,aux)
     name<-l[extract[i]]
     name<-gsub("[(,)]","",name)
     name<-gsub("[-]",".",name)
     colnames(datos)[2+i]<-name
  } 
  ##chargin train subjects and activities
  dirTotal<-paste(dir,"train/subject_train.txt",sep="")
  subject<-read.table(dirTotal)
  vsub<-as.vector(subject[[1]])
  dirTotal<-paste(dir,"train/y_train.txt",sep="")
  codact<-read.table(dirTotal)
  vcodact<-as.vector(codact[[1]])
  for (i in 1:t1){
      datos[i,1]<-vsub[i]
     datos[i,2]<-vacti[vcodact[i]]
     for (j in 1:len){
       datos[i,2+j]<-train[i,extract[j]]
     }
  }
  ##chargin test data
  dirTotal<-paste(dir,"test/subject_test.txt",sep="")
  subject<-read.table(dirTotal)
  vsub<-as.vector(subject[[1]])
  dirTotal<-paste(dir,"test/y_test.txt",sep="")
  codact<-read.table(dirTotal)
  vcodact<-as.vector(codact[[1]])
  for (i in 1:t2){
    datos[t1+i,1]<-vsub[i]
    datos[t1+i,2]<-vacti[vcodact[i]]
    for (j in 1:len){
      datos[t1+i,2+j]<-train[i,extract[j]]
    }
  }
  dirTotal<-paste(dir,"tidyData_MnSd.txt")
  write.table(datos,file=dirTotal,append=FALSE,sep=",",eol="\n",quote=FALSE,row.names=FALSE)
  
  ##make the summarize tidy data
    aux=ddply(datos,cbind("subject","activity"),summarise,
              tBodyAcc.mean.X=mean(tBodyAcc.mean.X),
              tBodyAcc.mean.Y=mean(tBodyAcc.mean.Y),
              tBodyAcc.mean.Z=mean(tBodyAcc.mean.Z),
              tGravityAcc.mean.X=mean(tGravityAcc.mean.X),
              tGravityAcc.mean.Y=mean(tGravityAcc.mean.Y),
              tGravityAcc.mean.Z=mean(tGravityAcc.mean.Z),
              tBodyGyro.mean.X=mean(tBodyGyro.mean.X),
              tBodyGyro.mean.Y=mean(tBodyGyro.mean.Y),
              tBodyGyro.mean.Z=mean(tBodyGyro.mean.Z)
              )  
  dirTotal<-paste(dir,"tidyData_summa.txt")
  write.table(aux,file=dirTotal,append=FALSE,sep=",",eol="\n",quote=FALSE,row.names=FALSE)
  
}