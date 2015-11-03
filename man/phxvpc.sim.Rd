\name{phxvpc.sim}
\alias{phxvpc.sim}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Visual predictive check data simulation using Phoenix NLME based on final parameter estimates.}
\description{
Use final parameter estimates of a model to simulate data, calculate statistics for visual predictive check, and collect the results. \cr
\strong{Important Note:} in the current version of phxvpc.sim, the model.file (.mdl) must follow a specific format. \cr
See the \strong{Details} section: \strong{Instruction on model file.} }
\usage{
phxvpc.sim(path, 
            vpcpath=NULL,
            ivar="t",
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
            modsp.file="model.spec.csv",
            out.file="out0001.txt",
            clean=FALSE,
            hold=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{path}{System directory for location of the model run folder}
\item{vpcpath}{System directory where vpc simulation results will be stored. If NULL(default), a subfolder vpc n will be created under the model run folder (path), in which n is a number. If vpc n subfolder already exists, n will automatically increase by 1 until no identical existing folder can be found. }
\item{ivar}{Independent variable (x-axis). Default is "t", which is the independent variable when the structure model is set to any of Phoenix build-in PK models. Other options include "TAD", "PRED", or any user specified input. If user specified input is used, this variable must be in data set and defined in cols.file for model fit. }
\item{nsim}{An integer value specifying the number of simulation replicates. Default is 200.}
\item{pstrat}{A character vector that provides a maximum of 3 stratification variables. The vpc will stratify the data on unique values of the specified variable, and perform separate analyses on each set. Variables must be in data set and defined in cols.file for model fit. (Refer to Phoenix NLME manual for additional details regarding cols.file)
}
\item{setseed}{An integer value that provides a fixed seed for random resampling. If omitted, a random seed will be assigned automatically.
}
\item{pred.corr}{Optional. A character string specifying the options of how prediction correction is performed on dependent variable values before computing vpc results. Options are "proportional" or "additive", which can be shorten, with the minimal length of "prop" and "add", respectively. Not case sensitive. Default is NULL.}
\item{var.corr}{A logical value. If TRUE, perform variability correction on dependent variable values before computing VPC results. Default is FALSE. Note: this option is only functional when the argument \emph{pred.corr} is used.}
\item{pi}{Default is c(0.025,0.5, 0.975). A vector of values that describe the prediction percentile that should be calculated. The prediction percentiles are displayed by the Q.pred.line option in \code{\link{phxvpc.plot}}
}
\item{pi.ci}{Default is c(0.025, 0.975). A vector of two values that describe the confidence interval of the prediction percentile that should be calculated. These values are used to specify the boundaries of the CI.Q.pred option in \code{\link{phxvpc.plot}}
}
\item{bin.option}{A character string that provide the binning options for simulation. Default is NULL. Alternative options are "K-means", "centers", and "boundaries", which can be shorten, with the minimal length of "k", "cent", and "bound", respectively. Not case sensitive.}
\item{bin.bound}{A numeric vector that provides binning boundaries when bin.option "boundaries" is used. This option will be ignored when other bin.option is selected. Default is NULL.}
\item{bin.center}{A numeric vector that provides centers for all bins when bin.option "centers" is used. This option will be ignored when other bin.option is selected. Default is NULL.}
\item{clean}{A logical value. Default is FALSE. If TRUE, the NLME executable file in the vpcpath folder will be deleted after model execution, the results cannot be updated/modified. If FALSE, it makes possible to apply other estimation/simulation functions in the same folder.}
\item{hold}{A logical value that determines command window behavior. Currently, it is not implemented.}
\item{modsp.file}{An output file from  \code{\link{phxnlme}} that specifies the model file, column file, data file, and Phoenix NLME estimation method used in model run. This file is required.}
\item{out.file}{An output file from  \code{\link{phxnlme}} that contains the final parameter estimates of model run. This file is required so that final parameter estimates can be obtained to simulate data. }
}

\details{
 \code{\link{phxnlme}} must be executed before using  \code{\link{phxvpc.sim}}.

\strong{Instruction on model file} Model file (.mdl) must follow a certain format for phxvpc.sim to use final model estimates for simulation. First, the following blocks (fixed, ranef, stparm, error, observe) must be in the order of fixed->ranef(optional)->stparm->error->observe. Second, if the ranef block only contains diagnal elements, each element must be in a separate row. Examples are as following: 

##correct format of model file:
\preformatted{
test(){ 
    covariate(FEMALE) 
    covariate(DOSE)        ##no restriction for covariate 
    fixef(
        tvE0       = c(, 20,)
        tvEMAX     = c(, 120,)
        ED50MALE   = c(, 15,)
  	    ED50FACTOR = c(,  1,)
        )
    ranef(
    ## each element must be in a separate row
		diag(nE0, nEMAX, nED50) = c(1,
                                1, 
                                1)
		)
    stparm(
        E0     = tvE0     * exp(nE0)
        EMAX   = tvEMAX   * exp(nEMAX)
        ED50   = ED50MALE * exp(nED50) * ED50FACTOR^FEMALE
        )
    E = E0 + EMAX * DOSE / (DOSE + ED50)
    error (EPS1 = 10)
    observe(EOBS = E + EPS1)
    }
}
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
## Note: .mdl file must be in the format as specified in the details section.
## Alternatively, use simmodel for VPC simulation.
## Note that pheno2.mdl needs to be modified to follow the specified format prior to
## running examples below

if(!is.null(checkphxnlme(testchk=TRUE))){
path="C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 5"
model.file="pheno2.mdl"
cols.file="colspheno2.txt" 
data="pheno2.csv" 

## Run model fit
phxnlme(path=path,model.file=model.file,cols.file=cols.file,data=data)

## VPC simulation 
#phxvpc.sim(path)
}

## Change confidence interval of prediction percentiles
#phxvpc.sim(path, pi.ci=c(0.05, 0.95))

## Bin by boundaries
#phxvpc.sim(path, bin.option="bound", bin.bound=c(0, 0.5, 4, 8, 12))

## Note: lyon04.mdl needs to be modified to specified format prior to running example below
## For models not using build-in PK structure model
## Run model fit
if(!is.null(checkphxnlme(testchk=TRUE))){
path="C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 1"
model.file="lyon04.mdl"
cols.file="COLS04.txt" 
data="EMAX02.csv" 
phxnlme(path=path,model.file=model.file,cols.file=cols.file,data=data)

#phxvpc.sim(path, ivar="DOSE")

## Stratified VPC, 1 covariate
#phxvpc.sim(path, ivar="DOSE", pstrat="FEMALE")

## Stratified VPC, 3 covariates (covariates must be included in bot data and cols.file)
#phxvpc.sim(path, pstrat=c("SEX", "AGE", "DOSE"))
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
