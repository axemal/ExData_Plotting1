# Plots Global Active Power line chart over two days.
# Uses trimmed data file - I find it fastest to trim the input data file once in vi rather than 
# to read/subset or implement partial reading which would have to read the full file for every plot. 

# Read and convert date/time
r <- read.table("hpc_trimmed.txt",sep=";",header=TRUE)
r$Date <- as.Date(r$Date,"%d/%m/%Y")
r$Time = strptime(paste(r$Date,r$Time),"%Y-%m-%d %H:%M:%S")

# Build/Annotate the plot
par(mar=c(3,4,1,1))
with(r, plot(Time,Global_active_power, type="n", main="",ylab="Global Active Power (kilowatts)"))
with(r, lines(Time,Global_active_power))

# Copy the plot to PNG device
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()

