\name{bgmm}
\alias{bgmm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Parent Distribution Estimation with B-Spline GMM Estimator
}
\description{
Given observations on several order statistics, this function use the B-Spline GMM Estimator (Chou and Tao, 2010) to estimate the corresponding parent distribution of these order statistics nonparametrically.
}
\usage{
bgmm(dat, orderinfo, degree = 3, support = NULL, weight.type = 1)
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
  \item{weight.type}{
the type of weight matrix used in implementing the GMM estimator. The default is 1, i.e. the weight matrix based on sample size.
}
}
\details{
The \code{dat} must be a list consisting of vectors of observations on order statistics. For example, there are three order statistics, and the observations on them are contained in three vectors, \code{dat.order1}, \code{dat.order2}, and \code{date.order3}. Then a typical \code{dat} is \code{list(dat.order1, dat.order2, dat.order 3)}. 
\\
\code{orderinfo} must be a matrix with two columns and J rows where J is the number of observed order statistics. For j-th row of \code{orderinfo}, the first column is the rank, and the second column is the size of the j-th order statistic.
\\
\code{support} is vector whose first element is the lower bound of the support, and the second element is the upper bound. If you want to use the second type of weight matrix, which is based on mean square error of the first stage estimates, set \code{weight.type=2}.
}
\value{
\code{bgmm} gives a list consisting of two element: \code{betahat} and \code{n.knots}. These two elements will be used in \code{parentest} for estimation of parent cdf.
}

\seealso{
\code{\link{blr}}, \code{\link{parentest}}
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
gmm.example<-bgmm(data.example, order.example)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ Order Statistic }
\keyword{ ecdf }% __ONLY ONE__ keyword per line
