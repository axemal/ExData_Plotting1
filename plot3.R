# Plots Energy Sub Metring chart over two days.
# Uses trimmed data file - I find it fastest to trim the input data file once in vi rather than 
# to read/subset or implement partial reading which would have to read the full file for every plot. 

# Read and convert date/time
r <- read.table("hpc_trimmed.txt",sep=";",header=TRUE)
r$Date <- as.Date(r$Date,"%d/%m/%Y")
r$Time = strptime(paste(r$Date,r$Time),"%Y-%m-%d %H:%M:%S")

# Build/Annotate the plot
par(mfrow=c(1,1),mar=c(3,4,1,1))
with(r, plot(Time,Sub_metering_1, type="n", main="",ylab="Energy sub metering"))
with(r, lines(Time,Sub_metering_1, col="black"))
with(r, lines(Time,Sub_metering_2, col="red"))
with(r, lines(Time,Sub_metering_3, col="blue"))
legend("topright",lwd=1,col = c("black","red","blue"),legend=c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "))

# Copy the plot to PNG device
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()

