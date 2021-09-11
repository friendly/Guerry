
# deal with compression
paths <- sort(Sys.glob(c("data/gf*.RData")))
tools::checkRdaFiles(paths)

tools::resaveRdaFiles(paths)

# for qpdf
Sys.setenv(R_GSCMD="C:/Program Files/gs/gs9.53.3/bin/gswin64c.exe")



args = c('--compact-vignettes=both')
devtools::check(args=args)

# no longer need --resave-data
args = c('--compact-vignettes=both')
devtools::build(args=args)

# then, test with win builder
devtools::check_win_devel(args=args)



# submit to cran
devtools::release(args=args)

