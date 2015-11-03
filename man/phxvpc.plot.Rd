\name{phxvpc.plot}
\alias{phxvpc.plot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Create visual predictive check plot.}
\description{This function is used to create a VPC plot using the output from the \emph{phxvpc.sim} function. The function reads in the output files created by \emph{phxvpc.sim} and creates a plot. The dependent variable, independent variable and stratification variable are automatically
determined from the  \emph{phxvpc.sim} output files.
}
\usage{
phxvpc.plot(vpcpath="",
            xlab=NULL,
            ylab=NULL,
            xlab.cex=1.3,
            ylab.cex=1.3,
            x.cex=1.3,
            y.cex=1.3,
            main.title=NULL,
            main.cex=1.3,
            xlim=NULL,
            ylim=NULL,
            obs.pt=FALSE,
            obs.pch=16,
            logY=FALSE,
            Q.obs.line=TRUE,
            Q.pred.line=TRUE,
            CI.Q.pred="area",
            CI.Q.pred.area1="pink",
            CI.Q.pred.area2="grey",
            ppp=4,
            legend=T,
            result.path=NULL,
            pred.corr=FALSE,
            data.obs=NULL,
            data.Q.obs=NULL,
            data.Q.pred=NULL,
            data.Q.CI.pred=NULL)
}%- maybe also 'usage' for other objects documented here.
\arguments{
\item{vpcpath}{A system directory where vpc simulation results are stored. It should be the same directory as specified in the \emph{vpcpath} argument in \emph{phxvpc.sim} }
\item{xlab}{A title for the x-axis.}
\item{ylab}{A title for the y-axis.}
\item{xlab.cex}{Font size for the x-axis title.}
\item{ylab.cex}{Font size for the y-axis title.}
\item{x.cex}{Font size for the x-axis label.}
\item{y.cex}{Font size for the y-axis label.}
\item{main.title}{A title for the vpc plot.}
\item{main.cex}{Font size for the vpc plot main title.}
\item{xlim}{A numerical vector specifying x-axis limits}
\item{ylim}{A numerical vector specifying y-axis limits}
\item{obs.pt}{A logical value indicating whether observed data points will be presented. Default is FALSE.}
\item{obs.pch}{A numerical value specifying the symbol to use when plotting observation data points.}
\item{logY}{A logical value indicating whether y-axis should be log transformed. Default is FALSE.}
\item{Q.obs.line}{A logical value indicating whether lines for observation percentiles will be presented. Default is TRUE.}
\item{Q.pred.line}{A logical value indicating whether lines for prediction percentiles will be presented. Default is TRUE.}
\item{CI.Q.pred}{A string of either "lines" or "area" (default) specifying whether the confidence intervals of prediction percentiles (as lines or a shaded area) should be added to the plot. NULL means no confidence intervals for prediction percentiles.}
\item{CI.Q.pred.area1}{A string specifying the color of the shaded area of the confidence intervals for 50th prediction percentile.}
\item{CI.Q.pred.area2}{A string specifying the color of the shaded area of the confidence intervals for 5th and 95th prediction percentiles.}
\item{ppp}{Panel per page. Either 1 or 4 (default) specifying the number of panels per page when multiple panels are generated as a result of stratification.}
\item{legend}{A logical value indicating whether figure legend will be presented. Default is TRUE.
}
\item{result.path}{A system directory where vpc plot will be stored. If NULL (default), it will be set as "../Results", in which ".." is the parent folder of the vpcpath folder.}
\item{pred.corr}{Predition corrected VPC is not yet implemented in this function.}
\item{data.obs}{Optional. Default is NULL. Observed data points.}
\item{data.Q.obs}{Optional. Default is NULL. Data of bservation quantiles.}
\item{data.Q.pred}{Optional. Default is NULL. Data of predicted quantiles.}
\item{data.Q.CI.pred}{Optional. Default is NULL. Data of confidence intervals for predicted quantiles.}
}

\details{
\link{phxvpc.sim} must be first executed. The vpc plot will be a pdf file with the same name as the folder that contains \emph{phxvpc.sim} output. The pdf plot will be stored in the folder specified by the \emph{result.path} argument. 
}

\value{
A plot or a list of plots.
}
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
## Note: before plotting, first run model fit using phxnlme, 
## next perform VPC simulation using either phxvpc.sim or simmodel.
#setwd("C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 3")
#phxvpc.plot(vpcpath="vpc_1")
## or
#phxvpc.plot(vpcpath="C:/Program Files (x86)/Pharsight/Phoenix
#/application/Examples/NLME Command Line/Model 3/vpc_1")

## without showing lines for percentiles of the observation data points
#phxvpc.plot(vpcpath="vpc_1", Q.obs.line=F)

## showing lines for predicted percentiles
#phxvpc.plot(vpcpath="vpc_1", Q.pred.line=T)

## using lines instead of shaded area to indicate the confidence
## intervals for the predicted percentiles
#phxvpc.plot(vpcpath="vpc_1", CI.Q.pred="lines")

## changing color of shaded area
#phxvpc.plot(vpcpath="vpc_1", CI.Q.pred="area", CI.Q.pred.area1="green", CI.Q.pred.area2="yellow")

## changing x-axis limits
#phxvpc.plot(vpcpath="vpc_1", xlim=c(0,10))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
