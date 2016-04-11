# tdclientr package [![CRAN Version](http://www.r-pkg.org/badges/version/tdclientr)](http://cran.rstudio.com/web/packages/tdclientr)  ![](http://cranlogs.r-pkg.org/badges/grand-total/tdclientr) ![](https://travis-ci.org/teramonagi/tdclientr.svg?branch=master)

Treasure Data API library for R

Under construction

## Installation
tdclientr package isn't available from CRAN yet, but you can get it from github with:
```R
install.packages("devtools")
devtools::install_github("teramonagi/tdclientr")
```

## Example
Please see also the API manual at [Treasure Data Documentation](https://docs.treasuredata.com/articles/rest-api).

### Generate td client
TreasureData API key will be read from environment or usual R variable `TD_API_KEY`, if api_key variable is `NULL` via arguments to `td()`.
```R
#Generate td client
client <- td(database="sample_datasets")
```

### Listing jobs
```R
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

## Contributing
- Fork it ( https://github.com/teramonagi/tdclientr/fork )
- Create your feature branch (git checkout -b my-new-feature)
- Commit your changes (git commit -am 'Add some feature')
- Push to the branch (git push origin my-new-feature)
- Create a new Pull Request
