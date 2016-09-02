##shannon diversity shiny app
##demonstrte how index is calculated
#change values of evenness, abundance and richness and outputs H
#plot==
##list variables

library(shiny)

shinyServer(function(input,output,session){
  output$shannon <- renderUI({
    withMathJax(helpText("Shannon Diversity: $$H' = -~\\sum_{i=1}^{S}~p_{i}*ln(p_{i})$$"))
  })
  output$simpson <- renderUI({
    withMathJax(helpText("Simpson Diversity: $$D_{1} = \\frac{1}{\\sum_{i=1}^{S}~p_{i}~^2}$$"))
  })
  output$evenness <- renderUI({
    withMathJax(helpText("Evenness: $$E_{H} = H / H_{max} = H / ln(S)$$"))
  })

  output$ex4 <- renderUI({
    invalidateLater(5000, session)
    x <- round(rcauchy(1), 3)
    withMathJax(sprintf("Make something appear here", x, pcauchy(x)))
  })

})
