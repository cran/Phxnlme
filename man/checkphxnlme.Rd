\name{checkphxnlme}
\alias{checkphxnlme}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Checks for installation of Phoenix NLME}
\description{
The function checks for the presence of the license file within \cr
"C:/.../Pharsight/Phoenix/application/Plugins/DrugModelEffects/Executables"
}
\usage{
checkphxnlme(testchk=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{testchk}{
a logical value. If FALSE (default), performs check for presence of the license file. Otherwise skips test when license file is not found.}

}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
Value of 1 is returned if the file is found. Otherwise, error message is generated.
}
\author{
Chay Ngee Lim}
%\examples{
%}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ method }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
