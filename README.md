
<!-- README.md is generated from README.Rmd. Please edit that file -->

# easyweb

<!-- badges: start -->

<!-- badges: end -->

The goal of easyweb is to help you get started with making your
[RMarkdown
website](https://bookdown.org/yihui/rmarkdown/rmarkdown-site.html). It
uses a two column table with some information about you in order to
build a website that you can edit and polish later following
instructions from [Emily
Zabor](http://www.emilyzabor.com/tutorials/rmarkdown_websites_tutorial.html)
and from
[here](https://robertmitchellv.com/blog-building-site-with-rmarkdown.html).

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("ComunidadBioInfo/easyweb")
```

## Example

Here is an example table with the information that `easyweb::easyweb()`
requires in order to get you started with your website.

``` r
library(easyweb)

## Example easyweb table
options(width = 200)
easyweb_example
#>              tag                                                                                                                             value
#> 1           name                                                                                                           Leonardo Collado-Torres
#> 2        twitter                                                                                                                        fellgernon
#> 3         github                                                                                                                       lcolladotor
#> 4       linkedin                                                                                                                          lcollado
#> 5  googlescholar                                                                                                                      h57-MykAAAAJ
#> 6            doi                                                                                                         10.1038/s41593-018-0197-y
#> 7            doi                                                                                                                  10.1038/nbt.3838
#> 8   presentation [CDSB2019 workshop](https://github.com/ComunidadBioInfo/cdsb2019). Taught how to make R packages (TIB2019, Cuernavaca, July 2019)
#> 9   presentation                          LIIGH 2019. recount-brain and BrainSEQ Phase II scientific talk (LIIGH seminar, Juriquilla, August 2019)
#> 10         email                                                                                                             lcolladotor@gmail.com
#> 11         email                                                                                                              leo.collado@libd.org
#> 12       address                                                                                                                Baltimore, MD, USA
#> 13          blog                                                                                                     https://lcolladotor.github.io
#> 14         phone                                                                                                                   +1 123 456 7899
#> 15         phone                                                                                                                   +1 012 345 6789
#> 16      interest                                                                                                                     R programming
#> 17      interest                                                                                                                          Genomics
#> 18  introduction                                   Hello! I'm interested in teaching others how to build R packages, particularly Latin Americans.
```

Next, you can save this object into a tab-separated table and use it as
input for `easyweb::easyweb()` which will build your website in the
specified `path`.

``` r
## Create an example website directory where the files will be saved
example_website_path <- file.path(tempdir(), 'easyweb')
dir.create(example_website_path, showWarnings = FALSE)
example_tsv <- file.path(example_website_path, 'web.tsv')

## Save the example table as a file
write.table(easyweb_example, file = example_tsv, sep = '\t',
    quote = FALSE, row.names = FALSE)

## Build the website
easyweb(example_tsv, path = example_website_path, overwrite = TRUE)
```
