
# Titanic Dataset Visualization with R
    This repository provides a collection of R scripts for visualizing the Titanic dataset using ggplot2 and plotly. The visualizations explore various aspects of the dataset, such as survival rates, age distributions, passenger classes, and fares.

## Overview
    The Titanic dataset contains detailed information about the passengers aboard the Titanic, including their age, class, fare, survival status, and more. Through these visualizations, we aim to uncover insights into the factors that influenced survival and the demographic composition of the passengers.

# Visualizations Included
    * # Survival Count Bar Plot

        Description: Displays the count of passengers who survived versus those who did not.

            ggplot(titanic_data, aes(x = as.factor(survived))) +
            geom_bar() +
            xlab("Survived") +
            ylab("Count") +
            ggtitle("Count of Survived Passengers on the Titanic")

    * # Age Distribution Histogram

        Description: Shows the distribution of passengers' ages with bins of 5 years.

          ggplot(titanic_data, aes(x = age)) +
          geom_histogram(binwidth = 5, fill = "blue", color = "black") +
          xlab("Age") +
          ylab("Count") +
          ggtitle("Age Distribution of Passengers")

    * # Boxplot of Age by Survival Status

      Description: Compares the age distribution of passengers who survived and those who did not.

        ggplot(titanic_data, aes(x = as.factor(survived), y = age)) +
        geom_boxplot() +
        xlab("Survived") +
        ylab("Age") +
        ggtitle("Age Distribution by Survival Status")

    * # Violin Plot of Age by Survival Status

      Description: Provides a more detailed look at the age distribution by survival status, including the density of the distribution.

        ggplot(titanic_data, aes(x = as.factor(survived), y = age)) +
        geom_violin() +
        xlab("Survived") +
        ylab("Age") +
        ggtitle("Age Distribution by Survival Status")
    * # Passenger Class Distribution Bar Plot

      Description: Illustrates the distribution of passengers across different classes.

        ggplot(titanic_data, aes(x = as.factor(pclass))) +
        geom_bar(fill = "red") +
        xlab("Passenger Class") +
        ylab("Count") +
        ggtitle("Count of Passengers by Class")

    * # Embarkation Point Distribution Bar Plot

      Description: Shows how many passengers embarked from each point (C = Cherbourg, Q = Queenstown, S = Southampton).

        ggplot(titanic_data, aes(x = embarked)) +
        geom_bar(fill = "purple") +
        xlab("Embarkation Point") +
        ylab("Count") +
        ggtitle("Count of Passengers by Embarkation Point")

    * # Scatter Plot of Age vs. Fare

      Description: Examines the relationship between passengers' ages and the fares they paid.

        ggplot(titanic_data, aes(x = age, y = fare)) +
        geom_point(color = "red") +
        xlab("Age") +
        ylab("Fare") +
        ggtitle("Scatter Plot of Age vs. Fare")

    * # Facet Grid Scatter Plot of Age vs. Fare by Survival Status

      Description: Adds a facet grid to the scatter plot to separate passengers by survival status.

        ggplot(titanic_data, aes(x = age, y = fare)) +
        geom_point() +
        facet_grid(. ~ survived) +
        xlab("Age") +
        ylab("Fare") +
        ggtitle("Scatter Plot of Age vs. Fare by Survival Status")

    * # Facet Grid of Age vs. Fare by Passenger Class

      Description: Shows the relationship between age and fare, with separate facets for each passenger class.

        ggplot(titanic_data, aes(x = age, y = fare)) +
        geom_point(color = "green") +
        facet_grid(. ~ pclass) +
        xlab("Age") +
        ylab("Fare") +
        ggtitle("Scatter Plot of Age vs. Fare by Passenger Class")

    * # Combined Scatter Plot of Age vs. Fare by Passenger Class

      Description: Displays a scatter plot of age versus fare, color-coded by passenger class.

        ggplot(titanic_data, aes(x = age, y = fare, color = as.factor(pclass))) +
        geom_point(size = 2) +
        scale_color_manual(values = c("1" = "red", "2" = "orange", "3" = "green")) +
        xlab("Age") +
        ylab("Fare") +
        ggtitle("Age vs. Fare by Passenger Class") +
        labs(color = "Passenger Class")

    * # Interactive Scatter Plot of Age vs. Fare by Passenger Class and Sex

      Description: An interactive version of the scatter plot, using plotly, which allows exploring the data by passenger class and sex.

        ggplotly(
          ggplot(titanic_data, aes(x = age, y = fare, color = sex)) +
          geom_point() +
          facet_wrap(~ pclass) +
          xlab("Age") +
          ylab("Fare") +
          ggtitle("Age vs. Fare by Passenger Class and Sex")
        )

    * # Stacked Bar Plot of Survival by Passenger Class

      Description: Visualizes the survival proportions across different passenger classes using a stacked bar plot.

        ggplot(titanic_data, aes(x = pclass, fill = as.factor(survived))) +
        geom_bar(position = "fill") +
        xlab("Passenger Class") +
        ylab("Proportion") +
        labs(fill = "Survived") +
        ggtitle("Survival Proportions by Passenger Class")

    * # Interactive Stacked Bar Plot of Survival by Passenger Class

      Description: An interactive version of the stacked bar plot using plotly, showing survival proportions by passenger class with hover information.

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

    * # Dependencies
      The scripts use the following R packages:

      tidyverse for data manipulation and visualization.
      ggplot2 for static visualizations.
      plotly for interactive visualizations.
      To install the necessary packages, run:
        install.packages(c("tidyverse", "plotly"))
      Usage
        To reproduce the visualizations, run the provided R script(s) after loading the cleaned_titanic_data.csv. The scripts will generate various plots and, in some cases, save them to files or open them in an interactive viewer.

## Summary
This repository showcases different ways to visualize the Titanic dataset, helping to reveal trends and patterns in the data. The combination of static and interactive plots provides a comprehensive toolset for exploring this historical dataset.
