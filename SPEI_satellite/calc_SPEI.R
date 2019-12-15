library(SPEI)
# Example
# Load data
data(wichita)
# Compute potential evapotranspiration (PET) and climatic water balance (BAL)
wichita$PET = thornthwaite(wichita$TMED, 37.6475)
wichita$BAL = wichita$PRCP-wichita$PET
# Convert to a ts (time series) object for convenience
wichita_ts = ts(wichita[,-c(1,2)], end=c(2011,10), frequency=12)
plot(wichita_ts)
# One and tvelwe-months SPEI
spei1 <- spei(wichita[,'BAL'], 1)
spei12 <- spei(wichita[,'BAL'], 12)
class(spei1)
# Extract information from spei object: summary, call function, fitted values, and coefficients
summary(spei1)
# Plot spei object
par(mfrow=c(2,1))
plot(spei1, main='Wichita, SPEI-1')
plot(spei12, main='Wichita, SPEI-12')
write.csv(spei1$fitted,file='./example_spei.csv')