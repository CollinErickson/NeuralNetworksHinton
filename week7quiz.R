wxh=.5
whh=-1
why=-.7
sig <- function(k) {1/(1+exp(-k))}
x0 <- 9
x1 <- 4
x2 <- -2
h0 <- sig(wxh*x0)
h1 <- sig(wxh*x1 + whh*h0)
h2 <- sig(wxh*x2 + whh*h1)


sig <- function(k) {1/(1+exp(-k))}
Wxh <- -.1
Whh <- .5
Why <- .25
hbias <- .4
ybias <- 0
x0 <- 18
x1 <- 9
x2 <- -8
z0 <- Wxh*x0+hbias
h0 <- sig(z0)
z1 <- Wxh*x1+hbias + Whh*h0
h1 <- sig(z1)
z2 <- Wxh*x2+hbias + Whh*h1
h2 <- sig(z2)
t0 <- 0.1
t1 <- -.1
t2 <- -.2
y2 <- Why*h2 + ybias
# dE/dz2 = dE/dy2 * dy2/dh2 * dh2/dz2
dEdy2 <- -(t2-y2)
dy2dh2 <- Why
dh2dz2 <- sig(z2)*(1-sig(z2))
dEdz2 <- dEdy2 *dy2dh2 * dh2dz2
dEdz2






# second attempt, first was wrong, second was right
wxh <- .5
whh <- -1
why <- -.7
sig <- function(k) {1/(1+exp(-k))}
x0 <- 9
x1 <- 4
x2 <- -2
hbias <- -1
ybias <- 0
h0 <- sig(wxh*x0 + hbias)
h1 <- sig(wxh*x1 + whh*h0 + hbias)
h2 <- sig(wxh*x2 + whh*h1 + hbias)


sig <- function(k) {1/(1+exp(-k))}
Wxh <- -.1
Whh <- .5
Why <- .25
hbias <- .4
ybias <- 0
x0 <- 18
x1 <- 9
x2 <- -8
z0 <- Wxh*x0+hbias
h0 <- sig(z0)
z1 <- Wxh*x1+hbias + Whh*h0
h1 <- sig(z1)
z2 <- Wxh*x2+hbias + Whh*h1
h2 <- sig(z2)
t0 <- 0.1
t1 <- -.1
t2 <- -.2
y0 <- Why*h0 + ybias
y1 <- Why*h1 + ybias
y2 <- Why*h2 + ybias
# dE/dz2 = dE/dy2 * dy2/dh2 * dh2/dz2
dEdy2 <- -(t2-y2)
dy2dh2 <- Why
dh2dz2 <- sig(z2)*(1-sig(z2))
dEdz2 <- dEdy2 *dy2dh2 * dh2dz2
dEdz2
# now it is dE/dz1
# dE/dz1 = dE1/dz1 + dE2/dz1
# dE1/dz1 = dE1/dy1 * dy1/dh1 * dh1/dz1
dE1dy1 <- (t1-y1)
dy1dh1 <- Why
dh1dz1 <- sig(z1) * (1-sig(z1))
dE1dz1 <- dE1dy1 * dy1dh1 * dh1dz1
# dE2/dz1 = dE2/dy2 * dy2/dh2 * dh2/dz2 * dz2/dh1 * dh1/dz1
dE2dy2 <- (t2-y2)
dy2dh2 <- Why
dh2dz2 <- sig(z2)*(1-sig(z2))
dz2dh1 <- Whh
dE2dz1 <- dE2dy2 * dy2dh2 * dh2dz2 * dz2dh1 * dh1dz1
dEdz1 <- dE1dz1 + dE2dz1
dEdz1
