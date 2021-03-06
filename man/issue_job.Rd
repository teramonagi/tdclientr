% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/td.R
\name{issue_job}
\alias{issue_job}
\title{Issue queries}
\usage{
issue_job(client, query, database = NULL, type = "presto", priority = 0,
  wait = FALSE)
}
\arguments{
\item{client}{Treasure Data client generated by td function.}

\item{query:}{query string}

\item{database(optional):}{name of the database}

\item{type(optional):}{the job type (‘hive’ or ‘presto’)}

\item{priority(optional):}{priority of the job. -2 (VERY LOW) to 2 (VERY HIGH). The default is 0 (NORMAL).}
}
\description{
Issue queries
}

