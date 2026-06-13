
w_bar <- function(p, w11, w12, w22){
  q <- 1-p
  
  p^2*w11 + 2*p*q*w12 + q^2*w22
}

p_hat <- function(w11, w12, w22){
  (w22 - w12)/(w11 + w22 - 2*w12)
}




w11 <- .5
w12 <- 1
w22 <- .75

curve(w_bar(x, w11, w12, w22), 0, 1, main = paste0("w11=",w11,"   w12=",w12,"  w22=",w22), xlab = "p", ylab = "Mean Fitness", lwd = 3)

abline(v = p_hat(w11, w12, w22))



n_gen <- 120




w11 <- 1
w12 <- .75
w22 <- .5


p <- c()
p[1] <- .01
for(i in 2:(n_gen+1)){
  pt <- p[i-1]
  q <- 1-pt
  mufit <- w_bar(pt, w11, w12, w22)
  p[i] <- (pt/mufit)*(pt*w11 + q*w12)
}
gen <- 1:(n_gen+1)
plot(p ~ gen, type = "l", lwd = 3, xlab = "Generation",
     ylab = "p")





w11 <- 1
w12 <- 1
w22 <- .5


p <- c()
p[1] <- .01
for(i in 2:(n_gen+1)){
  pt <- p[i-1]
  q <- 1-pt
  mufit <- w_bar(pt, w11, w12, w22)
  p[i] <- (pt/mufit)*(pt*w11 + q*w12)
}

lines(p ~ gen, lwd = 2, col = "red")


w11 <- 1
w12 <- .5
w22 <- .5


p <- c()
p[1] <- .01
for(i in 2:2:(n_gen+1)){
  pt <- p[i-1]
  q <- 1-pt
  mufit <- w_bar(pt, w11, w12, w22)
  p[i] <- (pt/mufit)*(pt*w11 + q*w12)
}

lines(p ~ gen, lwd = 2, col = "blue")




