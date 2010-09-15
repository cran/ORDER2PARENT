\name{blr}
\alias{blr}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Parent Distribution Estimation with B-Spline Linear Regression Estimator
}
\description{
Given observations on several order statistics, this function use the B-Spline linear regression estimator (Chou and Tao, 2010) to estimate the corresponding parent distribution of these order statistics nonparametrically.

}
\usage{
blr(dat, orderinfo, degree = 3, support = NULL, constraint = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dat}{
a list consisting of the vectors of observations on various order statistics.
}
  \item{orderinfo}{
a matrix about the ranks and the sizes of various order statistics.
}
  \item{degree}{
the degree of B-spline used for estimation. The default is 3, i.e. cubic B-spline.
}
  \item{support}{
a vector specifying the support of the parent distribution. If unknown, it can be omitted, and the interval of data will be used as the support.
}
  \item{constraint}{
whether add monotone constraints in estimation. The default is no (FALSE).
}
}
\details{
The details about specifying the above arguments can be found in \code{bgmm}.
}
\value{
\code{blr} gives a list consisting of two element: \code{betahat} and \code{n.knots}. These two elements will be used in \code{parentest} for estimation of parent cdf.
}
%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{bgmm}}, \code{\link{parentest}}
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
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ Order Statistic }
\keyword{ ecdf }% __ONLY ONE__ keyword per line
