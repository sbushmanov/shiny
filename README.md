vizualizeReturns
=====
### R/Shiny app for vizualization of historical stock and bond returns

Coursera Data Products Project.  

Extensive documentaion on how to use the application is embedded to the application (menu tab titled "Stocks vs Bonds Documentation")

To run the shiny application found at http://sbushmanov.shinyapps.io/returns/ 
you need three files, found in `"/returns"` folder :

- `global.R` : to download and preprocess data  
- `ui.R` : part of shiny app. User interface to obtain intercative data from user inputs  
- `server.R` : part of shiny app. Calculates outputs and passes them back to `ui.R` based
on user inputs.

The code for shiny app is fully reproducible.
