##shannon diversity shiny app
##demonstrte how index is calculated
#change values of evenness, abundance and richness and outputs H
#plot==
##list variables

library(shiny)
library(DT)
library(ggplot2)

guild<-c("insect","fruit","nectar","meat","seed","leaf","all")

shinyServer(function(input,output,session){
  ##generate data from inputs
  guilds<-c("Insect","Meat","Fruit","Nectar","Seed","Leaf","All")
  fram <- data.frame(guilds)
  row.names(fram) <- NULL
  
  # The important part of reactiveValues()
  values <- reactiveValues()
  values$df <- fram
  observe({
    
    # your action button condition
    if(input$addButton > 0) {
      # create the new line to be added from your inputs
      abundance <- c(input$insect, input$meat, input$fruit, input$nectar, input$seed, input$leaf, input$all)
      total_obs<- input$insect+input$meat+input$fruit+input$nectar+input$seed+input$leaf+input$all
      proportion <- (abundance/total_obs)
      lnpi <- log(proportion)
      pilnpi <- proportion*lnpi
      sumof <- sum(pilnpi)
      free<-cbind(guilds,abundance,proportion,lnpi,pilnpi)
      # update your data
      # note the unlist of newLine, this prevents a bothersome warning message that the rbind will return regarding rownames because of using isolate.
      isolate(values$df <- cbind(as.data.frame(fram), abundance, proportion, lnpi, pilnpi))
    }
  })
  output$table <- renderTable({values$df}, include.rownames=F)
  
  output$plot <-renderPlotly(
    ggplotly(ggplot(values$df,aes(x=1,y=proportion,fill=guilds))+geom_bar(stat="identity",position="stack",width=.3)+theme_minimal()+
               coord_flip()+theme(legend.position="none",axis.text=element_blank())+labs(x=" ",y="Proportion")+scale_fill_brewer(palette="Dark2"))
    
  )

  ###latex equations
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
  #plot guild as proportion data
  output$plot <-renderPlotly(
    ggplotly(ggplot(values$df,aes(x=1,y=proportion,fill=guilds))+geom_bar(stat="identity",position="stack",width=.3)+theme_minimal()+
               coord_flip()+theme(legend.position="none",axis.text=element_blank())+labs(x=" ",y="Proportion")+scale_fill_brewer(palette="Dark2"))
    
  )

})
