# tdclientr [![CRAN Version](http://www.r-pkg.org/badges/version/tdclientr)](http://cran.rstudio.com/web/packages/tdclientr)

Under construction
## Package install

```R
install.packages("devtools")
devtools::install_github("teramonagi/tdclientr")
```

## Example
```R
#Generate td client
api_key <- "<your api-key>"
client <- td(api_key, "sample_datasets")

#Show job list
list_job(client)

#Show table list
list_table(client)

#Issue job
job <- issue_job(client, "select * from nasdaq limit 10;")

#Show job content
show(job)

#Check the status of job you issued
status(job)

#Get the result
result(job)

```
