
# {cran}

<!-- badges: start -->
[![Project Status: Concept – Minimal or no implementation has been done
yet, or the repository is only intended to be a limited example, demo,
or
proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
<!-- badges: end -->

An R package to convert volume measurements to crans.

## Am I herring you correctly?

What’s a cran? It’s [a unit of uncleaned
herring](https://en.wikipedia.org/wiki/Cran_\(unit\)). It has nothing to
do with [the Comprehensive R Archive
Network](https://cran.r-project.org/) (CRAN).

The package depends on the {units} package
([site](https://r-quantities.github.io/units/),
[source](https://github.com/r-quantities/units/), [R
Journal](https://journal.r-project.org/archive/2016/RJ-2016-061/index.html))
for unit conversions.

## Install and use (don’t)

Assuming you've installed {remotes} and you’re an 18th Century
fisherman, install with `remotes::install_github("matt-dray/cran")`.

On load, you’re asked if you want to create the cran unit. Type `yes` and `units::install_conversion_constant()` will generate the
unit ready for you to use in your workspace.

``` r
> library(cran)
Create the 'cran' unit of measurement for this session? yes/no: yes
You're ready to measure uncleaned herring.
```

Let’s confirm that 170.5 litres is a cran:

``` r
> cran_convert(value = 170.5, unit = "L")
1 [cran]
```

How many crans in 10 pints?

``` r
> cran_convert(value = 10, unit = "pint")
0.002775229 [cran]
```

We can use {units} to convert the other way as well. How many cubic
centimetres in a cran?

``` r
> one_cran <- units::as_units(1, "cran")
> units::as_units(one_cran, "cc")
170500 [cc]
```

You can remove the cran unit at any time with `cran_remove()`. To reinstall it, use `cran_install()`.
