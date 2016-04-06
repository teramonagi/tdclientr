#' Create Treasure Data client
#'
#' aaaaa
#'
#'@export
td_job <- function(client, job_id, database)
{
  structure(list(key=client$key, db=database, id=job_id), class=c("job", "td"))
}

#'@export
is.job <- function(x){inherits(x, "job")}

#'@export
status <- function(job)
{
  url <- paste0(url_api, "job/status/", job$id)
  response <- get(job$key, url)
  result <- jsonlite::fromJSON(content(response, "text"))
  result$cpu_time <- if(is.null(result$cpu_time)){0}else{result$cpu_time}
  as.data.frame(result)
}

setOldClass("job")
#'@export
setMethod(show, "job", function(object){
  job <- object
  url <- paste0(url_api, "job/show/", job$id)
  response <- get(job$key, url)
  result <- jsonlite::fromJSON(content(response, "text"))
  result$cpu_time <- if(is.null(result$cpu_time)){0}else{result$cpu_time}
  result$organization <- if(is.null(result$organization)){""}else{result$organization}
  result$debug$stderr <- if(is.null(result$debug$stderr)){0}else{result$debug$stderr}
  cbind(
    as.data.frame(result[names(result) != "debug"], stringsAsFactors=FALSE),
    as.data.frame(result$debug, stringsAsFactors=FALSE)
  )
})

#'@export
kill <- function(job)
{
  url <- paste0(url_api, "job/kill/", job_id)
  response <- post(api_key, url, NULL)
  as.data.frame(jsonlite::fromJSON(content(response, "text")))
}

#'@export
result <- function(job, wait=TRUE)
{
  url <- paste0(url_api, sprintf("job/result/%s?format=csv", job$id))
  response <- get(job$key, url)
  df <- show(job)
  res <- as.data.frame(fread(content(response, "text")))
  colnames(res) <- schema(df$hive_result_schema)$name
  res
}
