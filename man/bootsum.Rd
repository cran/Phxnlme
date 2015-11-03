\name{bootsum}
\alias{bootsum}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Bootstrap summary }
\description{
Summarize results from nonparametric bootstrap and produce histograms for each parameters. }
\usage{
bootsum(model = NULL, 
        outpdf = TRUE, 
        bootfl = "out0002.csv", 
        qtype = 7, 
        min = TRUE, 
        showmean = FALSE, 
        showmedian = TRUE, 
        showcinorm = FALSE, 
        showci = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{
Name of folder containing model}
  \item{outpdf}{
A logical value. If TRUE (default), graphical output will be saved as PDF file. }
  \item{bootfl}{
A character string that provides the file name of the bootmodel output. Default is "out0002.csv".}
  \item{qtype}{
An integer value that provides type argument for quantiles calculation (see quantile{stats}). Default is 7.}
  \item{min}{
A logical value. If TRUE (default), minimization summary will be included on graphical output.}
  \item{showmean}{
A logical value. If FALSE (default), mean line will not be displayed on graphical output.}
  \item{showmedian}{
A logical value. If TRUE (default), median line will be displayed on graphical output.}
  \item{showcinorm}{
A logical value. If FALSE (default), 95 percent confidence intervals based on normal assumption will not be displayed on graphical output.}
  \item{showci}{
A logical value. If TRUE (default), 95 percent confidence intervals based on 2.5th and 97.5th percentile will be displayed on graphical output.}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
Distribution plots and summary files are returned.
}
\author{
Chay Ngee Lim}
\examples{
## Setting working directory to Model 1 
#setwd("C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 1")

## Create summary of bootstrap runs
#bootsum(model="Model 1")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ method }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
