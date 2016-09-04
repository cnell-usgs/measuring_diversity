#ui
library(shiny)
library(ggplot2)
library(DT)

shinyUI(fluidPage(
  titlePanel("Measuring Diversity"),
  title = 'Diversity',
  sidebarLayout(
    sidebarPanel(helpText("Measuring and comparing diversity is an important component in the field of ecology.  
Diversity indices provide a measure beyond species richness and abundance that allows us to describe ecological communities.  
                          Values of diversity are heavily influenced by the method of data collection and how this data is quantified.
                          The following diversity indices are among the most commonly used ways to express diversity, using abundance and richness data.
                          Each index varies in its' calculation and thus it is important to consider the system and question at hand before interpretation."),
                 helpText("Consider these 8 species, each represented by a different symbol. Use the inputs to set
                          either the abundance or proportion of the species in our hypothetical community to see how diversity changes"),
                 helpText("Shannon and Simpson diversity indices account for both species abundance and evenness."),
                 helpText("Select diversity index of interest:"),("Change parameters to understand how diversity measures are influenced."),
                 helpText("p is the proportion (n/N) of individuals of species 'n' divided by total individuals 'N'."),
                 helpText("s is the number of species")
                 ),
    mainPanel(align="center",
              tags$style(type="text/css",
                         ".shiny-output-error { visibility: hidden; }",
                         ".shiny-output-error:before { visibility: hidden; }"
              ),
  withMathJax(),
  div(style="display:inline-block",numericInput('insect','Insectivores',value=5,min=0,max=NA,step=1,width='80px')),
  div(style="display:inline-block",numericInput('fruit','Frugivores',value=5,min=0,max=NA,step=1,width='80px')),
  div(style="display:inline-block",numericInput('meat','Carnivores',value=5,min=0,max=NA,step=1,width='80px')),
  div(style="display:inline-block",numericInput('fruit','Frugivores',value=5,min=0,max=NA,step=1,width='80px')),
  div(style="display:inline-block",numericInput('nectar','Nectivores',value=5,min=0,max=NA,step=1,width='80px')),
  div(style="display:inline-block",numericInput('seed','Granivores',value=5,min=0,max=NA,step=1,width='80px')),
  div(style="display:inline-block",numericInput('leaf','Folivores',value=5,min=0,max=NA,step=1,width='80px')),
  div(style="display:inline-block",numericInput('all','Omnivores',value=5,min=0,max=NA,step=1,width='80px')),
  actionButton("addButton", "calculate"),
  plotlyOutput("plot",height="170px"),
  tableOutput("table"),
  uiOutput('shannon'),
  helpText("Shannon value interpretaton here"),
  uiOutput('simpson'),
  helpText("Simpson value interpretaton here"),
  helpText('The Simpson index is a dominance index, meaning that more weight is given to common species and rare species do not affect the diversity.'),
  uiOutput('evenness'),
  helpText("Evenness \\(E_{H}\\) ranges from 0 to 1, where 1 indicates that all species are present at the same abundance."),
  checkboxInput('ex5_visible', 'Show calculation', FALSE),
  helpText("Literature Cited: ")
  ))
))
