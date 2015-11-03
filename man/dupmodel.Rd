\name{dupmodel}
\alias{dupmodel}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Duplicate a selected model.
}
\description{
Create a copy of essential files from a selected model.
}
\usage{
dupmodel(path,
        path.new,
        modsp.file="model.spec.csv",
        model.file, 
        cols.file, 
        data,
        bat.file,
        model.file.new="test.mdl", 
        cols.file.new="cols1.txt", 
        data.new="data1.txt")

}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{path}{System path for location of the model to be duplicated}
  \item{path.new}{System path for location of destination folder.}
  \item{modsp.file}{An output file from  \code{\link{phxnlme}} that specifies the model file, column file, data file, and Phoenix NLME estimation method used in model run. If this file exists, the following arguments \emph{model.file},\emph{cols.file},\emph{data}, and \emph{bat.file} will be ignored.}
  \item{model.file}{Optional. A character string that provides the model file name (*.mdl). This argument will be ignored if \emph{modsp.file} exists.}
  \item{cols.file}{Optional. A character string that provides the name of the columns mapping file. This is an ASCII text file that contains a series of statements that define the association between model concepts and columns in a data set (Refer to Phoenix NLME manual).This argument will be ignored if \emph{modsp.file} exists.}
  \item{data}{Optional. A character string that provides the file name of the data file ( *.dat, *.csv or *.txt). This argument will be ignored if \emph{modsp.file} exists.}
  \item{bat.file}{Optional. A character string that provides the file name of the batch file. This argument will be ignored if \emph{modsp.file} exists.}
  \item{model.file.new}{A character string that provides the model file name (*.mdl) in the destination folder. Default is "test.mdl".}
  \item{cols.file.new}{A character string that provides the name of the columns mapping file in the destination folder. Default is "cols1.txt".}
  \item{data.new}{A character string that provides the file name of the data file in the destination folder. Default is "data1.txt".}
    
}

\author{
Shuang Liang
}
\examples{
if(!is.null(checkphxnlme(testchk=TRUE))){

## When modsp.file exists, specify path and destination path
path="C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 3"
path.new="C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME 
Command Line/Model 3/vpc_1"

## Duplicate model
dupmodel(path, path.new)

## When modsp.file does not exist, specify path, path.new, model.file, 
## cols.file, data, and bat.file
path="C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 3"
path.new="C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME
/Command Line/Model 3/vpc_1"
model.file="fm1theo.mdl"
cols.file="colstheo.txt" 
data="ThBates.csv" 
bat.file="RunNLME.bat"

## Duplicate model
dupmodel(path=path,path.new=path.new,model.file=model.file,cols.file=col.file
,data=data, bat.file=bat.file)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{}
%\keyword{}




