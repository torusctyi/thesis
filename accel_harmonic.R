
n.iters <- 30

iters <- 1/(1:n.iters)

accel <- numeric(n.iters - 2)

for(i in 1:(n.iters-2)){
    accel[i] = aitken(iters[i], iters[i+1], iters[i+2])
}

# double acceleration
accel.2 <- numeric(length(accel) - 4)

for(i in 1:(length(accel)-4)){
    accel.2[i] = aitken(accel[i], accel[i+1], accel[i+2])
}

# triple acceleration 
accel.3 <- numeric(length(accel.2 - 2))

for(i in 1:(length(accel.2)-2)){
    accel.3[i] = aitken(accel.2[i], accel.2[i+1], accel.2[i+2])
}

plot(log10(iters), ylab= "Log Error", xlab = "Iteration", pch = 16, t = 'o', lty=2)
points(log10(abs(accel)), col = 'blue', pch = 16, t='o', lty=2)
points(log10(abs(accel)), col = 'red', pch = 16, t='o', lty=2)
