train_set<- read.table("X_train.txt",sep="", header=FALSE)
train_act<-read.table("y_train.txt",header=F)
colnames(train_act) <- c("activity")
train<-cbind(train_act,train_set)
train<-data.frame(source="Training", train)

test_set<- read.table("X_test.txt",sep="", header=FALSE)
test_act<-read.table("y_test.txt",header=F)
colnames(test_act) <- c("activity")
test<-cbind(test_act,test_set)
test<-data.frame(source="Test", test)

features<-read.table("features.txt", header=F)
train_test<- merge(train,test,all=T)
colnames(train_test) <- c("source","activity",as.vector(features$V2))

mean_std<-train_test[,grep("source|activity|mean|std",names(train_test),ignore.case = T)]

act_lbl<-read.table("activity_labels.txt",header=F)

colnames(act_lbl)<-c("activity","ActivityDesc")

labeled_train_and_test<- merge(act_lbl,mean_std,by.x="activity", by.y="activity")

activity_col_idx<-grep("ActivityDesc",names(labeled_train_and_test))
source_col_idx<-grep("source",names(labeled_train_and_test))

labeled_train_and_test<- labeled_train_and_test[,c(source_col_idx,activity_col_idx,(1:ncol(labeled_train_and_test))[-c(1,source_col_idx,activity_col_idx)])]

train_and_test_average<-aggregate(labeled_train_and_test[c(3:ncol(labeled_train_and_test))],by = labeled_train_and_test[c("source","ActivityDesc")], FUN=mean)

write.table(train_and_test_average,"getdata_009_human_activity_recog.txt",sep=" ",row.name=FALSE)
