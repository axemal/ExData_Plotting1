# Plots Global Active Power histogram.
# Uses trimmed data file - I find it fastest to trim the input data file once in vi rather than 
# to read/subset or implement partial reading which would have to read the full file for every plot. 

r <- read.table("hpc_trimmed.txt",sep=";",header=TRUE)
hist(r$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()

