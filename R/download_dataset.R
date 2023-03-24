"Downloads data csv data from the web to a local filepath a csv 
Usage: R/download_dataset.R --url=<url> --out_dir=<out_dir>
Options:
--url=<url>              URL from where to download the data (must be in standard csv format)
--out_dir=<out_dir>    Path (including filename) of where to locally write the file
" -> doc

library(here)
library(docopt)
source(here("R/eda.R"))



# download and read raw dataset

opt <- docopt(doc)

main <- function(url, out_dir) {
  
  if (!dir.exists(dirname(out_dir))) {
    dir.create(dirname(out_dir), recursive = TRUE)
  }
  
  data <- read_dataset(url, out_dir)

}
main(opt[["--url"]], opt[["--out_dir"]])