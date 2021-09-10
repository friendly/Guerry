# deal with compression
paths <- sort(Sys.glob(c("data/gf*.RData")))
tools::checkRdaFiles(paths)

resaveRdaFiles(paths)

devtools::check()

args = c('--resave-data')
devtools::build(args = args)

# then, test with win builder
args = c('--resave-data')
devtools::check_win_devel(args=args)


# submit to cran
devtools::release(args=args)

