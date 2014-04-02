#follows on from the download.R script
#so (from that script) the working directory is set to the raw data folder

csdwelling <- read.csv("2013-mb-dataset-Total-New-Zealand-Dwelling.csv", stringsAsFactors=FALSE, na.strings = "..C")
csfamily <- read.csv("2013-mb-dataset-Total-New-Zealand-Family.csv", stringsAsFactors=FALSE, na.strings = "..C", fileEncoding="latin1")
#there is a character R finds difficult somewhere in the family file column names
cshousehold <- read.csv("2013-mb-dataset-Total-New-Zealand-Household.csv", stringsAsFactors=FALSE, na.strings = "..C")
csind1 <- read.csv("2013-mb-dataset-Total-New-Zealand-Individual-Part-1.csv", stringsAsFactors=FALSE, na.strings = "..C")
csind2 <- read.csv("2013-mb-dataset-Total-New-Zealand-Individual-Part-2.csv", stringsAsFactors=FALSE, na.strings = "..C")
csind3a <- read.csv("2013-mb-dataset-Total-New-Zealand-Individual-Part-3a.csv", stringsAsFactors=FALSE, na.strings = "..C")
csind3b <- read.csv("2013-mb-dataset-Total-New-Zealand-Individual-Part-3b.csv", stringsAsFactors=FALSE, na.strings = "..C")

#create a list of what questions are where
qtopic <- names(csdwelling)
qindex <- data.frame(qtopic)
qindex$qlocation <- "csdwelling"

qtopic <- names(csfamily)
addedindex <- data.frame(qtopic)
addedindex$qlocation <- "csfamily"
qindex <- rbind(qindex,addedindex)

qtopic <- names(cshousehold)
addedindex <- data.frame(qtopic)
addedindex$qlocation <- "cshousehold"
qindex <- rbind(qindex,addedindex)

qtopic <- names(csind1)
addedindex <- data.frame(qtopic)
addedindex$qlocation <- "csind1"
qindex <- rbind(qindex,addedindex)

qtopic <- names(csind2)
addedindex <- data.frame(qtopic)
addedindex$qlocation <- "csind2"
qindex <- rbind(qindex,addedindex)

qtopic <- names(csind3a)
addedindex <- data.frame(qtopic)
addedindex$qlocation <- "csind3a"
qindex <- rbind(qindex,addedindex)

qtopic <- names(csind3b)
addedindex <- data.frame(qtopic)
addedindex$qlocation <- "csind3b"
qindex <- rbind(qindex,addedindex)

#Lets use the output folder created in the download script
#it should be at the same level as the current working directory

write.csv(qindex, file="../census2013output/ListOfQuestions.csv", row.names = FALSE)

#Now we hack off the footnotes to leave the data
csdwelling <- csdwelling[1:49011,]
csfamily <- csfamily[1:49011,]
cshousehold <- cshousehold[1:49011,]
csind1 <- csind1[1:49011,]
csind2 <- csind2[1:49011,]
csind3a <- csind3a[1:49011,]
csind3b <- csind3b[1:49011,]

#save everything in memory to make it easy to reload and pick up again in future
save.image(file="cleanData.RData")







