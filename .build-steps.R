
# deal with compression -- DONE
paths <- sort(Sys.glob(c("data/gf*.RData")))
tools::checkRdaFiles(paths)
tools::resaveRdaFiles(paths)

# for qpdf
Sys.setenv(R_GSCMD="C:/Program Files/gs/gs9.53.3/bin/gswin64c.exe")  # home
Sys.setenv(R_GSCMD="C:/Program Files/gs/gs9.56.0/bin/gswin64c.exe")  # work
# qpdf need to be on the PATH
Sys.which(Sys.getenv("R_QPDF", "qpdf"))


args = c('--compact-vignettes=both')  # don't really need this anymore
devtools::check(args=args)

# no longer need --resave-data
args = c('--compact-vignettes=both')
devtools::build(args=args)

# then, test with win builder
devtools::check_win_devel(args=args)



# submit to cran
devtools::release()

