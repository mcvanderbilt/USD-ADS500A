# -------------------------------------------------------------------------
# -- University of San Diego                                             --
# -- ADS500A: Probability & Statistics for Data Science                  --
# -- Prof. Matthew C. Vanderbilt, MSBA                                   --
# -------------------------------------------------------------------------
# -- This code was generated for Question 4: "What CO2 GPM is such that  --
# -- only 3% of all vehicles exceed that level of pollution?" to show    --
# -- the difference between using the theoretical methodology based on   --
# -- the observed mean and standard deviation vs. the empirical method   --
# -- using Microsoft Excel's PERCENTILE.EXC function on the actual data. --
# -------------------------------------------------------------------------

# INSTALL & LOAD NECESSARY PACKAGES ---------------------------------------

# Libraries (or packages) extend the functionality of base R. Each library
# must be installed once per machine through the install.packages()
# function. Each instance of R must activate the library by using the
# library() function.

libraries <- c(                  # -- CREATE A VECTOR OF DESIRED LIBRARIES
  "dplyr",
  "ggplot2",
  "mosaic",                       # contains favstats() + many others
  "readxl"
)

for (
  package in libraries
) {
  if (
    !require(                    # checks if library is already installed
      package,
      character.only = TRUE,     # has R treat the vector as text not an object
      quietly = TRUE             # suppresses installation messages
    )
  ) {
    suppressMessages(
      install.packages(
        package
      )
    )
    supressMessages(
      library(                  # loads each library
        package,
        character.only = TRUE
      )
    )
  }
}

rm(                            # Clean up environment
  libraries,
  package
)

gc()                           # Frees up memory that is no longer needed


# SET WORKING DIRECTOR & FILE DETAILS -------------------------------------
# this is where your files are located

# Set a variable, filePath, to the location on your computer where the
# .csv file has been saved. For R, you must use either \\ or / between
# folder names; a single \ will cause an error.
# The example below resolves to subfolders in "My Documents" on PC.

xlPath <- "~/Academics/USD/ADS-500A-01-SUM25"
xlName <- "ads500a_data.xlsx"
xlSheet <- "vehicles_workingfile (No-0)"
setwd(xlPath)


# SET STATIC VARIABLES ----------------------------------------------------

probsQ <- .03
probs <- 1 - probsQ


# LOAD SAMPLE OBSERVATIONS ------------------------------------------------

ads500a <- read_excel(
  path = file.path(xlPath, xlName),
  sheet = xlSheet
)

str(ads500a)

# CALCULATE DESCRIPTIVE STATISTICS ----------------------------------------

ads500a.co2.stats <- round(
  favstats(
    ads500a$co2TailpipeGpm
  ),
  4
)

# CALCULATE PERCENTILES ---------------------------------------------------

ads500a.co2.obsPct <- quantile(
  x = ads500a$co2TailpipeGpm,
  probs = probs,
  type = 6 # XL method where m=p*p_k=\frac{k}{n+1}
)

ads500a.co2.theoPct <- qnorm(
  p = probs,
  mean = ads500a.co2.stats$mean,
  sd = ads500a.co2.stats$sd
)


# CREATE COMPARATIVE VISUALIZATION ----------------------------------------
# this will generate an ECDF, or Empirical Cumulative Distribution
# function, which will show how observed data is distributed without
# assumption of any underlying distribution (ex., normal)

ggplot(
  ads500a,
  aes(
    x = co2TailpipeGpm
  )
) +
  stat_ecdf(
    geom = "step",
    color = "#56B4E9", # color safe pallete for 75% cure rate
    size = 1.2
  ) +
  stat_function(
    fun = pnorm,
    args = list(
      mean = ads500a.co2.stats$mean,
      sd = ads500a.co2.stats$sd
    ),
    color = "#E69F00", # color safe pallete for 60% cure rate
    linetype = "dashed",
    size = 1
  ) +
  geom_vline(
    xintercept = ads500a.co2.obsPct,
    color = "#56B4E9",
    linetype = "dotted",
    size = 1
  ) +
  geom_vline(
    xintercept = ads500a.co2.theoPct,
    color = "#E69F00",
    linetype = "dotted",
    size = 1
  ) +
  annotate(
    "text",
    x = ads500a.co2.obsPct,
    y = 0.05,
    label = paste0(
      "Empirical 97%: ",
      round(
        ads500a.co2.obsPct,
        2
      )
    ),
    hjust = -0.1,
    color = "#56B4E9",
    size = 4
  ) +
  annotate(
    "text",
    x = ads500a.co2.theoPct,
    y = 0.10,
    label = paste0(
      "Theoretical 97%: ",
      round(
        ads500a.co2.theoPct,
        2
      ),
      " (Devore Table A.3 ≈ 692.12)"
    ),
    hjust = -0.1,
    color = "#E69F00",
    size = 4
  ) +
  labs(
    title = "Observed vs. Theoretical Emissions Probabilities",
    subtitle = paste0(
      "Calculation of the ",
      100 * probs,
      "% Percentile"
    ),
    x = "CO2 Grams per Mile (GPM)",
    y = "Cumulative Proportion"
  ) +
  theme_minimal(
    base_size = 14
  )
