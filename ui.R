source("chooser.R")
diagnose <<- read.csv("data/incnar.csv")$condition
nepisode <- 15000
pre <- runif(nepisode, 0, 1)
ob <- rep(0, nepisode)
for (i in seq(nepisode)) ob[i] <- runif(1, exp(pre[i])/2, exp(pre[i]))/exp(1)
    

mock <<- data.table(ob=ob, pre=pre,diag= 
                   diagnose[round(runif(nepisode, 1, length(diagnose)))])
                   

fluidPage(
 titlePanel("Choose multiple diagnoses: "),
  
 sidebarLayout(sidebarPanel(
   # Generate a row with a sidebar
  chooserInput("mychooser", "Diagnoses", "Selected diagnoses",
    diagnose, c(), size = 10, multiple = TRUE)), 
    mainPanel(
              plotOutput("someplot")
               )
    ),

  actionButton("interactive", "Interactive plot"), 
  plotOutput("interactive")
)
