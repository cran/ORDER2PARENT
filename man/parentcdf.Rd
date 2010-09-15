\name{parentcdf}
\alias{parentcdf}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Transform CDF of Order Statistics to Its Parent CDF
}
\description{
Using the well relationship between the cdf of order statistic and the cdf of parent distribution, this function can transform the the cdf of order statistic to the corresponding parent cdf.
}
\usage{
parentcdf(F.order, k, m)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{F.order}{
CDF of order statistic, either a scalar or a vector.
}
  \item{k}{
the rank of the order statistic
}
  \item{m}{
the size of the order statistic
}
}
\details{
Use the well known relationship (David and Nagaraja, 2003) between the cdf of order statistic and the parent distribution, \code{parentcdf} will return the corresponding parent distribution.
}
\value{
The corresponding parent distribution.
}
\references{
David, H.A., and Nagaraja, H.N. (2003): Order Statistics, Third Edition. New York: Wiley.
}
