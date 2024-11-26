
####################################
# global libraries used everywhere #
####################################

ppm.date <- "2023-11-01"
options(repos=paste0("https://packagemanager.posit.co/cran/",ppm.date,"/"))

global.libraries <- c("dplyr")


pkgTest <- function(x)
{
  if (!require(x,character.only = TRUE))
  {
    install.packages(x,dep=TRUE)
    if(!require(x,character.only = TRUE)) stop("Package not found")
  }
  return("OK")
}

pkgTest.github <- function(x,source)
{
  if (!require(x,character.only = TRUE))
  {
    install_github(paste(source,x,sep="/"))
    if(!require(x,character.only = TRUE)) stop(paste("Package ",x,"not found"))
  }
  return("OK")
}


results <- sapply(as.list(global.libraries), pkgTest)