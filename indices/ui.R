#ui
library(shiny)

shinyUI(fluidPage(
  titlePanel("Measuring Diversity"),
  title = 'Measuring Diversity',
  sidebarLayout(
    sidebarPanel("sidebar panel",
                 helpText("Change parameters to understand how diversity measures are influenced.")
                 ),
    mainPanel("main panel",
  withMathJax(),
  helpText("Measuring and comparing diversity is an major focus in the field of ecology.  
Diversity indices provide a measure beyond species richness and abundance that allows us to describe ecological communities.  
Values of diversity are heavily influenced by the method of data collection and how this data is quantified.
           The following diversity indices are among the most commonly used ways to express diversity, using abundance and richness data.
           Each index varies in its' calculation and thus it is important to consider the system and question at hand before interpretation."),
  helpText("Shannon and Simpson diversity indices account for both species abundance and evenness"),
  uiOutput('shannon'),
  helpText("p is the proportion (n/N) of individuals of species 'n' divided by total individuals 'N'."),
  helpText("s is the number of species"),
  uiOutput('simpson'),
  helpText('The Simpson index is a dominance index, meaning that more weight is given to common species and rare species do not affect the diversity.'),
  uiOutput('evenness'),
  helpText("Evenness \\(E_{H}\\) ranges from 0 to 1, where 1 indicates that all species are present at the same abundance."),
  checkboxInput('ex5_visible', 'Show calculation', FALSE),
  uiOutput('ex4'),
  helpText("Literature Cited: ")
  ))
))
