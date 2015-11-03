\name{phxnlme}
\alias{phxnlme}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Run Phoenix NLME
}
\description{
Run the specified model file and dataset using Phoenix NLME
}
\usage{
phxnlme(inst.path = NULL, path, model.file, cols.file, data, method, iterlimit)

}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{inst.path}{Default of NULL sets the Phoenix installation path to the default of: "C:/Program Files (x86)/Pharsight/Phoenix"}
  \item{path}{System path for location of the model run folder}
  \item{model.file}{A character string that provides the model file name (*.mdl)}
  \item{cols.file}{A character string that provides the name of the columns mapping file. This is an ASCII text file that contains a series of statements that define the association between model concepts and columns in a data set (Refer to Phoenix NLME manual).}
  \item{data}{A character string that provides the file name of the data file ( *.dat, *.csv or *.txt). Note that ID column needs to be the first column.}
  \item{method}{Phoenix NLME estimation method (refer to Phoenix NLME manual).\cr
  1=QRPEM (Quasi-Random Parametric expectation-maximization)\cr
  2=IT2S-EM (Iterated 2-stage expectation-maximization)\cr
  3=FOCE L-B (First-Order Conditional Estimation, Lindstrom-Bates)\cr
  4=FO (First Order)\cr
  5=General likelihood engine. Default method is FOCE-ELS\cr 
  6=Naive pooled}
  \item{iterlimit}{An integer between 0 and 10000 that specifies the maximum number of iterations to run the main optimization routine (default is 1000). If maxiterations= 0, no optimization is run but the model is evaluated at the initial solution defined in the model file or restart file. 
}
}
\details{
Model folder containing the model file, columns mapping file and dataset has to be set up prior to model run. Valid license for Phoenix NLME required.\cr

Request of empirical bayes estimates of parameters required. E.g. include the following statement in the columns mapping file:\cr
table(file="parmtable.csv",V,Cl)\cr

(see Phoenix Modeling Language Reference Guide for details)}
%\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
%}
\references{
Phoenix Modeling Language Reference Guide
}
\author{
Chay Ngee Lim 
}
\note{
For Phoenix installation at locations other than the default, please specify its location. Example where installation path is "C:/Program Files/Pharsight/Phoenix":\cr
phxnlme(inst.path="C:/Program Files/Pharsight/Phoenix",path=path,model.file=model.file,cols.file=cols.file,data=data)
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{
## Specify model folder path, model.file, cols.file and data
if(!is.null(checkphxnlme(testchk=TRUE))){
path="C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 1"
model.file="lyon04.mdl"
cols.file="COLS04.txt" 
data="EMAX02.csv" 

## Run model fit
phxnlme(path=path,model.file=model.file,cols.file=cols.file,data=data)
}
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{Regression}
\keyword{Non-linear Regression}
\keyword{Models}



