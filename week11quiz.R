# 4
states <- expand.grid(v1=0:1, v2=0:1, h=0:1)
E4 <- function(s) {
  b <- c(0,0,-2)
  w1 <- 3
  w2 <- -1
  -sum(s*b) - (s[1]*s[3]*w1 + s[2]*s[3]*w2)
}
Energies <- apply(states, 1, E4)
statEn <- cbind(states, Energies)
topEn <- statEn[statEn$v1==1 & statEn$v2==0,]$Energies
sum(exp(-topEn)) / sum(exp(-Energies))



# 5
wac <- 1
wbc <- 1
wce <- 2
wcd <- 2
wbe <- -3
wad <- -2
wde <- 3
st5 <- expand.grid(a=0:1,b=0:1,c=0:1,d=0:1,e=0:1)
ef5 <- function(s) {
  -sum(  s[1]*s[3]*wac +
         s[2]*s[3]*wbc +
         s[3]*s[5]*wce +
         s[3]*s[4]*wcd +
         s[2]*s[5]*wbe +
         s[1]*s[4]*wad +
         s[4]*s[5]*wde )
}
ens5 <- apply(st5, 1, ef5)
staten5 <- cbind(st5, ens5)
staten5
