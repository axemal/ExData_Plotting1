# Plots Global Active Power, Energy Sub Metering, Voltage and Global Reactive Power  over two days.
# Uses trimmed data file - I find it fastest to trim the input data file once in vi rather than 
# to read/subset or implement partial reading which would have to read the full file for every plot. 

# Read and convert date/time
r <- read.table("hpc_trimmed.txt",sep=";",header=TRUE)
r$Date <- as.Date(r$Date,"%d/%m/%Y")
r$Time = strptime(paste(r$Date,r$Time),"%Y-%m-%d %H:%M:%S")

# Build/Annotate the plot
par(mfrow=c(2,2),mar=c(4,4,1,1))

with(r, {
  # Plot Global Active Power
  plot(Time,Global_active_power, type="n", main="",xlab="",ylab="Global Active Power")
  lines(Time,Global_active_power)
  # Plot Voltage
  plot(Time,Voltage, type="n", main="",ylab="Voltage",xlab="datetime")
  lines(Time,Voltage)
  # Plot Energy Sub Metering
  plot(Time,Sub_metering_1, type="n", main="",xlab="",ylab="Energy sub metering")
  lines(Time,Sub_metering_1, col="black")
  lines(Time,Sub_metering_2, col="red")
  lines(Time,Sub_metering_3, col="blue")
  legend("topright",lwd=1,col = c("black","red","blue"),legend=c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "))
  # Plot Global Reactive Power
  plot(Time,Global_reactive_power, type="n",xlab="datetime")
  lines(Time,Global_reactive_power)
})

# Copy full plot to PNG device
dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()


