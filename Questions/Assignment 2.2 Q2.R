# -------------------------------------------------------------------------
# -- University of San Diego                                             --
# -- ADS500A: Probability & Statistics for Data Science                  --
# -- Prof. Matthew C. Vanderbilt, MSBA                                   --
# --                                                                     --
# -- SOME CODE IS ADAPTED FROM MICROSOFT COPILOT PROMPTS                 --
# -------------------------------------------------------------------------
# VERSION 202509171219


# INSTALL & LOAD NECESSARY PACKAGES ---------------------------------------

# Libraries (or packages) extend the functionality of base R. Each library
# must be installed once per machine through the install.packages()
# function. Each instance of R must activate the library by using the
# library() function.

libraries <- c(                  # -- CREATE A VECTOR OF DESIRED LIBRARIES
  "broom",                       # extracts lm information
  "car",                         # vif function
  "corrplot",
  "dplyr",
  "glue",                        # enables dynamic strings
  "ggplot2",
  "httr",                        # NOTE PURPOSE
  "jsonlite",                    # NOTE PURPOSE
  "kableExtra",                  # formats tables
  "knitr",                       # formats tables (includes kable)
  "mosaic",                       # contains favstats() + many others
  "nortest",                     # Anderson-Darling test of normality
  "openxlsx",                    # reading and writing from and to Excel
  "plotly",                      # used for 3d plots
  "purrr",                       # elegant loops
  "random",                      # use of Random.org
  "readxl",
  "scales",                      # elegant loops and stdcoef; currency formatting
  "supernova",
  "tibble",
  "tidyr",
  "tidyverse",                   # REMOVE LIBRARIES THAT ARE ALREADY IN TIDYVERSE
  "truncnorm"                    # NOTE PURPOSE
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

filePath <- "~/Academics/USD/ADS-500A-01-SUM25/RStudio"
setwd(filePath)



# -------------------------------------------------------------------------
# ORIGINAL QUESTION INTERPRETATION ----------------------------------------
# At a particular San Diego intersection, only 40% of drivers are found  --
# to come to a complete stop when no other cars are visible. Of 20       --
# randomly observed drivers, what is the probability that at least six   --
# will come to a complete stop at the intersection?                      --
# -------------------------------------------------------------------------

# SET STATIC VARIABLES ----------------------------------------------------

n <- 20      # number of observed trials (drivers)
p <- .40     # probability of "success" (a complete stop)
x <- 6       # evaluation figure
x.Each <- 0:n # vector of possible values within the vector space


# CALCULATE P(X >= 6) -----------------------------------------------------

# pbinom() calculates the cumulative probability
p.sbObserved <- 1 - pbinom(x - 1, size = n, prob = p)

# vector probability for each possible success
p.Each <- dbinom(
  x = x.Each,
  size = n,
  prob = p
)


# GENERATE LABELS ---------------------------------------------------------

label.AtLeast <- paste0(
  "At least ",
  x
)

label.LessThan <- paste0(
  "Less than ",
  x
)

pmfData.color <- factor(
  ifelse(
    x.Each >= x,
    label.AtLeast,
    label.LessThan
  ),
  levels = c(
    label.AtLeast,
    label.LessThan
  )
)

chart.color.fill <- setNames(
  c(
    "#E69F00",
    "#56B4E9"
  ),
  c(
    label.AtLeast,
    label.LessThan
  )
)

chart.subtitle <- paste0(
  "Where ",
  "n = ",
  n,
  " drivers; ",
  "p = ",
  100 * p,
  "% of successes; ",
  "and probability is for at least ",
  x,
  " drivers (",
  round(100 * p.sbObserved, 2),
  "%)"
)


# GENERATE A DATAFRAME FOR VISUALIZATION ----------------------------------

pmfData <- data.frame(
  Stops = x.Each,
  Probability = p.Each,
  Highlight = pmfData.color
)


# GENERATE VISUALIZATION OF PROBABILITIES ---------------------------------

ggplot(
  pmfData,
  aes(
    x = Stops,
    y = Probability,
    fill = Highlight
  )
) +
  geom_bar(
    stat = "identity",
    color = "black"
  ) +
  scale_fill_manual(
    values = chart.color.fill
  ) +
  labs(
    title = "Binomial Distribution of Complete Stops (Successes)",
    subtitle = chart.subtitle,
    x = "Number of Complete Stops (Successes)",
    y = "Probability",
    fill = "Evaluated Value"
  ) +
  theme_minimal(
    base_size = 14
  )



# -------------------------------------------------------------------------
# ALTERNATIVE QUESTION INTERPRETATION -------------------------------------
# At a particular San Diego intersection, only 40% of drivers are found  --
# to come to a complete stop when no other cars are visible. Of 20       --
# randomly observed drivers, what is the probability that exactly nine   --
# drivers will come to a complete stop at the intersection?              --
# -------------------------------------------------------------------------
# LATEX MATH --------------------------------------------------------------
# P(X = x) = \binom{n}{x} \cdot p^x \cdot (1 - p)^{n - x} \Rightarrow    --
# P(X = 9) = \binom{20}{9} \cdot 0.4^9 \cdot 0.6^{11} \equiv \frac{20!}  --
# {9!(20 - 9)!} \cdot 0.4^9 \cdot 0.6^{11}=.1597                         --
# -------------------------------------------------------------------------


# SET STATIC VARIABLES ----------------------------------------------------

n <- 20      # number of observed trials (drivers)
p <- .40     # probability of "success" (a complete stop)
x <- 9       # evaluation figure
x.Each <- 0:n # vector of possible values within the vector space


# CALCULATE P(X = 9) ------------------------------------------------------

# dbinom() calculates the exact probability
p.sbObserved <- dbinom(
  x = x,
  size = n,
  prob = p
)

# vector probability for each possible success
p.Each <- dbinom(
  x = x.Each,
  size = n,
  prob = p
)


# GENERATE LABELS ---------------------------------------------------------

label.Exactly <- paste0(
  "Exactly ",
  x
)

label.OtherThan <- paste0(
  "Other than ",
  x
)

pmfData.color <- factor(
  ifelse(
    x.Each == x,
    label.Exactly,
    label.OtherThan
  ),
  levels = c(
    label.Exactly,
    label.OtherThan
  )
)

chart.color.fill <- setNames(
  c(
    "#E69F00",
    "#56B4E9"
  ),
  c(
    label.Exactly,
    label.OtherThan
  )
)

chart.subtitle <- paste0(
  "Where ",
  "n = ",
  n,
  " drivers; ",
  "p = ",
  100 * p,
  "% of successes; ",
  "and probability is for exactly ",
  x,
  " drivers (",
  round(100 * p.sbObserved, 2),
  "%)"
)


# GENERATE A DATAFRAME FOR VISUALIZATION ----------------------------------

pmfData <- data.frame(
  Stops = x.Each,
  Probability = p.Each,
  Highlight = pmfData.color
)


# GENERATE VISUALIZATION OF PROBABILITIES ---------------------------------

ggplot(
  pmfData,
  aes(
    x = Stops,
    y = Probability,
    fill = Highlight
  )
) +
  geom_bar(
    stat = "identity",
    color = "black"
  ) +
  scale_fill_manual(
    values = chart.color.fill
  ) +
  labs(
    title = "Binomial Distribution of Complete Stops (Successes)",
    subtitle = chart.subtitle,
    x = "Number of Complete Stops (Successes)",
    y = "Probability",
    fill = "Evaluated Value"
  ) +
  theme_minimal(
    base_size = 14
  )


