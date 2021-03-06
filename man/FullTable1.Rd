% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FullTable1.R
\name{FullTable1}
\alias{FullTable1}
\title{Create Table1 of group summary with stats for scientific publication}
\usage{
FullTable1(
  data,
  strata = NULL,
  vars = NULL,
  var_names = vars,
  factor_vars = NULL,
  round_n = 2,
  es_col = c(TRUE, FALSE),
  p_col = c(TRUE, FALSE),
  stars = c("col", "name", "stat", "none"),
  html = c(FALSE, TRUE)
)
}
\arguments{
\item{data}{The input dataset (will be converted to tibble).}

\item{strata}{The grouping variable of interest (converted to factor),
if NULL will make one column table.}

\item{vars}{A list of variables to summarize, e.g. c("Age","sex","WASI").}

\item{var_names}{An optional list to rename the variable colnames in the
output table, e.g. c("Age (years)","Sex","IQ"). Must match \code{vars} in length.
If not supplied, \code{vars} will be printed as is.}

\item{factor_vars}{An optional list of variables from \code{vars} to use
as class factor, e.g. c("sex"). Note that any character, factor, or
logical class variables will be summarized as categorical by default.}

\item{round_n}{The number of decimal places to round output to (default=2).}

\item{es_col}{Include a column for effect size
of group difference? (default=T).}

\item{p_col}{Include a column for p-value of
group difference? (default=TRUE).}

\item{stars}{Where to include stars indicating
significance of group differences.
Options: "col"=separate column (default), "name"= append to variable name,
"stat"= append to group difference statistic, "none" for no stars.}

\item{html}{Format as html in viewer or not
(default=FALSE, print in console),
needs library(htmlTable) installed.}
}
\value{
Output Table 1
}
\description{
The \code{FullTable1} function can be used to create a Table1 for
scientific publication. This is intended to summarize demographic
and other variables (\code{vars}) split by a grouping variable (\code{strata})
from an input dataset (\code{data}).
Continuous variables will be summarized as mean (SD)
and tested across groups using t-test or ANOVA (for 3+ level \code{strata}).
Categorical variables will be summarized as N (\%)
and tested across groups as chi-squared.
Effect sizes for group differences will be calculated as Cohen's d,
partial eta-squared, Odds Ratio, Cramer's V depending on the test.
Requires \code{tidyverse} and \code{stats} libraries.
}
\examples{
FullTable1(
  data = psydat,
  vars = c("Age", "Height", "depressT"), strata = "Sex"
)
FullTable1(
  data = psydat,
  vars = c("Age", "Height", "depressT"), strata = "Sex"
)
FullTable1(
  data = psydat, vars = c("Age", "Sex", "Height", "depressT"),
  var_names = c("Age (months)", "Sex", "Height (inches)", "Depression T"),
  strata = "Income", stars = "name", p_col = FALSE
)
tmp <- FullTable1(data = psydat,
  vars = c("Age", "Height", "depressT"), strata = "Sex")
  tmp$caption <- "Write your own caption"
  #print(htmlTable(x$table, useViewer=T, rnames=F,caption=x$caption, pos.caption="bottom"))
}
