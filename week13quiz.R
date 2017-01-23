# quiz 13

#1
w1=???6.90675478
w2=0.40546511
h1 <- 0
h2 <- 1
1/(1+exp(-(w1*h1+w2*h2)))

#2 ignore this, just .25* answer from 1
states <- expand.grid(0:1,0:1,0:1)
energies <- apply(states, 1, function(x) {-x[1]*x[3]*w1 - x[2]*x[3]*w2})
stens <- cbind(states, energies)
exp(-energies[7]) / sum(exp(-energies))


#3 0

# 4
1/(1+exp(w2))


#6

1/(1+exp(-(w1*0+w2*0)))
.6/1.1


tval <- 1/(1+exp(-(10*0+-4*1)))
tval / (tval+.5)

#7

1/(1+exp(-(w1*1+w2*1))) / (
  1/(1+exp(-(w1*1+w2*1))) + 
    
    1/(1+exp(-(w1*1+w2*0))))

w1a <- 10
w2a <- -4
1/(1+exp(-(w1a*1+w2a*1))) / (
  1/(1+exp(-(w1a*1+w2a*1))) + 
    
    1/(1+exp(-(w1a*1+w2a*0))))
