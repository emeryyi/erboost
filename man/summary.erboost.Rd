\name{summary.erboost}
\alias{summary.erboost}
\title{ Summary of a erboost object }
\description{
Computes the relative influence of each variable in the erboost object.
}
\usage{
\method{summary}{erboost}(object,
        cBars=length(object$var.names),
        n.trees=object$n.trees,
        plotit=TRUE,
        order=TRUE,
        method=relative.influence,
        normalize=TRUE,
        ...)
}
\arguments{
\item{object}{a \code{erboost} object created from an initial call to
\code{\link{erboost}}.}
\item{cBars}{ the number of bars to plot. If \code{order=TRUE} the only the
variables with the \code{cBars} largest relative influence will appear in the
barplot. If \code{order=FALSE} then the first \code{cBars} variables will
appear in the plot. In either case, the function will return the relative
influence of all of the variables.}
\item{n.trees}{ the number of trees used to generate the plot. Only the first
\code{n.trees} trees will be used.}
\item{plotit}{ an indicator as to whether the plot is generated. }
\item{order}{ an indicator as to whether the plotted and/or returned relative
influences are sorted. }
\item{method}{ The function used to compute the relative influence.
\code{\link{relative.influence}} is the default and is the same as that
described in Friedman (2001). The other current (and experimental) choice is
\code{\link{permutation.test.erboost}}. This method randomly permutes each predictor
variable at a time and computes the associated reduction in predictive
performance. This is similar to the variable importance measures Breiman uses
for random forests, but \code{erboost} currently computes using the entire training
dataset (not the out-of-bag observations.}
\item{normalize}{ if \code{FALSE} then \code{summary.erboost} returns the 
unnormalized influence. }
\item{...}{ other arguments passed to the plot function. }
}
\details{
For \code{distribution="gaussian"} this returns exactly the reduction 
of squared error attributable to each variable. For other loss functions this 
returns the reduction attributeable to each varaible in sum of squared error in 
predicting the gradient on each iteration. It describes the relative influence 
of each variable in reducing the loss function. See the references below for 
exact details on the computation.
}
\value{
Returns a data frame where the first component is the variable name and the
second is the computed relative influence, normalized to sum to 100.
}
\references{
J.H. Friedman (2001). "Greedy Function Approximation: A Gradient Boosting
Machine," Annals of Statistics 29(5):1189-1232.

L. Breiman (2001). "Random Forests," Available at \url{ftp://ftp.stat.berkeley.edu/pub/users/breiman/randomforest2001.pdf}.

}
\author{Greg Ridgeway \email{gregr@rand.org}}

\seealso{ \code{\link{erboost}} }

\keyword{ hplot }