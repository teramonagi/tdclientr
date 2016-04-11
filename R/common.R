get <- function(api_key, url)
{
  GET(url, config=add_headers(AUTHORIZATION=paste0("TD1 ", api_key)))
}

post <- function(api_key, url, body)
{
  POST(url, config=add_headers(AUTHORIZATION=paste0("TD1 ", api_key)), body=body)
}

schema <- function(hive_result_schema)
{
  df <- str_extract_all(hive_result_schema, "\\w+")[[1]]
  data.frame(
    name=df[seq(1, length(df), by=2)],
    type=df[seq(2, length(df), by=2)]
  )
}

to_posixct <- function(x)
{
  lubridate::parse_date_time(x, orders="ymd hms")
}
