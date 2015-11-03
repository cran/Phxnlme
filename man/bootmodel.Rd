\name{bootmodel}
\alias{bootmodel}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Nonparametric bootstrap}
\description{
Execute model bootstrapping and collect parameter estimation results.}
\usage{
bootmodel(model = NULL, 
          nodes = NULL, 
          method = 5, 
          niter = 1000, 
          nboot = 500, 
          bstrat = NULL, 
          setseed = NULL, 
          clean = TRUE, 
          hold = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{
a character string for name of model folder}
  \item{nodes}{an integer value that specifies the number of processors to use. Default is no parallel processing. 
}
  \item{method}{
Phoenix NLME estimation method (for more details refer to Phoenix NLME manuals), default method is 5 (FOCE-ELS)}
  \item{niter}{
an integer value that limits the maximum number of iterations during the mode execution (default is 1000).}
  \item{nboot}{
an integer value that provides the number of bootstrap samples (default is 200). Maximum number of bootstrap samples is 9999.}
  \item{bstrat}{
a character vector that provides a maximum of 3 stratification variables.}
  \item{setseed}{
an integer value that provides a fixed seed for random resampling. If omitted, seed will be assigned automatically.}
  \item{clean}{
a logical value. If TRUE (default), the NLME executable file will be deleted after model execution, the results cannot be updated/modified. If FALSE, it makes possible to apply other estimation/simulation functions to the same model and collect the results in the same sub-folder.}
  \item{hold}{
a logical value that determines whether the command window closes automatically after model execution or needs to be closed manually. Default is FALSE. TRUE option is currently unavailable.}

}
\details{
\code{\link{phxnlme}} needs to be executed prior to \code{\link{bootmodel}}. Working directory should be set to the folder containing Phoenix NLME output.
 }
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
.csv file of bootstrap results are returned.
}
\references{
Phoenix Modeling Language Reference Guide \cr
Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap. Chapman and Hall, New
York, London.
}
\author{
Chay Ngee Lim}

\examples{
if(!is.null(checkphxnlme(testchk=TRUE))){
## Setting working directory to Model 1 
path="C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 1"
model.file="lyon04.mdl"
cols.file="COLS04.txt" 
data="EMAX02.csv" 

## Run model fit
phxnlme(path=path,model.file=model.file,cols.file=cols.file,data=data)

## Run bootstrap
bootmodel(model="Model 1",setseed=NULL,clean=FALSE,hold=FALSE,nboot=50)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ method }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
