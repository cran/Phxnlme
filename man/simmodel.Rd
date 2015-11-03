\name{simmodel}
\alias{simmodel}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Visual predictive check data simulation using Phoenix NLME based on user-provided parameter values.}
\description{
Users need to provide values for fixed and random effect parameters to simulate data, calculate statistics for visual predictive check, and collect the results. Arguments in this function are similar to those in  \code{\link{phxvpc.sim}}. In contrast to \code{\link{phxvpc.sim}}, there is no restriction on model file format. However, users will need to change the intial values of parameters to model final estimates, execute \code{\link{phxnlme}} before executing \emph{simmodel}. See the \strong{Examples} section for details.}
\usage{
simmodel(vpcpath,
         nsim=200,
         pstrat=NULL,
         setseed=NULL,
         pred.corr=NULL,
         var.corr=FALSE,
         pi=c(0.025,0.5, 0.975),
         pi.ci=c(0.025, 0.975),
         bin.option=NULL,
         bin.bound=NULL,
         bin.center=NULL,
         clean=FALSE,
         hold=FALSE,
         ivar="t",            
         model.file="test.mdl",
         cols.file="cols1.txt",
         data="data1.txt")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{vpcpath}{System directory where vpc simulation results will be stored. Users must specify this argument. }
\item{ivar}{Independent variable (x-axis). Default is "t", which is the independent variable when the structure model is set to any of Phoenix build-in PK models. Other options include "TAD", "PRED", or any user specified input. If user specified input is used, this variable must be in data set and defined in cols.file for model fit. }
\item{nsim}{An integer value specifying the number of simulation replicates. Default is 200.}
\item{pstrat}{A character vector that provides a maximum of 3 stratification variables. The vpc will stratify the data on unique values of the specified variable, and perform separate analyses on each set. Variables must be in data set and defined in cols.file for model fit. (Refer to Phoenix NLME manual for additional details regarding cols.file)
}
\item{setseed}{An integer value that provides a fixed seed for random resampling. If omitted, a random seed will be assigned automatically.
}
\item{pred.corr}{Optional. A character string specifying the options of how prediction correction is performed on dependent variable values before computing vpc results. Options are "proportional" or "additive", which can be shorten, with the minimal length of "prop" and "add", respectively. Not case sensitive. Default is NULL.}
\item{var.corr}{A logical value. If TRUE, perform variability correction on dependent variable values before computing vpc results. Default is FALSE. Note: this option is only functional when the argument \emph{pred.corr} is used.}
\item{pi}{Default is c(0.025,0.5, 0.975). A vector of values that describe the prediction percentile that should be calculated. The prediction percentiles are displayed by the Q.pred.line option in \code{\link{phxvpc.plot}}
}
\item{pi.ci}{Default is c(0.025, 0.975). A vector of two values that describe the confidence interval of the prediction percentile that should be calculated. These values are used to specify the boundaries of the CI.Q.pred option in \code{\link{phxvpc.plot}}
}
\item{bin.option}{A character string that provide the binning options for simulation. Default is NULL. Alternative options are "K-means", "centers", and "boundaries", which can be shorten, with the minimal length of "k", "cent", and "bound", respectively. Not case sensitive.}
\item{bin.bound}{A numeric vector that provides binning boundaries when bin.option "boundaries" is used. This option will be ignored when other bin.option is selected. Default is NULL.}
\item{bin.center}{A numeric vector that provides centers for all bins when bin.option "centers" is used. This option will be ignored when other bin.option is selected. Default is NULL.}
  \item{model.file}{A character string that provides the model file name (*.mdl). Defult is "test.mdl".}
  \item{cols.file}{A character string that provides the name of the columns mapping file. This is an ASCII text file that contains a series of statements that define the association between model concepts and columns in a data set (Refer to Phoenix NLME manual).Defult is "cols.txt".}
  \item{data}{A character string that provides the file name of the data file. This is an ASCII text file(*.txt). Default is "data.txt".}
\item{clean}{A logical value. Default is FALSE. If TRUE, the NLME executable file in the vpcpath folder will be deleted after model execution, the results cannot be updated/modified. If FALSE, it makes possible to apply other estimation/simulation functions in the same folder.}
\item{hold}{A logical value that determines command window behavior. Currently, it is not implemented.}
}

\details{
In order to perform visual predictive check, final model estimates must be applied as initial estimates in the model control file. \code{\link{phxnlme}} must be executed before using  \code{\link{simmodel}}.
}
%\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
%}
%\references{
%% ~put references to the literature/web site here ~
%}
\author{
Shuang Liang}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{
## Run model fit
if(!is.null(checkphxnlme(testchk=TRUE))){

path="C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 5"
model.file="pheno2.mdl"
cols.file="colspheno2.txt" 
data="pheno2.csv" 
phxnlme(path=path,model.file=model.file,cols.file=cols.file,data=data)

## Manually create directory for duplicate model
dir.create(paste("C:/Program Files (x86)/Pharsight/Phoenix/application/"
           ,"Examples/NLME Command Line/Model 3/vpc_1",sep=""))
           
## Duplicate the model
path.new=paste("C:/Program Files (x86)/Pharsight/Phoenix/application/"
           ,"Examples/NLME Command Line/Model 3/vpc_1",sep="")
dupmodel(path, path.new)

## After duplicating model, change parameter intial vaules in .mdl file 
## to the final parameter estimates obtained from running model fit.

simmodel(vpcpath=path.new)

## Change confidence interval of prediction percentiles
simmodel(vpcpath=path.new, pi.ci=c(0.05, 0.95))

## Bin by boundaries
simmodel(vpcpath=path.new, bin.option="bound", bin.bound=c(0, 0.5, 4, 8, 12))
}

if(!is.null(checkphxnlme(testchk=TRUE))){

## For models not using build-in PK structure model
## Run model fit
path="C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 1"
model.file="lyon04.mdl"
cols.file="COLS04.txt" 
data="EMAX02.csv" 
phxnlme(path=path,model.file=model.file,cols.file=cols.file,data=data)

dupmodel(path, path.new)

## After duplicating model, change parameter intial vaules in .mdl file 
## to the final parameter estimates obtained from running model fit.
simmodel(vpcpath=path.new, ivar="DOSE")

## Stratified VPC, 1 covariate
simmodel(path, ivar="DOSE", pstrat="FEMALE")

## Stratified VPC, 3 covariates (covariates must be included in data and cols.file)
simmodel(path, pstrat=c("SEX", "AGE", "DOSE"))
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
