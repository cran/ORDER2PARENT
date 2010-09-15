\name{parentest}
\alias{parentest}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generate Smooth Estimator of Parent Distribution
}
\description{
Using the output from \code{blr} or \code{bgmm}, this function gives rise to estimates of parent cdf for any given value.
}
\usage{
parentest(x0, beta.hat, n.knots, degree = 3, support = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x0}{
the value whose parent cdf's are wanted. It can either be a scalar or a vector.
}
  \item{beta.hat}{
the estimate of control variables.
}
  \item{n.knots}{
the number of inner knots.
}
  \item{degree}{
the degree of B-spline. The default is 3, i.e. a cubic B-spline.
}
  \item{support}{
a vector specifying the support of the parent distribution. If unknown, it can be omitted, and the interval of data will be used as the support.
}
}
\details{
Together with \code{blr} and/or \code{bgmm}, this function can be estimate the parent cdf of any given value.
}
\value{
The estimates of parent cdf's of \code{x0}. NOTE that the degree used in \code{parentest} should be consistent with the degree used in estimation of control variables.
}
\seealso{
\code{\link{blr}}, \code{\link{bgmm}}
}
\examples{
n.order<-c(20, 20, 60)	# number of observations for each order statistic below.
m<-5	# the size of random samples is 5.
# The three order statistics are 1:5 (the minimum), 3:5 (the sample median), 
# and 5:5 (the maximum)
rank.x<-c(1, 3, 5)
data.example<-list()
for(i in 1:3){
sorted.sample<-t(apply(matrix(rnorm(m*n.order[i]),nr=n.order[i],nc=m), 1, sort))
data.example[[i]]<-sorted.sample[,rank.x[i]]
}
order.example<-rbind(c(1, 5), c(3, 5), c(5, 5), deparse.level=0)
blr.example<-blr(data.example, order.example)
# Based on 'blr.example', we can estimate the parent cdf of given values, like data.example[[3]]
parenthat<-parentest(data.example[[3]], blr.example$betahat, blr.example$n.knots)
}
