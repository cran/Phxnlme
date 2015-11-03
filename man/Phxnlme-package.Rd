\name{Phxnlme-package}
\alias{Phxnlme-package}
\docType{package}
\title{
Package 'Phxnlme'
}
\description{
The Phxnlme package implements the Phoenix NLME program as a nonlinear mixed effects modeling tool, for pharmacokinetic and pharmacodynamic analysis. It provides access to several Maximum Likelihood engines to perform individual, population, and pooled data analyses. Nonparametric bootstrap, visual predictive checks and diagnostic and exploratory plots are options that are also provided in this package.
}
\details{
\tabular{ll}{
Package: \tab Phxnlme\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2015-10-12\cr
License: \tab GPL-2\cr
}
}
\author{
Chay Ngee Lim <limxx356@umn.edu>
}
\references{
Phoenix NLME User Guide\cr
Phoenix Modeling Language Reference Guide}
\keyword{ package }
\examples{
data(ex1phxd)
phxd=ex1phxd
phxplot(phxd=phxd,plot.type="residual.scatter",outpdf=FALSE)
}
