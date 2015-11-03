\name{phxplot}
\alias{phxplot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Plotting of Phoenix NLME output}
\description{
Several plots, selectable by the argument \emph{plot.type} are currently available: observations versus predictions, correlation, residuals, parameter distribution, forest plots, and individual and dynamic individual fits.}
\usage{
phxplot(phxd = NULL, 
        plot.type, 
        cat.cov, 
        cont.cov,
        forest.ci = c(0.025, 0.5, 0.975), 
        multip = TRUE, 
        outpdf = TRUE, 
        scale = NULL, 
        sel.ID, 
        sparname)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{phxd}{Phoenix NLME plot object. Default of NULL requires working directory to be set to model folder so Phoenix NLME output can be read.}
  \item{plot.type}{A character string specifying the type of plot needed:\cr
  
\strong{"correlation"}- Correlation matrix plots of parameters. \cr

\strong{"obs.pred"} - Scatterplots of observations versus prediction with loess smoothed line.\cr

\strong{"residual.scatter"} - Scatterplots of weighted residual and conditional weighted versus predictions and time after dose (if applicable)\cr

\strong{"param.catcov"} - Boxplots of parameters versus categorical covariates. Argument \emph{cat.cov} has to be defined and empirical bayes estimates of parameters have to be requested (see \emph{cat.cov} and \code{\link{phxnlme}}). \cr

\strong{"param.contcov"} - Scatterplots of parameters versus continuous covariates. Argument \emph{cont.cov} has to be defined and empirical bayes estimates of parameters have to be requested (see \emph{cont.cov} and \code{\link{phxnlme}}).\cr 

\strong{"param"} - Histograms of parameters. Empirical bayes estimates of parameters have to be requested (see \code{\link{phxnlme}}). See also \emph{multip}.\cr

\strong{"forest"} - Forest/tornado plots of specified categorical covariates and parameters. Argument \emph{cat.cov} and  \emph{sparname} need to be defined and empirical bayes estimates of parameters have to be requested (see \emph{cat.cov}, \emph{sparname} and \code{\link{phxnlme}}). Note: Quantiles are computed from post-hoc values of the parameters.\cr

\strong{"ind"} - Individual fits. \cr

\strong{"ind.dynamic"} - Dynamic plots of individual fits. Only one subject can be dynamically plotted at a time. Requires specification of ID (see \emph{sel.ID}).  \cr

\strong{"qq"} - Correlation matrix plots of parameters. Argument \emph{cat.cov} has to be defined and empirical bayes estimates of parameters have to be requested (see \emph{cat.cov} and \code{\link{phxnlme}}). Note: Quantiles are computed from post-hoc values of the parameters.\cr
}
  \item{cat.cov}{
A vector of character strings, specifying categorical covariates in the dataset to be plotted. Required for forest and parameters versus categorical covariate plots (see \emph{plot.type}).}
  \item{cont.cov}{
A vector of character strings, specifying continuous covariates in the dataset to be plotted. Required for parameters versus continuous covariate plots (see \emph{plot.type})}
  \item{forest.ci}{
A vector of numeric values, specifying the required quantiles for forest plot (see \emph{plot.type}). Default is c(0.025,0.5,0.975). }
  \item{multip}{
A logical value that specifies if multiple parameter histograms will be generated on one page. Default is TRUE.}
  \item{outpdf}{
A logical value that specifies if output will be generated as .pdf file. Default is TRUE.}
  \item{scale}{
A character string that specifies "log" if log scale is required for observation versus prediction plots or individual plots. Default is NULL.}
  \item{sel.ID}{
A numeric value that specifies the subject ID for dynamic individual plot. See \emph{plot.type}}
  \item{sparname}{
A vector specifying the parameters to be plotted on forest plot. See \emph{plot.type}  }
}
\details{
Working directory should be set to the folder containing Phoenix NLME output. Graphical output (*pdf) are copied to Results folder within working directory.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
Returns plots.
}
%\references{
%% ~put references to the literature/web site here ~
%}
\author{
Chay Ngee Lim}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{
## Residual plots for Model 1 
## Setting working directory
#setwd("C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 1")
#phxplot(plot.type="residual.scatter",outpdf=FALSE)

## Residual plots for example 1
## Loading example 1 database
data(ex1phxd)
ex1=ex1phxd

phxplot(phxd=ex1,plot.type="residual.scatter",outpdf=FALSE)

## Observations versus prediction plots
phxplot(phxd=ex1,plot.type="obs.pred",outpdf=FALSE)

## Observations versus prediction plots on double log scale
phxplot(phxd=ex1,plot.type="obs.pred",scale="log",outpdf=FALSE) 

## Correlation of parameters
phxplot(phxd=ex1,plot.type="correlation",outpdf=FALSE) 

## Histograms of parameters
phxplot(phxd=ex1,plot.type="param",outpdf=FALSE) 

phxplot(phxd=ex1,plot.type="param.contcov",cont.cov="WT",outpdf=FALSE) 

## Individual fits on log y scale
phxplot(phxd=ex1,plot.type="ind",scale="log",outpdf=FALSE)

## Dynamic plot of individual fit; requires Rstudio
#phxplot(phxd=ex1,plot.type="ind.dynamic",sel.ID=39) 

## QQ plots of parameters
phxplot(phxd=ex1,plot.type="qq",outpdf=FALSE)

## Forest plots and boxplots of parameters versus categorical covariates for Model 1
#setwd("C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 1")
#phxplot(plot.type="forest",cat.cov=c("sex","age"),sparname=c("E0","EMAX")) 
#phxplot(plot.type="param.catcov",cat.cov=c("sex","dose")) 
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
