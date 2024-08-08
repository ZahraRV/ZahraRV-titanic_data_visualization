titanic_data<-read.csv("cleaned_titanic_data.csv")
install.packages("tidyverse")
library(tidyverse)

ggplot(titanic_data,aes(x=as.factor(survived)))+
geom_bar() +
  xlab("survived")+
ylab("count")+
ggtitle("countof survived pasenger on the titanic")

ggplot(titanic_data, aes(x = age)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  xlab("Age") +
  ylab("count") +
  ggtitle("Age Distribution of Passengers")

ggplot(titanic_data, aes(x = as.factor(survived), y = age)) +
  geom_boxplot() +
  xlab("Survived") +
  ylab("Age") +
  ggtitle("Age Distribution by Survival Status")


ggplot(titanic_data, aes(x = as.factor(survived), y = age)) +
  geom_violin() +
  xlab("Survived") +
  ylab("Age") +
  ggtitle("Age Distribution by Survival Status")


ggplot(titanic_data, aes(x = as.factor(pclass))) +
  geom_bar(fill = "red") +
  xlab("Passenger Class") +
  ylab("Count") +
  ggtitle("Count of Passengers by Class")

ggplot(titanic_data, aes(x = embarked)) +
  geom_bar(fill = "purple") +
  xlab("Embarkation Point") +
  ylab("Count") +
  ggtitle("Count of Passengers by Embarkation Point")

ggplot(titanic_data, aes(x = age, y = fare)) +
  geom_point(color = "red") +
  xlab("Age") +
  ylab("Fare") +
  ggtitle("Scatter Plot of Age vs. Fare")

ggplot(titanic_data, aes(x = age, y = fare)) +
  geom_point() +
  facet_grid(.~survived)
  xlab("Age") +
  ylab("Fare") +
  ggtitle("Scatter Plot of Age vs. Fare")
  
  # facet Grid of Age vs. Fare by pclass 
  
  ggplot(titanic_data, aes(x = age, y = fare)) +
    geom_point(color = "green") +
    facet_grid(.~pclass)
  xlab("Age") +
    ylab("Fare") +
    ggtitle("Scatter Plot of Age vs. Fare")
  
  # Combined scatter plot of Age vs Fare by Pclass
  
  ggplot(titanic_data, aes(x = age, y = fare, color = as.factor(pclass))) +
    
    geom_point(size = 2) +
    
    scale_color_manual(values = c("1" = "red", "2" = "orange", "3" = "green")) +
    
    xlab("Age") +
    
    ylab("Fare") +
    
    ggtitle("Age vs. Fare by Passenger Class") +
    
    labs(color = "Passenger Class")
  
  install.packages("plotly")
  library(plotly)
  ggplotly(
    ggplot(titanic_data, aes(x = age, y = fare, color = sex)) +
      geom_point() +
      facet_wrap(~ pclass) +
      xlab("Age") +
      ylab("Fare") +
      ggtitle("Age vs. Fare by Passenger Class and Sex")
  )
  
  
  
  

  # Stacked Bar Plot of Survival by Passenger Class
  ggplot(titanic_data, aes(x = pclass, fill = as.factor(survived))) +
    geom_bar(position = "fill") +
    xlab("Passenger Class") +
    ylab("Proportion") +
    labs(fill = "Survived") +
    ggtitle("Survival Proportions by Passenger Class")
 View(titanic_data)
  

  # Calculate counts and percentages for interactive plot
  titanic_summary <- titanic_data %>%
    group_by(pclass, survived) %>%
    summarise(count = n()) %>%
    mutate(percentage = count / sum(count) * 100, 
           survival_status = ifelse(survived == 1, "Survived", "Did Not Survive"))
  
  # Convert to data frame
  titanic_summary <- as.data.frame(titanic_summary)
  
  # Create the interactive stacked bar plot
  plot <- plot_ly(titanic_summary, 
                  x = ~pclass, 
                  y = ~percentage, 
                  type = 'bar', 
                  color = ~as.factor(survived),
                  text = ~paste('Status:', survival_status, '<br>Percentage:', round(percentage, 2), '%'),
                  hoverinfo = 'text',
                  textposition = 'auto') %>%
    layout(barmode = 'stack',
           xaxis = list(title = 'Passenger Class'),
           yaxis = list(title = 'Percentage'),
           title = 'Survival Proportions by Passenger Class',
           legend = list(title = list(text = 'Survival Status')))
  
