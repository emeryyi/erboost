\name{predict.erboost}
\alias{predict.erboost}
\title{ Predict method for erboost Model Fits }
\description{
  Predicted values based on a generalized boosted model object
}
\usage{
\method{predict}{erboost}(object,
        newdata,
        n.trees,
        type="link",
        single.tree=FALSE,
        ...)
}
\arguments{
  \item{object}{ Object of class inheriting from (\code{\link{erboost.object}}) }
  \item{newdata}{ Data frame of observations for which to make predictions }
  \item{n.trees}{ Number of trees used in the prediction. \code{n.trees} may
                  be a vector in which case predictions are returned for each
                  iteration specified}
  \item{type}{ The scale on which erboost makes the predictions }
  \item{single.tree}{If \code{single.tree=TRUE} then \code{predict.erboost} returns
                     only the predictions from tree(s) \code{n.trees}}
  \item{\dots}{ further arguments passed to or from other methods }
}
\details{
\code{predict.erboost} produces predicted values for each observation in \code{newdata} using the the first \code{n.trees} iterations of the boosting sequence. If \code{n.trees} is a vector than the result is a matrix with each column representing the predictions from erboost models with \code{n.trees[1]} iterations, \code{n.trees[2]} iterations, and so on.

The predictions from \code{erboost} do not include the offset term. The user may add the value of the offset to the predicted value if desired.

If \code{object} was fit using \code{\link{erboost.fit}} there will be no
\code{Terms} component. Therefore, the user has greater responsibility to make
sure that \code{newdata} is of the same format (order and number of variables)
as the one originally used to fit the model.
}
\value{

Returns a vector of predictions. By default the predictions are on the scale of f(x). For example, for the Bernoulli loss the returned value is on the log odds scale, poisson loss on the log scale, and coxph is on the log hazard scale.

If \code{type="response"} then \code{erboost} converts back to the same scale as the outcome. Currently the only effect this will have is returning probabilities for bernoulli and expected counts for poisson. For the other distributions "response" and "link" return the same.
}
\author{Greg Ridgeway \email{gregr@rand.org}}
\seealso{
\code{\link{erboost}}, \code{\link{erboost.object}}
}

\keyword{ models }
\keyword{ regression }